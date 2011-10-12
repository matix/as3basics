package as3basics 
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.NetStatusEvent;
	import flash.events.SecurityErrorEvent;
	import flash.events.StatusEvent;
	import flash.net.NetConnection;
	import flash.net.ObjectEncoding;
	import flash.net.Responder;
	
	/**
	 * ...
	 * @author matix
	 */
	[Event(name = "response", type = "as3basics.AMFServiceEvent")];
	[Event(name = "fault", type = "as3basics.AMFServiceEvent")];
	public class AMFService extends EventDispatcher 
	{
		private var connection:NetConnection;
		private var endpoint:String;
		
		public function AMFService(endpoint:String):void 
		{
			this.endpoint = endpoint;
			connection = new NetConnection();
			connection.objectEncoding = ObjectEncoding.AMF0;
			connection.addEventListener(NetStatusEvent.NET_STATUS, onNetStatus);
			connection.connect(this.endpoint);
		}
		
		private function onNetStatus(e:NetStatusEvent):void 
		{
			trace(e);
		}

		public function call(service:String, method:String):void 
		{	
			var responder:Responder = new Responder(this.onResponse, this.onError);
			var args:Array = [service + "." + method, responder];
			var i:int = 2;
			while (i < arguments.length) {
				args.push(arguments[i]);
			}
			try {
				connection.call.apply(connection, args);
			}
			catch (e:Error) {
				trace("Error on calling");
			}
		}
		
		private function onResponse(response:*):void 
		{
			dispatchEvent(new AMFServiceEvent(AMFServiceEvent.RESPONSE, response));
		}
		
		private function onError(fault:Object):void 
		{
			dispatchEvent(new AMFServiceEvent(AMFServiceEvent.FAULT, fault));
		}
		
	}

}