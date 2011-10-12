package 
{
	import as3basics.AMFService;
	import as3basics.AMFServiceEvent;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author matix
	 */
	public class Main extends Sprite 
	{
		private var service:AMFService;
		private var scoresData:Object;
		private var loader:Loader;
		private var assets:Sprite;
		
		public function Main():void 
		{
			loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, init);
			loader.load(new URLRequest("assets.swf"), new LoaderContext(false, ApplicationDomain.currentDomain));
		}
		
		private function init(e:Event = null):void 
		{			
			service = new AMFService("http://examples.as3basics.local/zamf.php");
			service.addEventListener(AMFServiceEvent.RESPONSE, onServiceResponse);
			service.addEventListener(AMFServiceEvent.FAULT, onServiceFault);
			service.call("ScoreService", "getHighScores");
			
			assets = new (ApplicationDomain.currentDomain.getDefinition("assets.Main"));
			addChild(assets);
			assets["logTxt"].appendText("Loading...");
		}
		
		private function onServiceFault(e:AMFServiceEvent):void 
		{
			trace("ERROR:", e.data.description);
		}
		
		private function onServiceResponse(e:AMFServiceEvent):void 
		{
			assets["logTxt"].appendText("Loaded");
			scoresData = e.data;
			
			for (var i:int = 0; i < 3; i++) 
			{
				assets["player" + (i + 1)].bar.height = (scoresData[i].score/1000)*300;
				assets["player" + (i + 1)].playerName.text = scoresData[i].name;
			}
		}
		
	}
	
}