package com.pixelofview.audio.fm 
{
	/**
	 * FM Synthesizer
	 * Note Envelope
	 * @author Tiago Rezende
	 */
	public class FMEnvelope
	{
		
		public var 
			attack_rate:Number, total_level:Number, 
			decay_rate:Number, sustain_level:Number,
			sustain_decay_rate:Number, release_rate:Number,
			rate_scale:Number, frequency_rate_multiplier:Number;
		
		public var env_stage:int, level:Number, repeat:Boolean;
		
		public function FMEnvelope():void
		{
			attack_rate = 0;
			total_level = 0;
			decay_rate = 0;
			sustain_level = 0;
			sustain_decay_rate = 0;
			release_rate = 0;
			rate_scale = 0;
			env_stage = 0;
			level = 0;
		}
		
		public function reset():void
		{
			env_stage = 0;
			level = 0;
		}
		
		public function sample(frequency:Number, note_on:Number):Number
		{
			switch(env_stage) {
				case 0: // initial stage
				{
					if (note_on > 0.0) { // note struck
						env_stage = 1; // change to attack
						return sample(frequency, note_on);
					}
				}
				break;
				case 1: // attack
				{
					level += level + attack_rate + (frequency * frequency_rate_multiplier * attack_rate);
					if (level > total_level * note_on) {
						level = total_level * note_on;
						env_stage = 2;
					}
				}
				break;
				case 2: // decay
				{
					level -= (decay_rate + (frequency * frequency_rate_multiplier * attack_rate));
					if (level > sustain_level * note_on) {
						level = sustain_level * note_on;
						env_stage = 3;
					}
				}
				break;
				case 3: // sustain & release
				{
					if (level > 0) {
						if (note_on > 0) {
							level -= (sustain_decay_rate + (frequency * frequency_rate_multiplier * sustain_decay_rate));
						} else {
							level -= (release_rate + (frequency * frequency_rate_multiplier * release_rate));
						}
					} else {
						level = 0;
						env_stage = repeat?0:4;
					}
				}
				break;
				case 4: // debounce
				{
					if (note_on <= 0) {
						env_stage = 0;
					}
				}
				break;
			}
			return level;
		}
		
	}
}