package 
{
	import com.greensock.plugins.DropShadowFilterPlugin;
	import com.greensock.plugins.TweenPlugin;
	import com.greensock.TimelineLite;
	import com.greensock.TweenLite;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author matix
	 */
	public class TweenLiteExample extends Sprite 
	{
		[Embed(source="arrow.png")]
		private static const ArrowAsset:Class;
		private static const START_X:Number = 100;
		private static const START_Y:Number = 100;
		
		private var arrow:Sprite;
		private var timeline:TimelineLite;
		
		public function TweenLiteExample():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			arrow = new Sprite();
			var bmp:Bitmap = new ArrowAsset() as Bitmap;
			bmp.x = -bmp.width / 2;
			bmp.y = -bmp.height / 2;
			arrow.addChild(bmp);
			
			arrow.x = START_X;
			arrow.y = START_Y;
			
			addChild(arrow);
			
			TweenPlugin.activate([DropShadowFilterPlugin])
			
			timeline = new TimelineLite( {
				paused:true,
				onComplete:function():void {
					timeline.reverse();
				}
			});
			timeline.append(TweenLite.to(arrow, 1, { x:stage.stageWidth - arrow.width, dropShadowFilter:{blurX:15, blurY:15, alpha:.6} } ));
			timeline.append(TweenLite.to(arrow, .5, {rotation:90 } ));
			timeline.append(TweenLite.to(arrow, 1, { y:stage.stageHeight - arrow.height, scaleX:2, scaleY:2} ));
			timeline.append(TweenLite.to(arrow, .5, {rotation:180} ));
			timeline.append(TweenLite.to(arrow, 1, {x:START_X, scaleX:1, scaleY:1} ));
			timeline.append(TweenLite.to(arrow, .5, {rotation:270} ));
			timeline.append(TweenLite.to(arrow, 1, {y:START_Y, alpha:.2} ));
			timeline.append(TweenLite.to(arrow, .5, { rotation:0 } ));
			
			arrow.addEventListener(MouseEvent.CLICK, function(e:Event):void {
				timeline.play();
			});
			
		}
		
	}
	
}