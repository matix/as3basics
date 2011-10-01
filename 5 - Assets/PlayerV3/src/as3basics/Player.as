package as3basics 
{
	import flash.display.Loader;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.ui.Keyboard;
	
	/**
	 * ...
	 * @author matix
	 */
	public class Player extends DraggableSprite
	{
		public var artistImg:Sprite;
		public var playBtn:SimpleButton;
		public var stopBtn:SimpleButton;
		public var nextBtn:SimpleButton;
		public var prevBtn:SimpleButton;
		public var titleTxt:TextField;
		public var timerTxt:TextField;
		
		private var playlist:XML;
		private var songCache:Object = { };
				
		private var totalTracks:int = 0;
		private var currentTrackNumber:int = 0;
		private var currentTrackInfo:XML;
		
		private var currentSong:Sound;
		private var currentSongCh:SoundChannel;
		
		private var artistImgLoader:Loader;
		
		public function Player(playlist:XML) 
		{
			this.playlist = playlist;
			totalTracks = playlist.song.length();
			
			artistImgLoader = new Loader();
			artistImgLoader.mask = artistImg;
			artistImgLoader.x = artistImg.x;
			artistImgLoader.y = artistImg.y;
			artistImgLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, function(e:Event):void {
				e.currentTarget.content.width = 254;
				e.currentTarget.content.height = 254;
			});
			addChild(artistImgLoader);
			
			playBtn.addEventListener(MouseEvent.CLICK, onPlayClick);
			stopBtn.addEventListener(MouseEvent.CLICK, onStopClick);
			nextBtn.addEventListener(MouseEvent.CLICK, onNextClick);
			prevBtn.addEventListener(MouseEvent.CLICK, onPrevClick)
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(e:Event):void 
		{
			if (currentSong && currentSongCh && currentTrackInfo) {
				titleTxt.text = "(" + (currentTrackNumber + 1) + "/" + totalTracks + ") " 
								+currentTrackInfo.artist.@name + " - "+ currentTrackInfo.track.@name;
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
		
		private function onPlayClick(e:MouseEvent=null):void 
		{
			if(currentSong){
				if (!currentSongCh) {
					currentSongCh = currentSong.play();
				}
			}
			else {
				loadTrack(currentTrackNumber);
			}
		}
		
		private function loadTrack(trackNumber:int):void 
		{
			currentTrackInfo = playlist.song[trackNumber];
			if (!currentTrackInfo && currentTrackNumber > 0) {
				currentTrackNumber = 0;
				loadTrack(0);
			}
			else {
				
				if (songCache[ currentTrackInfo.track.@file ]) {
					currentSong = songCache[ currentTrackInfo.track.@file ] as Sound;
					onPlayClick();
				}
				else {
					titleTxt.text = "loading...";
					var songRequest:URLRequest = new URLRequest(currentTrackInfo.track.@file);
					currentSong = new Sound();
					currentSong.addEventListener(Event.COMPLETE, onSongLoaded);
					currentSong.load(songRequest);
					songCache[currentTrackInfo.track.@file] = currentSong;
				}
				
				var imgRequest:URLRequest = new URLRequest(currentTrackInfo.artist.@img);
				artistImgLoader.load(imgRequest);
			}
		}
		
		private function onSongLoaded(e:Event):void 
		{
			loadTrack(currentTrackNumber);
		}
		
		private function onStopClick(e:MouseEvent = null):void 
		{
			if (currentSongCh) {
				currentSongCh.stop();
				currentSong = null;
				currentSongCh = null;
			}
		}
		
		private function onPrevClick(e:MouseEvent):void 
		{
			currentTrackNumber--;
			onStopClick();
			onPlayClick();
		}
		
		private function onNextClick(e:MouseEvent):void 
		{
			currentTrackNumber++;
			onStopClick();
			onPlayClick();
		}
		
	}

}