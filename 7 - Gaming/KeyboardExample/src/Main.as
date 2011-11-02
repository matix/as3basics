package 
{
	import as3basics.Game;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
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
		public function Main():void 
		{
			assetsLoader = new Loader();
			assetsLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onAssetsLoaded);
			assetsLoader.load(new URLRequest("assets.swf"), new LoaderContext(false, ApplicationDomain.currentDomain));
		}
		
		private function onAssetsLoaded(e:Event):void 
		{
			addChild(new Game());
		}
		
	}
	
}