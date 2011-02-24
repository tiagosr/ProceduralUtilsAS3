package com.pixelofview.utils.procedural.pseudorandom 
{
	/**
	 * Blum Blum Shub Pseudo-random Number Generator
	 * @author Tiago Rezende
	 */
	public class BlumBlumShub
	{
		public var accum:uint;
		public var M:uint;
		
		/**
		 * Creates the Blum Blum Shub PRG
		 * @param	p	a large prime number
		 * @param	q	another large prime number
		 */
		public function BlumBlumShub(p:uint, q:uint, seed:uint = 0xffffffff) 
		{
			M = p * q;
		}
		
		public function generate(seed:uint = accum):uint
		{
			accum = (seed * seed) % M;
			return accum;
		}
		
		
	}

}