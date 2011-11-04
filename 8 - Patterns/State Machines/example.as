public class Mario extends Sprite implements IStateMachine
{
	private var machine:StateMachine;

	public function Mario():void
	{
		var normal:SMState = new SMState("normal");
		var running:SMState = new SMState("running",whenRunning);
		var jumping:SMState = new SMState("jumping",whenJumping);
		var dead:SMState = new SMState("dead",onDead);
		
		machine = new StateMachine(normal);
		
		addTransition(normal,running,"",KeyboardManager.manager.leftIsPressed);
		addTransition(normal,jumping,"",KeyboardManager.manager.upIsPressed);
		addTransition(running,jumping,"",KeyboardManager.manager.upIsPressed);
		// ...
		addTransition(running,dead,"touched-enemy");
	}
	
	private function whenRunning():void
	{
		//animate running
		this.x += 10;
		for each(var enemy:Enemy in Game.manager.enemies)
		{
			if(this.hitTest(enemy)) setEvent("touched-enemy")
		}
	}	
	
	private function whenJumping():void
	{/*animate jumping*/}
	
	private function onDead():void
	{
		if(this.lifes==0) {/*GAME OVER*/}
		else {/*restart level... */}
	}	
	
	function addTransition(previousState:SMState, 
						   nextState:SMState, 
						   event:String, 
						   condition:Function = null, 
						   action:Function = null):void
   {machine.addTransition(previousState,nextState,event,condition,action)}
	
	function update():void {machine.update()}
	
	function setEvent(event:String):void {machine.setEvent(event)}

	function get state():SMState {return machine.state}
}

	var mario:Mario = new Mario();
	addEventlistener(Event.ENTER_FRAME, gameLoop);

	function gameLoop(e:Event):void 
	{
		mario.update();
	}
