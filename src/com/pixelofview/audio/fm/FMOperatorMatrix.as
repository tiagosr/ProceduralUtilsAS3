package com.pixelofview.audio.fm 
{
	/**
	 * FM Synthesizer
	 * Channel Operator Matrix
	 * @author Tiago Rezende
	 */
	public class FMOperatorMatrix
	{
		public var operators:Array;
		public var stage_map:Array;
		public var levels:Array;
		
		public function FMOperatorMatrix(operator_count:int):void 
		{
			operators = new Array();
			stage_map = new Array();
			levels = new Array();
			for (var i:int = 0; i < operator_count; i++) {
				operators.push(new FMOperator());
				levels.push(0.0);
			}
			for (var i:int = 0; i < operator_count + 1; i++) {
				stage_map.push(new Array());
				for (var j:int = 0; j < operator_count; j++) {
					stage_map[i].push(new FMOperatorMatrixStagePair(0, 0));
				}
			}
		}
		
		/**
		 * Resets the operators, clearing velocities, phases and such
		 */
		public function reset():void
		{
			for (var i in operators) {
				operators[i].reset();
			}
		}
		
		public function sample(sample_delta:Number, octave:int, note:Number):Number
		{
			var level_accum:Number;
			var phase_accum:Number;
			for (var i in operators) {
				level_accum = 0;
				phase_accum = 0;
				for (var j in levels) {
					level_accum += stage_map[i][j].level * levels[j];
					phase_accum += stage_map[i][j].phase * levels[j];
				}
				levels[i] = operators[i].sample(sample_delta, octave, note, level_accum, phase_accum);
			}
			level_accum = 0.0;
			for (var j in levels) {
					level_accum += stage_map[stage_map.length-1][j].level * levels[j];
			}
			return level_accum;
		}
	}

}