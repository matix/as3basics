package
{
	public class SMState
	{
		private var _name:String;
		private var _action:Function;
		private var _enterAction:Function;
		private var _exitAction:Function;
		
		public function SMState(name:String, 
								action:Function = null, 
								enterAction:Function = null, 
								exitAction:Function = null) 
		{
			_name = name;
			_action = action;
			_enterAction = enterAction;
			_exitAction = exitAction;
		}
		
		public function get name():String { return _name; }
		
		public function get action():Function { return _action; }
		
		public function get enterAction():Function { return _enterAction; }
		
		public function get exitAction():Function { return _exitAction; }

	}

}
