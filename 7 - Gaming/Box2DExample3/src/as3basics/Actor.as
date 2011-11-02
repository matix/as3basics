package as3basics 
{
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2World;
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author matix
	 */
	public class Actor extends Sprite
	{
		protected var world:b2World;
		protected var body:b2Body;
		protected var SCALE:Number;
		
		public function Actor(world:b2World,x:Number, y:Number, SCALE:Number) 
		{
			this.world = world;
			this.SCALE = SCALE;
			setupPhysics(x,y);
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		protected function update(e:Event):void 
		{
			var p:b2Vec2 = body.GetWorldCenter();
			var r:Number = body.GetAngle();

			this.x = p.x * SCALE;
			this.y = p.y * SCALE;
			this.rotation = r * (180 / Math.PI);
		}
		
		protected function setupPhysics(x:Number, y :Number):void 
		{
			//override on childs.
		}
	}

}