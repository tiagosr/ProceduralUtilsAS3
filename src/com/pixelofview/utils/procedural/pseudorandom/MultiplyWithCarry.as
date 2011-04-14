package com.pixelofview.utils.procedural.pseudorandom 
{
	/**
	 * Multiply-With-Carry Pseudorandom Number Generator
	 * @author Tiago Rezende
	 */
	public class MultiplyWithCarry
	{
		public var multiplier:uint;
		public var accum:uint;
		public var carry:uint;
		public function MultiplyWithCarry(mult:uint, seed:uint = 0, cseed:uint = 0) 
		{
			multiplier = mult;
			accum = seed;
			carry = cseed;
		}
		
		public function generate(seed:uint = accum, c_seed:uint = carry):uint {
			var al:uint = seed & 0xffff, bl:uint = multiplier & 0xffff,
				ah:uint = seed >> 16, bh:uint = multiplier >> 16;
			var result_l:uint = (al * bl);
			var result_m:uint = ((al + ah) * (bl + bh));
			var intern_carry:uint = (result_l >> 17) + (result_m >> 1);
			result_l += result_m << 16;
			accum = result_l + c_seed;
			carry = (ah * bh) + ((result_l > accum)?0:1) + (intern_carry >> 15) + ((result_m&0x10000)?1:0);
			return accum;
		}
	}

}