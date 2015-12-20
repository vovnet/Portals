package game.user {
	import game.data.SkillsData;
	import game.GameProgress;
	import ru.antkarlov.anthill.AntG;
	import ru.antkarlov.anthill.extensions.skills.AntSkills;
	import sources.SkillManager;
	import states.GameState;
	import units.enemies.EnemyBase;
	
	/**
	 * Отвечает за обработку кликов игрока по врагам и по стражу.
	 * 
	 * @author Vladimir
	 */
	public class UserClicker {
		
		public var damage:int = 5;
		
		/**
		 * Обязательная задержка между кликами игрока.
		 */
		public var clickDelay:Number = 1;
		
		/**
		 * Сколько времени прошло с прошлого клика.
		 */
		private var prevClickDelay:Number = 0;
		
		public function UserClicker() {
		
		}
		
		public function update():void {
			damage = AntSkills.getCurrentValue(SkillManager.USER_ATTACK_POWER);
			clickDelay = AntSkills.getCurrentValue(SkillManager.USER_ATTACK_SPEED);
			var gameState:GameState = GameState.instance;
			if (gameState.isPause) {
				return;
			}
			prevClickDelay += AntG.elapsed;
			
			if (prevClickDelay >= clickDelay && AntG.mouse.isPressed()) {
				var en:EnemyBase;
				for (var i:int = 0; i < gameState.enemies.length; i++) {
					en = gameState.enemies[i];
					if (en.alive && en.health > 0 && en.hitTest(AntG.mouse.x, AntG.mouse.y)) {
						en.hammer(damage);
						prevClickDelay = 0;
						return;
					}
				}
			}
		}
	
	}

}