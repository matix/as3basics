package 
{
	public interface IStateMachine 
	{
		function addTransition(previousState:SMState, 
							   nextState:SMState, 
							   event:String, 
							   condition:Function = null, 
							   action:Function = null):void;
		
		function update():void;
		
		function setEvent(event:String):void;

		function get state():SMState;
	}
}

