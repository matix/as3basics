package  
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	/**
	 * ...
	 * @author matix
	 */
	public class EnterFrameAnimationDemo extends Sprite
	{
		private var square:Square;
		private var onion:Bitmap;
		
		public function EnterFrameAnimationDemo() 
		{
			onion = new Bitmap(new BitmapData(stage.stageWidth, stage.stageHeight,true,0),"auto",true);
			stage.addChild(onion);
			
			square = new Square();
			square.y = stage.stageHeight / 2;
			stage.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			stage.addChild(square);
		}
		
		private function onEnterFrame(e:Event):void 
		{
			if (square.x < stage.stageWidth) {
				square.x += 10;
				square.rotationX = 
				square.rotationY = 
				square.rotationZ = (square.x / stage.stageWidth) * 360;
				square.scaleX = 
				square.scaleY = 
				square.scaleZ = (square.x / stage.stageWidth);
			}
			else {
				//reset...
				square.x = 
				square.rotationX = 
				square.rotationY = 
				square.rotationZ = 
				square.scaleX = 
				square.scaleY = 
				square.scaleZ = 0;
				
				onion.bitmapData.fillRect(onion.bitmapData.rect, 0);
			}
			
			//make onion skin trail
			onion.visible = false;
			onion.bitmapData.draw(stage,null,new ColorTransform(1,1,1,.1),null,null,true);
			onion.visible = true;
		}
		
	}

}

class Square extends flash.display.Sprite {
	public function Square() {
		this.graphics.beginFill(Math.random() * 0xffffff);
		this.graphics.drawRect(-100, -100, 200, 200);
		this.graphics.endFill();
	}
}