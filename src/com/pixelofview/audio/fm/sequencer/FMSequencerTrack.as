package com.pixelofview.audio.fm.sequencer 
{
	import com.pixelofview.audio.fm.FMSynthesizer;
	/**
	 * ...
	 * @author ...
	 */
	public class FMSequencerTrack
	{
		public var steps:Array;
		
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