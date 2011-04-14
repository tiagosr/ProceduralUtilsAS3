package com.pixelofview.audio.fm 
{
	import com.pixelofview.utils.procedural.noise.Simplex1D;
	/**
	 * FM Synthesizer
	 * Wave Oscillator
	 * @author Tiago Rezende
	 */
	public class FMOscillator
	{
		public static const Wave_Disabled:int = 0;
		public static const Wave_Sine:int = 1;
		public static const Wave_Square:int = 2;
		public static const Wave_Triangle:int = 3;
		public static const Wave_Sawtooth:int = 4;
		public static const Wave_Noise:int = 5;
		
		public var type:int;
		public var reverse_inverse:int; // 0 = normal, 1 = reverse, 2 = inverse, 3 = reverse+inverse
		public var phase_divisions:int; // 0, 1, 2, 4
		public var division_index:int;

		// 0 = continuous wave
		// 1 = wave phase, zero phase
		// 2 = wave phase, zero phase, zero phase
		public var pulse_periods:int;

		public function FMOscillator():void
		{
			type = Wave_Disabled;
			reverse_inverse = 0;
			phase_divisions = 0;
			division_index = 0;
			pulse_periods = 0;
		}
		
		public function sample(phase:Number):Number
		{
			var level = (reverse_inverse & 1) ? -1.0 : 1.0;
			if (pulse_periods >= 1) {
				if (phase % (pulse_periods+1) > 1) {
					return 0;
				}
			}
			if (reverse_inverse & 2) {
				phase = 1.0 - phase;
			}
			if (phase_divisions > 1) {
				var phase_divisor:Number = 1.0 / phase_divisions;
				phase = ((phase + (division_index * phase_divisor) % phase_divisor) * phase_divisions);
			}
			switch(type) {
				case Wave_Disabled:
				{
					return 0;
				}
				case Wave_Sine:
				{
					return Math.sin(phase * Math.PI) * level;
				}
				case Wave_Square:
				{
					return phase % 0.5 ? -level : level;
				}
				case Wave_Triangle:
				{
					phase = phase % 1.0;
					return (phase > 0.25?(phase > 0.75?(2.0 * level * phase) - 0.5 : ( -2.0 * level * phase) + 1.0):(2.0 * level * phase));
				}
				case Wave_Sawtooth:
				{
					return ((phase % 1.0) * 2.0 * level) - 1.0; // saw tooth wave centered on 0, going from -1 to +1
				}
				case Wave_Noise:
				{
					return Simplex1D.noise(phase);
				}
				default:
				{
					return 0;
				}
			}
		}
	}

}