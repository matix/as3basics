package  
{
	import flash.display.Sprite;
	import flash.filters.BevelFilter;
	import flash.filters.DropShadowFilter;
	/**
	 * ...
	 * @author matix
	 */
	public class SizingPositioningFiltersDemo extends Sprite
	{
		
		public function SizingPositioningFiltersDemo() 
		{
			var sq:Sprite = new Square(0xFFFF00);
			
			sq.width = 300;
			sq.height = 400;	
			
			sq.x = 350;
			sq.y = 100;
			
			sq.rotation = 45;
			
			sq.filters = [new DropShadowFilter(4, 45, 0, .3, 10, 10),
						  new BevelFilter()];
			
			addChild(sq);
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