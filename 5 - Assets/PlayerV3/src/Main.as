package 
{
	import as3basics.Player;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLLoader;
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
		private var playlistLoader:URLLoader;
		
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
			playlistLoader = new URLLoader(new URLRequest("playlist.xml"));
			playlistLoader.addEventListener(Event.COMPLETE, onPlaylistLoaded);
		}

		private function onPlaylistLoaded(e:Event):void
		{
			var playlist:XML = new XML(playlistLoader.data);
			
			player = new Player(playlist);
			player.x = stage.stageWidth / 2 - player.width / 2;
			player.y = stage.stageHeight/ 2 - player.height/ 2;
			addChild(player);
		}
		
	}
	
}