package  
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.media.Camera;
	import flash.media.Video;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author matix
	 */
	public class VideoDemo extends Sprite
	{
		private var capture:Bitmap;
		private var data:TextField;
		
		public function VideoDemo() 
		{
			data = new TextField();
			data.autoSize = TextFieldAutoSize.CENTER;
			data.defaultTextFormat = new TextFormat("Arial", 14, 0xffffff);
			addChild(data);
			
			var v:Video = new Video(stage.stageWidth, stage.stageWidth);
			var c:Camera = Camera.getCamera();
			if (c) {
				c.setMode(stage.stageWidth, stage.stageHeight, 30);
				v.attachCamera(c);	
				addChildAt(v,0);
				
				capture = new Bitmap();
				capture.scaleX = capture.scaleY = 0.3;
				capture.x = capture.y = 10;
				
				addChildAt(capture,1);
				
				stage.addEventListener(MouseEvent.CLICK, function(e:MouseEvent):void {
					var bd:BitmapData = new BitmapData(v.videoWidth, v.videoHeight);
					bd.draw(v);
					
					capture.bitmapData = bd;
				});
				
				stage.addEventListener(Event.ENTER_FRAME, function(e:Event):void {
					data.text = "FPS:";
					data.appendText(c.currentFPS.toPrecision(2));
					
					data.x = stage.stageWidth - data.width;
					data.y = stage.stageHeight - data.height;
					
				});
			} else {
				data.text = "NO CAMERA";
			}
		}
	}

}