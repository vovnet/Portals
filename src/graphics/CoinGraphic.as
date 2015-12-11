package graphics {
	import game.CoinsController;
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntG;
	
	/**
	 * ...
	 * @author Vladimir
	 */
	public class CoinGraphic extends AntActor {
		
		private var posX:Number;
		private var posY:Number;
		private var controller:CoinsController;
		private var coinValue:int;
		
		public function CoinGraphic() {
			super();
			addAnimationFromCache("coin");
		}
		
		public function init(posX:Number, posY:Number, controller:CoinsController, coinValue:int):void {
			this.posX = posX;
			this.posY = posY;
			this.controller = controller;
			this.coinValue = coinValue;
		}
		
		override public function update():void {
			super.update();
			x += (posX - x) * 0.2;
			y += (posY - y) * 0.2;
			// монета прилетела в пункт назначения
			if (x <= posX + 1 && y <= posY + 1) {
				controller.addMoney(coinValue);
				kill();
			}
		}
	
	}

}