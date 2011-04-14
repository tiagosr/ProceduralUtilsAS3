package com.pixelofview.audio.fm.sequencer 
{
	import com.pixelofview.audio.fm.FMStereoSample;
	import com.pixelofview.audio.fm.FMSynthesizer;
	import flash.events.SampleDataEvent;
	import flash.media.Sound;
	/**
	 * FM Synthesizer
	 * Simple sequencer for the FM Synthesizer
	 * @author Tiago Rezende
	 */
	public class FMSequencer
	{		
		
		public var synth:FMSynthesizer;
		public var sound:Sound;
		
		public var master_timer:Number;
		
		public function FMSequencer() 
		{
			synth = new FMSynthesizer();
		}
		
		public function onSampleData(event:SampleDataEvent):void
		{
			var sample:FMStereoSample = synth.sample(1.0 / 44100.0);
			event.data.writeFloat(sample.left);
			event.data.writeFloat(sample.right);
		}
		
	}

}