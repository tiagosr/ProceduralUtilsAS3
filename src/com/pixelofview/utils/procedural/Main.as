package com.pixelofview.utils.procedural
{
	import com.pixelofview.audio.fm.test.TestFM;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Tiago Rezende
	 */
	public class Main extends Sprite 
	{
		private var test_fm:TestFM;
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			test_fm = new TestFM();
			addChild(test_fm);
			test_fm.setup();
		}
		
	}
	
}