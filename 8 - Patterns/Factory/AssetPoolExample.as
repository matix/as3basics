package 
{
	public class Actor
	{...}
	public class Enemy extends Actor
	{...}
	public class Koopa extends Enemy
	{...}
	public class Goomba extends Enemy
	{...}
	
	public class EnemyPool
	{
		private static const POOL_SIZE:int = 10;
		private static var pool:Vector.<Enemy> = new <Enemy>[];
		
		public static function getEnemy():Enemy
		{
			var enemy:Enemy;
			if(pool.length < POOL_SIZE)
			{
				enemy = new ([Koopa,Goomba][Math.round(Math.random())]) as Enemy;
			}
			else
			{
				enemy = pool.shift();
			}
			
			pool.push(enemy);
			return enemy
		}
	}
}

