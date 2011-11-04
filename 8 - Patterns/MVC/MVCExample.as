public class MarioAsset extends Sprite
{
	public function animateRun():void{}
	public function animateJump():void{}
}

public class MarioData
{
	public var health:Number = 100;
	public var lifes:Number = 3;
	
	public function hurt():void{
		health-=10;
		if(health==0) {
			lifes--;
			health = 100;
		}
	}
}

public class MarioController extends AbstractActorController implements IStateMachine
{
	private var machine:StateMachine;
	private var data:MarioData;
	private var asset:MarioAsset;
	//...
	
	private function whenRunning():void
	{
		//animate running
		asset.x += 10;
		for each(var enemy:Enemy in Game.manager.enemies)
		{
			if(asset.hitTest(enemy)) setEvent("touched-enemy")
		}
	}

	private function onDead():void
	{
		if(data.lifes==0) {/*GAME OVER*/}
		else {/*restart level... */}
	}		
}