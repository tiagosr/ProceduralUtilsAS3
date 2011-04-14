package com.pixelofview.utils.procedural.pseudorandom 
{
	/**
	 * Complimentary Multiply with Carry Pseudo-Random Number Generator
	 * @author Tiago Rezende
	 */
	public class CMWC
	{
		public var multiplier:uint;
		public var accum:uint;
		public var carry:uint;
		/**
		 * Creates a CMWC generator
		 * @param	mult	multiplier (preferrably some large prime number
		 * @param	seed	a seed accumulator value (default: 0)
		 * @param	cseed	a seed carry value (default: 0)
		 */
		public function CMWC(mult:uint, seed:uint = 0, cseed:uint = 0) 
		{
			multiplier = mult;
			accum = seed;
			carry = cseed;
		}
		
		public function generate(seed:uint = accum, cseed:uint = carry):uint
		{
			var al:uint = seed & 0xffff, bl:uint = multiplier & 0xffff,
				ah:uint = seed >> 16, bh:uint = multiplier >> 16;
			var result_l:uint = (al * bl);
			var result_m:uint = ((al + ah) * (bl + bh));
			var intern_carry:uint = (result_l >> 17) + (result_m >> 1);
			result_l += result_m << 16;
			accum = result_l + c_seed;
			carry = (ah * bh) + ((result_l > accum)?0:1) + (intern_carry >> 15) + ((result_m & 0x10000)?1:0);
			accum = !accum;
			return accum;
		}
		
	}

}