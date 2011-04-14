package com.pixelofview.audio.fm 
{
	/**
	 * FM Synthesizer
	 * Wave Operator
	 * @author Tiago Rezende
	 */
	public class FMOperator
	{
		public var envelope:FMEnvelope;

		public var oscillator:FMOscillator;
		
		// true if operator uses it´s own note and octave values, instead of channel's own
		public var independent_note:Boolean;
		public var i_octave:Number; // independent octave
		public var i_note:Number; // independent note
		
		public var phase:Number;
		public var index:Number;
		public var index_offset:Number;
		public var detune:Number;
		public var multiple:Number;
		public var note_on:Number;
		
		public var lfo:FMOscillator;
		public var lfo_phase:Number;
		public var lfo_frequency:Number;
		public var lfo_amplitude_influence:Number;
		public var lfo_phase_influence:Number;
		
		public function FMOperator():void
		{
			envelope = new FMEnvelope();
			oscillator = new FMOscillator();
			lfo = new FMOscillator();
			multiple = 1.0;
		}
		
		public function reset():void
		{
			envelope.reset();
			phase = 0;
			lfo_phase = 0;
			note_on = 0;
		}
		
		public function sample(sample_delta:Number, octave:int, note:Number, phase_offset:Number, level_offset:Number) {
			if (independent_note) {
				octave = i_octave;
				note = i_note;
			}
			var frequency:Number = ((note * multiple + detune) * Math.pow(2, octave));
			var envelope_value:Number = envelope.sample(frequency, note_on);
			
			lfo_phase += lfo_frequency * sample_delta;
			var lfo_value:Number = lfo.sample(lfo_phase);
			
			phase += frequency * sample_delta;
			
			var phase2:Number = phase + phase_offset + (lfo_value * lfo_phase_influence);
			
			return (envelope_value * oscillator.sample(phase2) * index) + index_offset + level_offset + (lfo_value + lfo_amplitude_influence);
		}
	}

}