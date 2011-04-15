package com.pixelofview.audio.fm 
{
	import flash.media.Sound;
	import flash.events.SampleDataEvent;
	
	/**
	 * FM Synthesizer
	 * 
	 * A complete implementation of a modular Frequency Modulation 
	 * (or better, Phase Modulation) synthesizer with 32 8-operator
	 * channels, stereo, custom waveforms and LFO.
	 * This is intended for use within flash games, to replace big-ass
	 * mp3 files with tiny sequence files that produce awesome sounds
	 * in real time.
	 * 
	 * @author Tiago Rezende
	 */
	
	public class FMSynthesizer
	{
		public static const CHANNEL_COUNT:int = 32;
		public var channels:Array;
		
		public var sound:Sound;
		
		public function FMSynthesizer() 
		{
			channels = new Array();
			for (var i:int = 0; i < CHANNEL_COUNT; i++) {
				channels.push(new FMChannel());
			}
		}
		
		public function sample(sample_delta:Number):FMStereoSample {
			var value:FMStereoSample = new FMStereoSample(0, 0);
			
			for (var i:int = 0; i < CHANNEL_COUNT; i++) {
				value.add(channels[i].sample(sample_delta));
			}
			
			value.scale(1.0 / 32.0);
			
			return value;
		}
		
		public function setupSound():void {
			sound = new Sound();
			sound.addEventListener(SampleDataEvent.SAMPLE_DATA, onSampleData);
			sound.play();
		}
		
		public function onSampleData(event:SampleDataEvent):void {
			var sdata:FMStereoSample = sample(1.0 / 44100.0);
			event.data.writeFloat(sdata.left);
			event.data.writeFloat(sdata.right);
		}
	}

}