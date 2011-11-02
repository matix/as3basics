package {
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Collision.Shapes.b2Shape;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2DebugDraw;
	import Box2D.Dynamics.b2Fixture;
	import Box2D.Dynamics.b2FixtureDef;
	import Box2D.Dynamics.b2World;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class Main extends Sprite {
		private var world:b2World;
		private var ddSprite:Sprite;
		private static var SCALE:Number = 30;
		
		public function Main() {
			world = new b2World(new b2Vec2(0, 9.8), true);
			ddSprite = new Sprite();
			addChild(ddSprite);
			
			var groundShape:b2PolygonShape = new b2PolygonShape();
			groundShape.SetAsBox((stage.stageWidth/2)/SCALE, 10/SCALE);
			var fixtureDef:b2FixtureDef = new b2FixtureDef();
			fixtureDef.density = 0;
			fixtureDef.shape = groundShape;
			var bodyDef:b2BodyDef = new b2BodyDef();
			bodyDef.position.Set((stage.stageWidth / 2) / SCALE, stage.stageHeight / SCALE);
			var ground:b2Body = world.CreateBody(bodyDef);
			
			ground.CreateFixture(fixtureDef);
			
			var dd:b2DebugDraw = new b2DebugDraw();
			dd.SetAlpha(.7);
			dd.SetFlags(b2DebugDraw.e_shapeBit|b2DebugDraw.e_centerOfMassBit);
			dd.SetDrawScale(SCALE);
			dd.SetSprite(ddSprite);
			world.SetDebugDraw(dd);
			
			stage.addEventListener(MouseEvent.CLICK, onClick)
			addEventListener(Event.ENTER_FRAME, mainLoop);
		}
		
		private function onClick(e:MouseEvent):void 
		{
			makeSquare(e.stageX, e.stageY);
		}
		
		private function makeSquare(x:Number, y:Number):void 
		{
			var shape:b2PolygonShape = new b2PolygonShape();
			shape.SetAsBox((Math.random()*40)/SCALE,(Math.random()*40)/SCALE);
			var fixtureDef:b2FixtureDef = new b2FixtureDef();
			fixtureDef.density = Math.random()*2;
			fixtureDef.friction = .3;
			fixtureDef.restitution = .3;
			fixtureDef.shape = shape;
			var bodyDef:b2BodyDef = new b2BodyDef();
			bodyDef.position.Set(x/SCALE, y/SCALE);
			bodyDef.type = b2Body.b2_dynamicBody;
			var body:b2Body = world.CreateBody(bodyDef);
			
			body.CreateFixture(fixtureDef);
		}
		
		private function mainLoop(e:Event):void 
		{
			world.Step(1 / 30, 10, 10);
			world.ClearForces();
			world.DrawDebugData();
		}
	}
}