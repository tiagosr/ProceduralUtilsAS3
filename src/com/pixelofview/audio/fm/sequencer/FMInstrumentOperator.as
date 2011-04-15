package com.pixelofview.audio.fm.sequencer 
{
	import com.pixelofview.audio.fm.FMChannel;
	import com.pixelofview.audio.fm.FMOperatorMatrixStagePair;
	/**
	 * FM Synthesizer
	 * Operator data for instrument in the sequencer
	 * @author Tiago Rezende
	 */
	public class FMInstrumentOperator
	{
		public var stage_map:Array;
		
		public var index:Number;
		public var index_offset:Number;
		
		public var multiplier:Number;
		public var detune:Number;
		
		public var independent:Boolean;
		public var i_octave:Number;
		public var i_note:Number;
		
		public var oscillator:FMInstrumentOscillator;
		public var lfo:FMInstrumentOscillator;
		
		public function FMInstrumentOperator() 
		{
			stage_map = new Array();
			for (var i:int = 0; i < FMChannel.OPERATOR_COUNT + 1; i++) {
				for (var j:int = 0; j < FMChannel.OPERATOR_COUNT; i++) {
					stage_map.push(0);
				}
			}
			oscillator = new FMInstrumentOscillator();
			lfo = new FMInstrumentOscillator();
		}
		
	}

}