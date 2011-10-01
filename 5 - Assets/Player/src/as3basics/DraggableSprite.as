package as3basics 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author matix
	 */
	public class DraggableSprite extends Sprite
	{
		
		public function DraggableSprite() 
		{
			addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		}
		
		private function onMouseUp(e:MouseEvent):void 
		{
			stopDrag();
		}
		
		private function onMouseDown(e:MouseEvent):void 
		{
			startDrag();
		}
		
	}

}