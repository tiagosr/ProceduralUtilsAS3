package com.pixelofview.utils.procedural.pseudorandom 
{
	/**
	 * Linear Feedback Shift Register
	 * @author Tiago Rezende
	 */
	public class LFSR
	{
		public var t0:uint, t1:uint, t2:uint, t3:uint;
		public var accum:uint;
		public function LFSR(seed:uint, tap0:uint = 31, tap1:uint = 21, tap2:uint = 1, tap3:uint = 0) 
		{
			t0 = tap0;
			t1 = tap1;
			t2 = tap2;
			t3 = tap3;
			accum = seed;
		}
		
		public function generate(seed:uint = accum)
		{
			var bit:uint = ((seed >> t0) ^ (seed >> t1) ^ (seed >> t2) ^ (seed >> t3) ^ 1) & 1;
			accum = (seed << 1) + bit;
			return accum;
		}
	}

}