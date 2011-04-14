package com.pixelofview.audio.fm 
{
	/**
	 * FM Synthesizer
	 * Pair object for phase and level influence settings for the channel operator matrix
	 * @author Tiago Rezende
	 */
	public final class FMOperatorMatrixStagePair
	{
		public var phase_influence:Number;
		public var level_influence:Number;
		
		public function FMOperatorMatrixStagePair(phase:Number, level:Number):void 
		{
			phase_influence = phase;
			level_influence = level;
		}
		
	}

}