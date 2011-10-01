package as3basics 
{
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author matix
	 */
	public class Player extends DraggableSprite
	{
		public var playBtn:SimpleButton;
		public var stopBtn:SimpleButton;
		public var titleTxt:TextField;
		public var timerTxt:TextField;
		
		private var currentSong:Sound;
		private var currentSongCh:SoundChannel;
		
		public function Player(title:String, song:Sound) 
		{
			currentSong = song;
			
			playBtn.addEventListener(MouseEvent.CLICK, onPlayClick);
			stopBtn.addEventListener(MouseEvent.CLICK, onStopClick);
			
			titleTxt.text = title;
			timerTxt.text = "00:00 / " + formatTime(currentSong.length);
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(e:Event):void 
		{
			if (currentSongCh) {
				timerTxt.text = formatTime(currentSongCh.position) + " / " + formatTime(currentSong.length);
			}
		}
		
		private function formatTime(t:Number):String {
			var tMin:Number = t / 1000 / 60;
			var tMinStr:String = ((tMin < 10)?"0":"") + Math.floor(tMin).toString();
			var tSec:Number = (tMin - Math.floor(tMin)) * 60;
			var tSecStr:String = ((tSec < 10)?"0":"") + Math.floor(tSec).toString();
			return tMinStr + ":" + tSecStr;
		}
		
		private function onPlayClick(e:MouseEvent):void 
		{
			if (!currentSongCh) {
				currentSongCh = currentSong.play();
			}
		}
		
		private function onStopClick(e:MouseEvent):void 
		{
			if (currentSongCh) {
				currentSongCh.stop();
				currentSongCh = null;
			}
		}
		
	}

}