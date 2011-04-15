package com.pixelofview.audio.fm.sequencer 
{
	import flash.utils.Dictionary;
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
		
		public static const Bb:Number = As;
		public static const Cb:Number = B;
		public static const Db:Number = Cs;
		public static const Eb:Number = Ds;
		public static const Eb:Number = F;
		public static const Fb:Number = E;
		public static const Gb:Number = Fs;
		public static const Ab:Number = Gs / 2.0; // one octave below
		
		public var note:Number; // negative number means stop note
		public var octave:int;
		
		public static const NOTES:Dictionary = new Dictionary();
		{
			NOTES["A"] = A;
			NOTES["B"] = B;
			NOTES["C"] = C;
			NOTES["D"] = D;
			NOTES["E"] = E;
			NOTES["F"] = F;
			NOTES["G"] = G;
			NOTES["A#"] = As;
			NOTES["Bb"] = Bb;
			NOTES["B#"] = Bs;
			NOTES["Cb"] = Cb;
			NOTES["C#"] = Cs;
			NOTES["Db"] = Db;
			NOTES["D#"] = Ds;
			NOTES["Eb"] = Eb;
			NOTES["E#"] = Es;
			NOTES["Fb"] = Fb;
			NOTES["F#"] = Fs;
			NOTES["Gb"] = Gb;
			NOTES["G#"] = Gs;
			NOTES["."] = 0.0; // hold note
			NOTES["-"] = -1.0; // stop note
		};
		
		
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
			var freq:Number = NOTES.find(str.substring(0,2));
			if (freq == undefined) {
				freq = NOTES[str.substring(0, 1)];
			}
			return FMNote( -1.0, 0);
		}
	}

}