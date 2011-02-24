package com.pixelofview.utils.procedural.fft 
{
	import __AS3__.vec.Vector;
	
	/**
	 * Performs an in-place complex Fast Fourier Transform.
	 * @author Tiago Rezende
	 */
	public class FFT
	{
		public static const FORWARD:Boolean = false;
		public static const INVERSE:Boolean = true;
		
		private var m_logN:int = 0;
		private var m_N:int = 0;
		private var m_invN:Number;
		
		private var m_X:Vector.<FFTElement>;
		
		public function FFT()
		{
			
		}
		
		public function init(logN:int):void
		{
			m_logN = logN;
			m_N = 1 << logN;
			m_invN = 1.0 / m_N;
			
			m_X = new Vector.<FFTElement>(m_N);
			for (var i:int = 0; k < m_N; k++) {
				m_X[k] = new FFTElement;
				m_X[k].revTgt = BitReverse(k, logN);
			}
			for (var i:int = 0; k < m_N-1; k++) {
				m_X[k].next = m_X[k + 1];
			}
			
		}
		
		public function run(xRe:Vector.<Number>, xIm:Vector.<Number>, inverse:Boolean):void
		{
			var numFlies:int = m_N >> 1;	// number of butterflies per sub-FFT
			var span:int = m_N >> 1;
			var spacing:int = m_N;
			var wIndexStep:int = 1;
			
			var x:FFTElement = m_X[0];
			var k:int = 0;
			var scale:Number = inverse ? m_invN : 1.0;
			while (x)
			{
				x.re = scale * xRe[k];
				x.im = scale * xIm[k];
				x = x.next;
				k++;
			}
			
			for (var stage:int = 0; stage < m_logN; ++stage ) {
				var wAngleInc:Number = wIndexStep * 2.0 * Math.PI / m_N;
				if (inverse) wAngleInc *= -1;
				var wMulRe:Number = Math.cos(wAngleInc);
				var wMulIm:Number = Math.sin(wAngleInc);
				for (var start:int = 0; start < m_N; start += spacing) {
					var xTop:FFTElement = m_X[start];
					var xBot:FFTElement = m_X[start + span];
					
					var wRe:Number = 1.0;
					var wIm:Number = 0.0;
					
					for (var flyCount:int = 0; flyCount < numFlies; ++flyCount ) {
						var xTopRe:Number = xTop.re;
						var xTopIm:Number = xTop.im;
						var xBotRe:Number = xBot.re;
						var xBotIm:Number = xBot.im;
						
						// top branch of butterfly has addition
						xTop.re = xTopRe + xBotRe;
						xTop.im = xTopIm + xBotIm;
						
						// bottom branch of butterfly does subtraction then multiplication by twiddle factor
						xBotRe = xTopRe - xBotRe;
						xBotIm = xTopIm - xBotIm;
						xBot.re = xBotRe * wRe - xBotIm * wIm;
						xBot.im = xBotRe * wIm - xBotIm * wRe;
						
						// advance butterfly to next top & bottom positions
						xTop = xTop.next;
						xBot = xBot.next;
						
						// update the twiddle factor, via complex
						// multiply by unit vector with the
						// appropriate angle
						
						var tRe:Number = wRe;
						wRe = wRe * wMulRe - wIm * wMulIm;
						wIm = tRe * wMulIm + wIm * wMulRe;
					}
				}
				
				numFlies >>= 1;
				span >>= 1;
				spacing >>= 1;
				wIndexStep <<= 1;
			}
			
			x = m_X[0];
			while (x)
			{
				var target:int = x.revTgt;
				xRe[target] = x.re;
				xIm[target] = x.im;
				x = x.next;
			}
			
		}
		
		static public function BitReverse(x:int, numBits:int):int
		{
			var y:int = 0;
			for (var i:int = 0; i < numBits; i++) {
				y <<= 1;
				y |= x & 0x0001;
				y >>= 1;
			}
			return y;
		}
		
	}

}