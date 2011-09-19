package  
{	
	import flash.display.SimpleButton;
	import flash.display.Sprite;

	public class SimpleButtonDemo extends Sprite
	{
		public function SimpleButtonDemo() 
		{
			var size:uint      = 200;
			var button:SimpleButton = new SimpleButton();
			button.downState = new ButtonDisplayState(0xFFCC00, size, "DOWN");
			button.overState  = new ButtonDisplayState(0xFF00FF, size, "OVER");
			button.upState = new ButtonDisplayState(0x00CCFF, size, "UP");
			button.hitTestState = new ButtonDisplayState(0xFFCC00, 100);
			button.hitTestState.x = 50;
			button.hitTestState.y = 50;
			button.useHandCursor  = true;
			button.x = button.y = 100;
			addChild(button);
		}
	}
}

import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFormat;

class ButtonDisplayState extends Sprite {
	private var bgColor:uint;
	private var size:uint;
	private var label:TextField;
	
	public function ButtonDisplayState(bgColor:uint, size:uint, label:String = null) {
		this.bgColor = bgColor;
		this.size = size;
		this.label = new TextField();
		this.label.width = this.label.height = size;
		this.label.defaultTextFormat = new TextFormat("Arial", 40, 0xffffff, true);
		this.label.text = label || "";
		addChild(this.label);
		draw();
	}
	
	private function draw():void {
		graphics.beginFill(bgColor);
		graphics.drawRect(0, 0, size, size);
		graphics.endFill();
	}
}