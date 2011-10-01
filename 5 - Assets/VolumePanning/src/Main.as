package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.ui.Keyboard;
	
	/**
	 * ...
	 * @author matix
	 */
	public class Main extends Sprite 
	{
		[Embed(source='Muse - Supermassive Black Hole.mp3')]
		private static const SoundAsset:Class;
		
		private var sound:Sound;
		private var soundCh:SoundChannel;
		private var volume:Number;
		private var pan:Number;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			
			volume = 0.6;
			pan = 0;
			
			sound = new SoundAsset() as Sound;
			soundCh = sound.play(0, 10000, new SoundTransform(volume,pan));
		}
		
		private function onKeyUp(e:KeyboardEvent):void 
		{
			if (e.keyCode == Keyboard.UP) {
				volume += 0.2;
			}
			else if(e.keyCode == Keyboard.DOWN){
				volume -= 0.2;
			}
			else if(e.keyCode == Keyboard.LEFT){
				pan -= 0.4;
			}
			else if(e.keyCode == Keyboard.RIGHT){
				pan += 0.4;
			}
			soundCh.soundTransform = new SoundTransform(this.volume,this.pan);
			trace("volume:", volume);
			trace("pan:", pan);
		}
		
	}
	
}