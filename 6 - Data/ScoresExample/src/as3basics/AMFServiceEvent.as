package as3basics 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author matix
	 */
	public class AMFServiceEvent extends Event
	{
		public static const RESPONSE:String = "response";
		public static const FAULT:String = "fault";
		
		public var data:*;
		
		public function AMFServiceEvent(type:String, data:*) 
		{
			super(type);
			this.data = data;
		}
		
		override public function clone():Event 
		{
			return new AMFServiceEvent(this.type, this.data);
		}
	}

}