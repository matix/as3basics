package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author matix
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			var loader:URLLoader = new URLLoader();
			var request:URLRequest = new URLRequest("http://examples.as3basics.local/xml.php");
			loader.addEventListener(Event.COMPLETE, onXMLLoaded);
			
			loader.load(request);
		}
		
		private function onXMLLoaded(e:Event):void 
		{
			var xml:XML = new XML(e.target.data);
			
			for each(var player:XML in xml.player) 
			{
				trace(player.@name);
				trace("-----------");
			}
		}
	}
}