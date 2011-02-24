package com.pixelofview.utils.procedural.fft 
{
	/**
	 * FFT Linked List element
	 * @author Tiago Rezende
	 */
	public class FFTElement
	{
		public var re:Number = 0.0;			// Real component
		public var im:Number = 0.0;			// Imaginary component
		public var next:FFTElement = null;	// next element of the linked list
		public var revTgt:int;				// target position post-bit-reversal
		
	}

}