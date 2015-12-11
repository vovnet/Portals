package states {
	import flash.events.Event;
	import flash.events.MouseEvent;
	import graphics.CoinGraphic;
	import phisics.Coin;
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntButton;
	import ru.antkarlov.anthill.AntEntity;
	import ru.antkarlov.anthill.AntG;
	import ru.antkarlov.anthill.AntLabel;
	import ru.antkarlov.anthill.AntMath;
	import ru.antkarlov.anthill.AntPoint;
	import ru.antkarlov.anthill.AntState;
	import ru.antkarlov.anthill.plugins.AntTween;
	import ru.antkarlov.anthill.plugins.box2d.AntBox2DBody;
	import ru.antkarlov.anthill.plugins.box2d.AntBox2DDrawer;
	import ru.antkarlov.anthill.plugins.box2d.AntBox2DManager;
	import ru.antkarlov.anthill.plugins.box2d.shapes.AntBox2DBoxShape;
	import sources.Assets;
	import gui.textFields.BonusTextField;
	import gui.textFields.TriggeredTextField;
	
	/**
	 * ...
	 * @author Vladimir
	 */
	public class GameStateTest extends AntState {
		
		public static var instance:GameStateTest;
		private var world:AntBox2DManager;
		private var actor:AntActor;
		private var moneyLabel:TriggeredTextField;
		private var countMoney:int = 0;
		
		private var guiLayer:AntActor = new AntActor();
		private var gameLayer:AntActor = new AntActor();
		
		public function GameStateTest() {
			super();
			addEventListener(Event.ADDED_TO_STAGE, onStage);
		}
		
		private function onStage(e:Event):void {
			removeEventListener(Event.ADDED_TO_STAGE, onStage);
			
			instance = this;
			
			var back:AntActor = new AntActor();
			back.addAnimationFromCache("back");
			back.reset( -50, -50);
			gameLayer.add(back);
			add(gameLayer);
			add(guiLayer);
			
			world = new AntBox2DManager();
			world.create();
			world.enableDebugDraw = true;
			
			createPlatform(0, 430, ["lvlCoin_1"]);
			createPlatform(0, 470, ["lvlCoin_1", "lvlCoin_2"]);
			createPlatform(0, 510, ["lvlCoin_1", "lvlCoin_2", "lvlCoin_3"]);
			createPlatform(0, 550, ["lvlCoin_1", "lvlCoin_2", "lvlCoin_3", "lvlCoin_4"]);
			
			moneyLabel = new TriggeredTextField(32);
			moneyLabel.reset(20, 10);
			guiLayer.add(moneyLabel);
			
			addEventListener(MouseEvent.CLICK, onClick);
		
		}
		
		override public function update():void {
			super.update();
			//AntG.watchValue("val", AntTween.getNumCacheItems());
			
			// вкл./выкл. отладочной отрисовки физики
			if (AntG.keys.isPressed("D"))
				world.enableDebugDraw = !world.enableDebugDraw;
		}
		
		public function setMoney(value:int):void {
			countMoney += value;
			moneyLabel.setText(countMoney.toString());
		}
		
		public function flyCoin(posX:Number, posY:Number):void {
			var coin:CoinGraphic = defGroup.recycle(CoinGraphic) as CoinGraphic;
			coin.init(0, 20);
			coin.revive();
			coin.reset(posX, posY);
			gameLayer.add(coin);
			var label:BonusTextField = guiLayer.recycle(BonusTextField) as BonusTextField;
			label.init("+150", 0x0080c9);
			label.revive();
			label.reset(posX, posY);
		}
		
		private function onClick(e:MouseEvent):void {
			var ent:AntEntity = new AntEntity();
			ent.reset(400, 300);
			AntG.getCamera().target = ent;
			AntG.getCamera().shake();
			createBonusLabel();
			createCoin();
			createCoin();
			createCoin();
			createCoin();
			createCoin();
			createCoin();
			createCoin();
			createCoin();
			createCoin();
			createCoin();
			createCoin();
		}
		
		private function createBonusLabel():void {
			var label:BonusTextField = guiLayer.recycle(BonusTextField) as BonusTextField;
			label.init("2x COMBO", 0x990000);
			label.revive();
			label.reset(mouseX - 50, mouseY-40);
		}
		
		private function createPlatform(posX:Number, posY:Number, filter:Array):void {
			var shape:AntBox2DBoxShape = new AntBox2DBoxShape();
			shape.width = 1600;
			shape.height = 1;
			shape.y = 5;
			
			var body:AntBox2DBody = new AntBox2DBody();
			body.applyShapes(shape);
			body.reset(posX, posY);
			body.kind = AntBox2DBody.STATIC;
			body.create(world);
			body.allowDebugDraw = true;
			//body.addAnimationFromCache("trava");
			body.applyCollidesFlags(filter);
			
			gameLayer.add(body);
		}
		
		private function createCoin():void {
			var coin:Coin = gameLayer.recycle(Coin) as Coin;
			coin.revive();
			coin.reset(mouseX, mouseY);
			coin.create(world);
			coin.applyImpulse(AntMath.randomRangeNumber(-1, -1.5), AntMath.randomRangeNumber(-1, -2));
			coin.applyAngularVelocity(-10);
		}
	
	}

}