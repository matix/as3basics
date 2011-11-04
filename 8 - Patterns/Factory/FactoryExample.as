package {
	public class Actor extends Sprite
	{
		public function startAnimation():void {...}	
	}	
	
	public class Mario extends Actor
	{
		override public function startAnimation():void {...}
	}	
	
	public class Koopa extends Actor
	{
		override public function startAnimation():void {...}
	}	
	
	public class Goomba extends Actor
	{
		override public function startAnimation():void {...}
	}	

	public class ActorFactory
	{
		public static function getActor(type:String):Actor
		{
			switch(type)
			{
				case "mario":
				case "character": return new Mario();
					break;				
				case "koopa": return new Koopa();
					break;			
				case "goomba": return new Goomba();
					break;			
				case "enemy": 
					return new ([Koopa,Goomba][Math.round(Math.random())]) as Actor;
					break;
			}
		}
	}
}