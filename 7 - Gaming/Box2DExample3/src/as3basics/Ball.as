package as3basics 
{
	import Box2D.Collision.b2ContactPoint;
	import Box2D.Collision.Shapes.b2CircleShape;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2FixtureDef;
	import Box2D.Dynamics.b2World;
	import Box2D.Dynamics.Joints.b2JointDef;
	import Box2D.Dynamics.Joints.b2MouseJoint;
	import Box2D.Dynamics.Joints.b2MouseJointDef;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	/**
	 * ...
	 * @author matix
	 */
	public class Ball extends Actor
	{
		private var downPoint:Point;
		private var mouseJoint:b2MouseJoint;
		private var ctrl:Boolean = false;
		
		public function Ball(world:b2World,x:Number, y:Number, SCALE:Number) 
		{
			super(world, x, y, SCALE);
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		private function onAdded(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			stage.addEventListener(MouseEvent.CLICK, onMouseClick,false,1);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKey);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKey);
		}
		
		private function onKey(e:KeyboardEvent):void 
		{
			if (e.keyCode == Keyboard.CONTROL) {
				ctrl = e.type == KeyboardEvent.KEY_DOWN;
			}
		}
		
		private function onMouseClick(e:MouseEvent):void 
		{
			if(ctrl){
				var ppx:Point = globalToLocal(new Point(e.stageX, e.stageY));
				ppx.normalize(100);
				var p:b2Vec2 = new b2Vec2(ppx.x, ppx.y);
				body.ApplyImpulse(p, body.GetWorldCenter());
				e.stopImmediatePropagation();
			}
		}
		
		override protected function update(e:Event):void 
		{
			super.update(e);
			if (this.y > stage.stageHeight + 40) {
				body.SetPosition(new b2Vec2((stage.stageWidth / 2) / SCALE, 0));
			}
		}
		
		override protected function setupPhysics(x:Number, y :Number):void 
		{
			var shape:b2CircleShape = new b2CircleShape();
			shape.SetRadius(40 / SCALE);
			var fixtureDef:b2FixtureDef = new b2FixtureDef();
			fixtureDef.density = 2;
			fixtureDef.friction = .3;
			fixtureDef.restitution = .7;
			fixtureDef.shape = shape;
			var bodyDef:b2BodyDef = new b2BodyDef();
			bodyDef.position.Set(x/SCALE, y/SCALE);
			bodyDef.type = b2Body.b2_dynamicBody;
			body = world.CreateBody(bodyDef);
			
			body.CreateFixture(fixtureDef);
		}
	}

}