package com.pixelofview.audio.fm 
{
	/**
	 * FM Synthesizer
	 * Stereo sample container
	 * @author Tiago Rezende
	 */
	public final class FMStereoSample
	{
		public var left:Number;
		public var right:Number;
		public final function FMStereoSample(_left:Number, _right:Number) 
		{
			left = _left;
			right = _right;
		}
		
		public final function add(other:FMStereoSample):void {
			left += other.left;
			right += other.right;
		}
		
		public final function scale(level:Number):void {
			left *= level;
			right *= level;
		}
	}

}