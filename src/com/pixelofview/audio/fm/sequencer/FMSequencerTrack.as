package com.pixelofview.audio.fm.sequencer 
{
	import com.pixelofview.audio.fm.FMSynthesizer;
	/**
	 * FM Synthesizer
	 * Channel track data for the sequencer, with instrument data
	 * @author Tiago Rezende
	 */
	public class FMSequencerTrack
	{
		public var steps:Array;
		public var instrument:FMInstrument;
		
		public function FMSequencerTrack() 
		{
			steps = new Array();
		}
		
		public function addStep(step_str:FMSequencerStep)
		{
			steps.push(step_str);
		}
		
		public function beat(beat_num:int, synth:FMSynthesizer, channel:int)
		{
			
		}
	}

}