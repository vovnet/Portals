package units.protagonists.sniper {
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntG;
	import states.GameState;
	import units.enemies.EnemyBase;
	
	/**
	 * ...
	 * @author Vladimir
	 */
	public class Sniper extends AntActor {
		
		private var currentTimeAttack:Number = 0;
		
		public var maxDelayAttack:Number = 1.5;
		public var damage:int = 4;
		
		private var enemy:EnemyBase;
		
		public function Sniper() {
			super();
			addAnimationFromCache("snipeStay", "stay");
			addAnimationFromCache("sniperAttack", "attack", false);
			play();
		}
		
		override public function update():void {
			super.update();
			
			currentTimeAttack += AntG.elapsed;
			
			if (currentTimeAttack >= maxDelayAttack) {
				findEnemy();
				if (enemy != null && enemy.alive) {
					currentTimeAttack = 0;
					switchAnimation("attack");
				}
			}
			
			if (currentAnimation == "attack" && currentFrame == 12 && enemy != null && enemy.health > 0) {
				enemy.hammer(damage);
				enemy.ray();
			}
			
			if (currentAnimation == "attack" && currentFrame == totalFrames) {
				switchAnimation("stay");
			}
		}
		
		/**
		 * Ищет цель для атаки
		 */
		private function findEnemy():void {
			var listOfEnemies:Vector.<EnemyBase> = GameState.instance.enemies;
			for (var i:int = 0; i < listOfEnemies.length; i++) {
				if (enemy == null || !enemy.alive) {
					enemy = listOfEnemies[i];
				} else {
					// ищем самого здорового врага
					if (listOfEnemies[i].health >= enemy.health) {
						enemy = listOfEnemies[i];
					}
				}
			}
		}
	
	}

}