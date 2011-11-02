package as3basics 
{
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2FixtureDef;
	import Box2D.Dynamics.b2World;
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author matix
	 */
	public class Box extends Sprite
	{
		private var world:b2World;
		private var body:b2Body;
		private var SCALE:Number;
		
		public function Box(world:b2World,x:Number, y:Number, SCALE:Number) 
		{
			this.world = world;
			this.SCALE = SCALE;
			setupPhysics(x,y);
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void 
		{
			var p:b2Vec2 = body.GetWorldCenter();
			var r:Number = body.GetAngle();

			this.x = p.x * SCALE;
			this.y = p.y * SCALE;
			this.rotation = r * (180 / Math.PI);
		}
		
		private function setupPhysics(x:Number, y :Number):void 
		{
			var shape:b2PolygonShape = new b2PolygonShape();
			shape.SetAsBox(40/SCALE,40/SCALE);
			var fixtureDef:b2FixtureDef = new b2FixtureDef();
			fixtureDef.density = Math.random()*2;
			fixtureDef.friction = .3;
			fixtureDef.restitution = .3;
			fixtureDef.shape = shape;
			var bodyDef:b2BodyDef = new b2BodyDef();
			bodyDef.position.Set(x/SCALE, y/SCALE);
			bodyDef.type = b2Body.b2_dynamicBody;
			body = world.CreateBody(bodyDef);
			
			body.CreateFixture(fixtureDef);
		}
		
	}

}