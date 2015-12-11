package phisics {
	import game.CoinsController;
	import ru.antkarlov.anthill.AntG;
	import ru.antkarlov.anthill.AntMath;
	import ru.antkarlov.anthill.plugins.box2d.AntBox2DBody;
	import ru.antkarlov.anthill.plugins.box2d.shapes.AntBox2DCircleShape;
	import states.GameStateTest;
	
	/**
	 * Монета с физикой
	 * ...
	 * @author Vladimir
	 */
	public class Coin extends AntBox2DBody {
		
		private var controller:CoinsController;
		private var coinValue:int;
		
		private static var collideFilters:Array = [
			"lvlCoin_1", 
			"lvlCoin_2", 
			"lvlCoin_3", 
			"lvlCoin_4" ];
		
		/** Счетчик времени прожитого монетой */
		private var liveTimeCount:Number = 0;
		
		private var maxLiveTime:Number = 3;
		
		
		public function Coin() {
			super();
			maxLiveTime = AntMath.randomRangeNumber(1, 4);
			makeBody();
		}
		
		public function init(contr:CoinsController, coinValue:int):void {
			this.controller = contr;
			this.coinValue = coinValue;
		}
		
		override public function update():void {
			super.update();
			liveTimeCount += AntG.elapsed;
			if (liveTimeCount >= maxLiveTime) {
				controller.makeFlyCoin(this.x, this.y, coinValue);
				liveTimeCount = 0;
				kill();
			}
			if (x > AntG.width || x < 0 || y > AntG.height) {
				liveTimeCount = 0;
				kill();
			}
		}
		
		private function makeBody():void {
			var shape:AntBox2DCircleShape = new AntBox2DCircleShape();
			shape.radius = 8;
			shape.density = 2;
			shape.friction = 0.1;
			shape.restitution = 0.1;
			shape.x = 8;
			shape.y = 8;
			
			//this.applyCollisionFlag(collideFilters[AntMath.randomRangeInt(0, collideFilters.length - 1)]);
			this.applyShapes(shape);
			this.kind = AntBox2DBody.DYNAMIC;
			addAnimationFromCache("coin");
		}
	
	}

}