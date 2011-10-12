package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.NetConnection;
	import flash.net.Responder;
	
	/**
	 * ...
	 * @author matix
	 */
	public class Main extends Sprite 
	{
		private static const ENDPOINT:String = "http://examples.as3basics.local/zamf.php";
		private var connection:NetConnection;
		private var responder:Responder;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			try {
				connection = new NetConnection();
				connection.connect(ENDPOINT);
				
				responder = new Responder(onResponse,onError);
				
				connection.call("MyService.say", responder, "Hola mundo!");
			}
			catch (e:Error) {
				trace("Error connecting:", e.message);
			}
		}
		
		private function onResponse(response:*):void 
		{
			trace(response);
		}
		
		private function onError(fault:Object):void 
		{
			trace(fault.description);
		}
		
	}
	
}