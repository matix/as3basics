package as3basics 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	
	/**
	 * ...
	 * @author matix
	 */
	public class TP2Base extends Sprite
	{
		protected var square1:Sprite;	
		protected var square2:Sprite;	
		
		public function TP2Base() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		public function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			trace("Started!");
			
			square1 = new Sprite();
			square2 = new Sprite();
			
			for each (var square:Sprite in [square1, square2]) 
			{
				square.graphics.beginFill(Math.random() * 0xFFFFFF);
				square.graphics.lineStyle(2,Math.random()*0xFFFFFF);
				square.graphics.drawRect(0, 0, Math.random() * 100, Math.random()*100);
				square.graphics.endFill();
				
				square.x = 100 + Math.random() * (stage.stageWidth - 100);
				square.y = 100 + Math.random() * (stage.stageHeight - 100);
				
				square.addEventListener(MouseEvent.MOUSE_DOWN, function(e:MouseEvent):void {
					Sprite(e.currentTarget).startDrag();
				});
				
				square.addEventListener(MouseEvent.MOUSE_UP, function(e:MouseEvent):void {
					Sprite(e.currentTarget).stopDrag();
				});
				
				this.addChild(square);
			}
		}
		
		public function makeRed(circle:Sprite):void {
			circle.transform.colorTransform = new ColorTransform(1, 0, 0,1,255);
			trace(circle, "is red!")
		}
		
		public function undoRed(circle:Sprite):void {
			circle.transform.colorTransform = new ColorTransform();
			trace(circle, "is not red anymore...")
		}
		
		
	}

}