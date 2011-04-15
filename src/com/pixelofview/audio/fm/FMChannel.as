package com.pixelofview.audio.fm 
{
	/**
	 * FM Synthesizer
	 * Sound Channel
	 * @author Tiago Rezende
	 */
	public class FMChannel
	{
		public static const OPERATOR_COUNT:int = 8;
		
		public var matrix:FMOperatorMatrix;
		public var volume:Number;
		public var left:Number;
		public var right:Number;
		public var octave:int;
		public var note:Number;
		public var velocity:Number;
		
		public function FMChannel():void
		{
			matrix = new FMOperatorMatrix(OPERATOR_COUNT);
			volume = 0;
			left = 1.0;
			right = 1.0;
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
		public function changeVelocity(new_velocity:Number):void {
			velocity = new_velocity;
		}
		public function releaseNote():void {
			velocity = 0.0;
		}
		public function setPanning(panning:Number):void
		{
			left = 1.0 - panning;
			right = 1.0 + panning;
			if (left > 1.0) left = 1.0;
			if (left < 0.0) left = 0.0;
			if (right > 1.0) right = 1.0;
			if (right < 0.0) right = 0.0;
			
		}
		public function sample(sample_delta:Number):FMStereoSample
		{
			var level:Number = matrix.sample(sample_delta, octave, note);
			return new FMStereoSample(level*left, level*right);
		}
	}

}