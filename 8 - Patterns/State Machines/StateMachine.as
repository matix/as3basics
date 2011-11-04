package 
{
	public class StateMachine implements IStateMachine {
		
		private var transitions:Vector.<SMTransition>;
		private var currentState:SMState;
		
		public function StateMachine(firstState:SMState) {
			currentState = firstState;
			transitions = new <SMTransition>[];
		}
		
		public function addTransition(previousState:SMState, nextState:SMState, event:String, condition:Function = null, action:Function = null):void {
			transitions.push(new SMTransition(previousState, nextState, event, condition, action));
		}
		
		public function update():void {
			for each (var transition:SMTransition in transitions) {	
				evaluateTransition(transition);
			}
			if (currentState.action) currentState.action();
		}
		
		public function setEvent(event:String):void {
			for each (var transition:SMTransition in transitions) {
				if (transition.event == event) evaluateTransition(transition);			
			}
		}
		
		private function evaluateTransition(transition:SMTransition):void {
			if(transition.previousState === currentState){
				if (transition.condition) {
					if (transition.condition()) setNextState(transition);				
				}
				else setNextState(transition);
			}
		}
		
		private function setNextState(transition:SMTransition):void {
			if (currentState.exitAction) currentState.exitAction();
			if (transition.action) transition.action();
			if (transition.nextState.enterAction) transition.nextState.enterAction();
			currentState = transition.nextState;
		}
		
		public function get state():SMState {return currentState;}
	}
}