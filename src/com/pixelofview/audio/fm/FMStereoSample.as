package com.pixelofview.audio.fm 
{
	/**
	 * FM Synthesizer
	 * Stereo sample container
	 * @author Tiago Rezende
	 */
	public final class FMStereoSample
	{
		public final var left:Number;
		public final var right:Number;
		public final function FMStereoSample(left:Number, right:Number) 
		{
			this.left = left;
			this.right = right;
		}
		
		public final function add(other:FMStereoSample):void {
			left += other.left;
			right += other.right;
		}
		
		public final function scale(level:Number):void {
			left *= scale;
			right *= scale;
		}
	}

}