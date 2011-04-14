package com.pixelofview.audio.fm 
{
	/**
	 * FM Synthesizer
	 * Sound Channel
	 * @author Tiago Rezende
	 */
	public class FMChannel
	{
		public var matrix:FMOperatorMatrix;
		public var volume:Number;
		public var panning:Number;
		public var octave:int;
		public var note:Number;
		public var velocity:Number;
		
		public function FMChannel():void
		{
			matrix = new FMOperatorMatrix(8);
			volume = 0;
			panning = 0;
			octave = 0;
			note = 0;
			velocity = 0;
		}
		
		public function strikeNote(new_note:Number, new_octave:int, new_velocity:Number):void
		{
			note = new_note;
			octave = new_octave;
			velocity = new_velocity;
			matrix.reset();
		}
		public function changeVelocity(new_velocity:Number) {
			velocity = new_velocity;
		}
		public function releaseNote() {
			velocity = 0.0;
		}
		public function sample(sample_delta:Number):FMStereoSample {
			var level:Number;
		}
	}

}