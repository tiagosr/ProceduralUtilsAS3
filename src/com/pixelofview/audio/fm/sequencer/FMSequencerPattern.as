package com.pixelofview.audio.fm.sequencer 
{
	import com.pixelofview.audio.fm.FMSynthesizer;
	/**
	 * FM Synthesizer
	 * Pattern data for the sequencer
	 * @author Tiago Rezende
	 */
	public class FMSequencerPattern
	{
		public var tracks:Array;
		public var channels:Array;
		
		public var beats:int;
		public var pattern_length:Number;
		public var pattern_elapsed:Number;
		
		public function FMSequencerPattern(track_count:int, pattern_beats:int, bpm:int, channel_offset:int):void 
		{
			tracks = new Array();
			channels = new Array();
			beats = pattern_beats;
			for (var i:int = 0; i < track_count; i++) {
				tracks.push(new FMSequencerTrack());
				channels.push(channel_offset + i);
			}
		}
		
		/**
		 * Sets up instruments for each track
		 * @param	synth	the sinthesizer to set instruments to
		 */
		public function setup(synth:FMSynthesizer):void
		{
			
		}
		
		public function beat(beat_delta:Number, synth:FMSynthesizer):int
		{
			for (var b in tracks) {
				tracks[b].beat(synth, channels[b]);
			}
			pattern_elapsed += beat_delta;
			if (pattern_elapsed > pattern_length) {
				return -1;
			} else {
				return 1;
			}
			
		}
		
	}

}