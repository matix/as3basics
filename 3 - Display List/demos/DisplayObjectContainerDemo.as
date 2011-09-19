package  
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author matix
	 */
	public class DisplayObjectContainerDemo extends Sprite
	{
		
		public function DisplayObjectContainerDemo() 
		{
			var child1:Square = new Square(0xFF0000);
			var child2:Square = new Square(0x00FF00);
			var child3:Square = new Square(0x0000FF);
			var i:int = 1;
			for each (var child:Sprite in [child1,child2,child3]) 
			{
				child.addEventListener(MouseEvent.MOUSE_OVER, function(e:MouseEvent):void {
					var parent:DisplayObjectContainer = e.currentTarget.parent;
					if(parent){
						parent.swapChildren(e.currentTarget as DisplayObject, 
											parent.getChildAt(parent.numChildren - 1));
					}
				});
				
				child.addEventListener(MouseEvent.CLICK, function(e:MouseEvent):void {
					e.currentTarget.parent.removeChild(e.target);
				});
				
				child.x = i * 60;
				child.y = i * 60;
				this.addChild(child);
				i++;
			}
		}
		
	}

}
import flash.display.Graphics;
import flash.display.Sprite;

class Square extends Sprite {
	function Square(color:uint) {
		var g:Graphics =  this.graphics;
		g.beginFill(color);
		g.drawRect(0, 0, 200, 200);
		g.endFill();
	}
}