package game.user {
	import game.data.LevelingData;
	import game.GameProgress;
	import ru.antkarlov.anthill.AntG;
	import states.GameState;
	import units.enemies.EnemyBase;
	
	/**
	 * Отвечает за обработку кликов игрока по врагам и по стражу.
	 * ...
	 * @author Vladimir
	 */
	public class UserClicker {
		
		public var damage:int = 5;
		public var maxDelay:Number = 1;
		
		private var currentDelay:Number = 0;
		
		public function UserClicker() {
		
		}
		
		public function update():void {
			damage = LevelingData.guardsAttackPowerLeveling[GameProgress.getInstance().leveling[0]].value;
			var gameState:GameState = GameState.instance;
			if (gameState.isPause) {
				return;
			}
			currentDelay += AntG.elapsed;
			
			if (currentDelay >= maxDelay && AntG.mouse.isPressed()) {
				var en:EnemyBase;
				for (var i:int = 0; i < gameState.enemies.length; i++) {
					en = gameState.enemies[i];
					if (en.alive && en.health > 0 && en.hitTest(AntG.mouse.x, AntG.mouse.y)) {
						en.hammer(damage);
						currentDelay = 0;
						return;
					}
				}
			}
		}
	
	}

}