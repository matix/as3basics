package
{
	public class SMTransition
	{
		private var _nextState:SMState;
		private var _previousState:SMState;
		private var _event:String;
		private var _description:String;
		private var _condition:Function;
		private var _action:Function;
		
		public function SMTransition(previousState:SMState, 
									 nextState:SMState, 
									 event:String, 
									 condition:Function = null, 
									 action:Function = null)
		{
			_previousState = previousState;
			_nextState = nextState;
			_condition = condition;
			_action = action;
			_event = event;
		}
		
		public function get nextState():SMState { return _nextState; }
		
		public function get previousState():SMState { return _previousState; }
		
		public function get event():String { return _event; }
		
		public function get condition():Function { return _condition; }
		
		public function get action():Function { return _action; }

	}
}
