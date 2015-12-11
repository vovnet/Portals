package game {
	import flash.events.Event;
	import graphics.CoinGraphic;
	import gui.textFields.BonusTextField;
	import gui.textFields.TriggeredTextField;
	import phisics.Coin;
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntMath;
	import ru.antkarlov.anthill.plugins.box2d.AntBox2DBody;
	import ru.antkarlov.anthill.plugins.box2d.AntBox2DManager;
	import ru.antkarlov.anthill.plugins.box2d.shapes.AntBox2DBoxShape;
	
	/**
	 * Отображение выпадающих монет и их подсчет.
	 * Физика и платформы тут же.
	 * ...
	 * @author Vladimir
	 */
	public class CoinsController extends AntActor {
		
		public static var world:AntBox2DManager;
		private var moneyLabel:TriggeredTextField;
		
		public function CoinsController() {
			super();
			
			world = new AntBox2DManager();
			world.create();
			//world.enableDebugDraw = true;
			
			moneyLabel = new TriggeredTextField(32, 0xffffff, GameProgress.getInstance().money.toString());
			moneyLabel.reset(20, 10);
			add(moneyLabel);
			
			createPlatform(0, 394, ["lvlCoin_1", "lvlCoin_2", "lvlCoin_3", "lvlCoin_4"]);
		}
		
		public function addMoney(value:int):void {
			GameProgress.getInstance().money += value;
			moneyLabel.setText(GameProgress.getInstance().money.toString());
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
			//body.allowDebugDraw = true;
			//body.addAnimationFromCache("trava");
			body.applyCollidesFlags(filter);
			
			add(body);
		}
		
		/**
		 * Создает монету с физикой и добавляет ее на экран
		 * @param	posX Позиция х
		 * @param	posY Позиция y
		 */
		public function makeCoin(posX:int, posY:int, coinValue:int):void {
			var coin:Coin = recycle(Coin) as Coin;
			coin.init(this, coinValue);
			coin.revive();
			coin.reset(posX, posY);
			coin.create(world);
			coin.applyImpulse(AntMath.randomRangeNumber(1, 1.5), AntMath.randomRangeNumber(-1, -2));
			coin.applyAngularVelocity(10);
		}
		
		/**
		 * Создает и добавляет на экран монету, которая летит в кошелек,
		 * а также отображает всплывающий лейбл типа +500$
		 * @param	posX
		 * @param	posY
		 */
		public function makeFlyCoin(posX:Number, posY:Number, coinValue:int):void {
			var coin:CoinGraphic = recycle(CoinGraphic) as CoinGraphic;
			coin.init(0, 20, this, coinValue);
			coin.revive();
			coin.reset(posX, posY);
			add(coin);
			
			var label:BonusTextField = recycle(BonusTextField) as BonusTextField;
			label.init("+" + coinValue.toString(), 0x0080c9);
			label.revive();
			label.reset(posX, posY);
		
		}
	
	}

}