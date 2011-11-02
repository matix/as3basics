package as3basics 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	
	/**
	 * ...
	 * @author matix
	 */
	public class Game extends Sprite
	{
		static public const SPEED:Number = 20;
		static public const R_SPEED:Number= 10;
		
		//assets
		public var upKey:MovieClip;
		public var downKey:MovieClip;
		public var leftKey:MovieClip;
		public var rightKey:MovieClip;
		public var car:Sprite;
		
		private var up:Boolean = false;
		private var down:Boolean = false;
		private var left:Boolean = false;
		private var right:Boolean = false;
		
		public function Game() 
		{
			if (stage) init()
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			car.x = stage.stageWidth / 2;
			car.y = stage.stageHeight/ 2;
			
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			addEventListener(Event.ENTER_FRAME, mainLoop)
		}
		
		private function mainLoop(e:Event):void 
		{
			var direction:Number = 0;
			if (up) {
				direction = 1;
			}
			else if (down) {
				direction = -1;
			}
			
			if (left) {
				car.rotation -= R_SPEED;
			}
			if (right) {
				car.rotation += R_SPEED
			}
			
			var next:Point = Point.polar(direction, (90 - car.rotation)*Math.PI/180);
			var dx:Number = next.x * SPEED;
			var dy:Number = next.y * SPEED;
			
			car.x += dx;
			car.y -= dy;
			
			if (car.x > stage.stageWidth) {
				car.x = 0;
			}
			if (car.x < 0) {
				car.x = stage.stageWidth;
			}
			if (car.y > stage.stageHeight) {
				car.y = 0;
			}
			if (car.y < 0) {
				car.y = stage.stageHeight;
			}
		}
		
		private function onKeyUp(e:KeyboardEvent):void 
		{
			switch(e.keyCode) {
				case Keyboard.UP:
					upKey.gotoAndStop(1);
					up = false;
					break;
				case Keyboard.DOWN:
					downKey.gotoAndStop(1);
					down = false;
					break;
				case Keyboard.LEFT:
					leftKey.gotoAndStop(1);
					left = false;
					break;
				case Keyboard.RIGHT:
					rightKey.gotoAndStop(1);
					right = false;
					break;
			}
		}
		
		private function onKeyDown(e:KeyboardEvent):void 
		{
			switch(e.keyCode) {
				case Keyboard.UP:
					upKey.gotoAndStop(2);
					up = true;
					break;
				case Keyboard.DOWN:
					downKey.gotoAndStop(2);
					down = true;
					break;
				case Keyboard.LEFT:
					leftKey.gotoAndStop(2);
					left = true;
					break;
				case Keyboard.RIGHT:
					rightKey.gotoAndStop(2);
					right = true;
					break;
			}
		}
		
	}

}