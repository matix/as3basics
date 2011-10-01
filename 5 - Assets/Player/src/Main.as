package 
{
	import as3basics.Player;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	
	/**
	 * ...
	 * @author matix
	 */
	public class Main extends Sprite 
	{
		private var assetsLoader:Loader;
		private var player:Player;
				
		[Embed(source='Muse - Supermassive Black Hole.mp3')]
		private static const EmbeddedSong:Class;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			assetsLoader = new Loader();
			assetsLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onAssetsLoaded);
			var request:URLRequest = new URLRequest("assets.swf");
			var context:LoaderContext = new LoaderContext(false, ApplicationDomain.currentDomain);
			assetsLoader.load(request, context);
		}
		
		private function onAssetsLoaded(e:Event):void 
		{
			player = new Player("Muse - Supermassive Black Hole", new EmbeddedSong() as Sound);
			player.x = stage.stageWidth / 2 - player.width / 2;
			player.y = stage.stageHeight/ 2 - player.height/ 2;
			addChild(player);
		}
		
	}
	
}