package com.pixelofview.audio.fm.sequencer 
{
	/**
	 * ...
	 * @author ...
	 */
	public final class FMNote
	{
		// frequencies are representative of the 12-tone equal-tempered scale, in the 2nd octave
		// so they are divided by 4 to give the 0th octave range.
		public static const A:Number = 110.0 / 4.0;
		public static const As:Number = 116.54 / 4.0;
		public static const B:Number = 123.47 / 4.0;
		public static const C:Number = 130.81 / 4.0;
		public static const Cs:Number = 138.59 / 4.0;
		public static const D:Number = 146.83 / 4.0;
		public static const Ds:Number = 155.56 / 4.0;
		public static const E:Number =  164.81 / 4.0;
		public static const F:Number = 174.61 / 4.0;
		public static const Fs:Number = 185.00 / 4.0;
		public static const G:Number = 196.00 / 4.0;
		public static const Gs:Number = 207.65 / 4.0;
		
		public static const Bf:Number = As;
		public static const Cf:Number = B;
		public static const Df:Number = Cs;
		public static const Ef:Number = Ds;
		public static const Es:Number = F;
		public static const Ff:Number = E;
		public static const Gf:Number = Fs;
		public static const Af:Number = Gs / 2.0; // one octave below
		
		public var note:Number; // negative number means stop note
		public var octave:int;
		
		public function FMNote(_note:Number, _octave:int):void
		{
			note = _note; octave = _octave;
		}
		
		/**
		 * Converts a string to a note, taking care of modifiers and octave selection.
		 * String must be in the form NO, N O, or NmO, where N is note, from A through G
		 * m is modifier, # (sharp) or f (flat, always lowercase) and octave is
		 * a number from 0 to 9
		 * @param	str the string to originate the note from
		 * @return the note, or undefined.
		 */
		public static function fromString(str:String = ""):FMNote
		{
			var notes:Array = [
				Af, A, As, B, C, Cs, D, Ds, E, F, Fs, G, Gs
			];
			var selnote:int = -1;
			var oct:Number = Number(str[1]);
			var modifier:int = 0;
			if (str[1] == "#") {
				modifier = 1;
			} else if (str[1] == "f") {
				modifier = -1;
			}
			if (isNaN(oct)) {
				oct = Number(str[2]);
			}
			switch(str[0]) {
				case "a":
				case "A":
					{
						selnote = 1;
					}
					break;
				case "b":
				case "B":
					{
						selnote = 3;
					}
					break;
				case "c":
				case "C":
					{
						selnote = 4;
					}
					break;
				case "d":
				case "D":
					{
						selnote = 6;
					}
					break;
				case "e":
				case "E":
					{
						selnote = 8;
					}
					break;
				case "f":
				case "F":
					{
						selnote = 9;
					}
					break;
				case "g":
				case "G":
					{
						selnote = 11;
					}
					break;
				default:
					{
						selnote = -1;
					}
					break;
				}
			
			if(selnote>=0) {
				return FMNote(notes[selnote + modifier], int(octave));
			} else return FMNote( -1.0, 0);
		}
	}

}