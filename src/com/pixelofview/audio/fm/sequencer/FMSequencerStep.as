package com.pixelofview.audio.fm.sequencer 
{
	import com.pixelofview.audio.fm.FMSynthesizer;
	/**
	 * ...
	 * @author ...
	 */
	public class FMSequencerStep
	{
		public var note:FMNote;
		public var velocity:Number; // 0, velocity changes
		
		public var effect_num:int;
		public var effect_param:Number;
		
		public function FMSequencerStep(
			note:FMNote, 
			velocity:Number = -1, 
			effect_num:int = -1, effect_param:Number = -1):void
		{
			this.note = note;
			this.velocity = velocity;
			this.effect_num = effect_num;
			this.effect_param = effect_param;
		}
		
		public function beat(old_velocity:int, synth:FMSynthesizer, channel:int):int
		{
			if (note != undefined) {
				if (note.note < 0) {
					synth.channels[channel].note_on = 0;
				} else {
					if (note.note > 0) {
						synth.channels[channel].strikeNote(note.note, velocity > 0?velocity:old_velocity);
					} else if (velocity > 0) {
						synth.channels[channel].changeVelocity(velocity);
					}
				}
			}
			
			if (effect_num >= 0) {
				return effect_beat(0.0,synth,channel);
			}
			else return 0;
		}
		
		public function effect_beat(time:Number, synth:FMSynthesizer, channel:int):int
		{
			return 0; // 0 means no need to further process this effect
		}
	}

}