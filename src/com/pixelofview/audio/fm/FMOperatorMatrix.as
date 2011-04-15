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
		public var op_len:int;
		public var stage_map:Array;
		public var levels:Array;
		
		/**
		 * Creates an operator matrix with the given number of operators,
		 * in which the operators are connected through phase and/or level
		 * influences
		 * @param	operator_count	the number of operators to create and map
		 */
		public function FMOperatorMatrix(operator_count:int):void 
		{
			op_len = operator_count;
			operators = new Array();
			stage_map = new Array();
			levels = new Array();
			var i:int;
			for (i = 0; i < operator_count; i++) {
				operators.push(new FMOperator());
				levels.push(0.0);
			}
			for (i = 0; i < operator_count + 1; i++) {
				stage_map.push(new Array());
				for (var j:int = 0; j < operator_count; j++) {
					stage_map[i].push(0);
				}
			}
		}
		
		/**
		 * Resets the operators, clearing velocities, phases and such
		 */
		public function reset():void
		{
			for (var i:int = 0; i < op_len; i++ ) {
				operators[i].reset();
			}
		}
		
		/**
		 * Samples the operators, doing the mapping between operators in a matrix-like structure.
		 * @param	sample_delta	the time step of a single sample
		 * @param	octave			the note's octave
		 * @param	note			the note proper
		 * @return	a sample value
		 */
		public function sample(sample_delta:Number, octave:int, note:Number):Number
		{
			var accum:Number;
			var i:int, j:int;
			for (i = 0; i < op_len; i++) {
				accum = 0;
				for (j = 0; j < op_len; j++ ) { // op_len is also the number of levels
					accum += stage_map[i][j] * levels[j];
				}
				levels[i] = operators[i].sample(sample_delta, octave, note, accum);
			}
			
			accum = 0.0;
			for (j = 0; j < op_len; j++ ) {
					// op_len is also the index of the output stage map
					accum += stage_map[op_len][j] * levels[j]; 
			}
			return accum;
		}
	}

}