package com.pixelofview.audio.fm.test 
{
	import com.pixelofview.audio.fm.FMSynthesizer;
	import flash.display.MovieClip;
	
	/**
	 * FM Synthesizer
	 * Test suite for the synthesizer
	 * @author Tiago Rezende
	 */
	public class TestFM extends MovieClip
	{
		private var synth:FMSynthesizer;
		
		public function TestFM() 
		{
			synth = new FMSynthesizer();
		}
		
		public function setup():void {
			synth.setupSound();			
		}
	}

}