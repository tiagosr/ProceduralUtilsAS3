package com.pixelofview.utils.procedural.pseudorandom 
{
	/**
	 * Wichmann-Hill Pseudo-random Number Generator
	 * Generates values from 0.0 to 1.0
	 * @author Tiago Rezende
	 */
	public class WichmannHill
	{
		public var seed1:uint, seed2:uint, seed3:uint;
		public function WichmannHill(s1:uint = 314, s2:uint = 159, s3:uint = 365) 
		{
			seed1 = s1; seed2 = s2; seed3 = s3;
		}
		public function generate():Number {
			seed1 = (seed1 * 171) % 30269;
			seed2 = (seed2 * 172) % 30307;
			seed3 = (seed3 * 170) % 30323;
			return ((seed1 / 30269.0) + (seed2 / 30307.0) + (seed3 / 30323.0)) % 1.0;
		}
	}

}