package com.pixelofview.audio.fm.sequencer 
{
	import com.pixelofview.audio.fm.FMOperatorMatrixStagePair;
	import com.pixelofview.audio.fm.FMSynthesizer;
	import com.pixelofview.audio.fm.FMChannel;
	/**
	 * FM Synthesizer
	 * Instrument data for the sequencer
	 * @author Tiago Rezende
	 */
	public class FMInstrument
	{
		public var matrix:Array;
		public var operators:Array;
		public function FMInstrument() 
		{
			operators = new Array();
			
			for (var i:int = 0; i < FMChannel.OPERATOR_COUNT; i++) {
				
			}
		}
		
		public function setup(synth:FMSynthesizer, channel:uint):void
		{
			
		}
		
	}

}