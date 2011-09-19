package  
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author matix
	 */
	public class LoaderDemo extends Sprite
	{
		private var loader:Loader;
		
		public function LoaderDemo() 
		{
			loader = new Loader();
			var request:URLRequest = new URLRequest("redbg.jpg");
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoaderReady);
			loader.load(request);
		}
		
		private function onLoaderReady(e:Event):void 
		{
			addChild(loader);
		}
		
	}

}