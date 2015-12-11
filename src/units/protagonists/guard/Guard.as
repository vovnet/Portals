package units.protagonists.guard {
	import flash.geom.Point;
	import gui.HealthLine;
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntG;
	import ru.antkarlov.anthill.AntMath;
	import states.GameState;
	import units.enemies.EnemyBase;
	
	/**
	 * Страж стоящий перед порталом
	 * ...
	 * @author Vladimir
	 */
	public class Guard extends AntActor {
		
		public static const STAY_STATE:int = 1;
		public static const ATTACK_STATE:int = 2;
		public static const DEATH_STATE:int = 3;
		
		private static const SHOW_STATE:int = 4;
		private static const HIDE_STATE:int = 5;
		
		public var currentState:int = 1;
		
		private var maxDelayAttack:Number = 1;
		private var currentTimeAttack:Number = 0;
		public var enemy:EnemyBase;
		private var damage:int = 15;
		public var attackPercent:int = 10;
		public var startHealth:int = 450;
		
		public function Guard() {
			super();
			addAnimationFromCache("guardStay", "stay");
			addAnimationFromCache("guardAttack", "attack");
			addAnimationFromCache("guardDeath", "death");
			play();
			var healthLine:HealthLine = new HealthLine(this, startHealth);
			healthLine.reset(16, -22);
			add(healthLine);
		}
		
		public function init():void {
			health = startHealth;
		}
		
		override public function update():void {
			super.update();
			
			switch (currentState) {
				case STAY_STATE: 
					staingState();
					break;
				case ATTACK_STATE: 
					attackingState();
					break;
				case DEATH_STATE: 
					switchAnimation("death");
					if (currentFrame == totalFrames) {
						currentState = HIDE_STATE;
						return;
					}
					break;
				case SHOW_STATE:
					
					break;
				case HIDE_STATE: 
					kill();
					GameState.instance.guardHero = null;
					break;
			}
			
			if (health <= 0) {
				currentState = DEATH_STATE;
			}
			
			if (enemy == null) {
				checkEnemies();
			}
			
			currentTimeAttack += AntG.elapsed;
		}
		
		/**
		 * Вызвать метод, если нужно полечить юнита
		 * @param	value Количество восстанавливаемого здоровья
		 */
		public function heal(value:int):void {
			health += value;
			if (health > startHealth) {
				health = startHealth;
			}
			GameState.instance.showHeal(value, x + 10, y - 30);
		}
		
		/**
		 * Наносит урон стражу
		 * @param	aDamage
		 * @return
		 */
		override public function hurt(aDamage:Number):Boolean {
			GameState.instance.showHammer(aDamage, new Point(x, y - 40));
			health -= aDamage;
			if (health <= 0) {
				currentState = DEATH_STATE;
			}
			return true;
		}
		
		public function setState(state:int):void {
			currentState = state;
		}
		
		private function staingState():void {
			switchAnimation("stay");
			
			if (enemy != null) {
				currentState = ATTACK_STATE;
			} else {
				checkEnemies();
			}
		}
		
		private function attackingState():void {
			if (currentTimeAttack >= maxDelayAttack) {
				switchAnimation("attack");
				currentTimeAttack = 0;
			}
			
			if (currentAnimation == "attack" && currentFrame == 12 && enemy != null && enemy.health > 0) {
				var isCritical:Boolean = AntMath.randomRangeInt(1, 100) <= attackPercent;
				var aDamage:int = isCritical ? damage * 1.5 : damage;
				enemy.hammer(aDamage, isCritical);
			}
			
			if (enemy != null && enemy.health <= 0) {
				enemy = null;
				currentState = STAY_STATE;
			}
			
			if (currentAnimation == "attack" && currentFrame == totalFrames) {
				switchAnimation("stay");
			}
		}
		
		/**
		 * Проверяет есть ли поблизости враг и если враг обнаружен,
		 * то будет добавлен как цель.
		 */
		private function checkEnemies():void {
			var enemies:Vector.<EnemyBase> = GameState.instance.enemies;
			for (var i:int = 0; i < enemies.length; i++) {
				if (enemies[i].health > 0 && enemies[i].x - x < 70 && enemies[i].x - x > 10) {
					enemy = enemies[i];
					return;
				}
			}
			enemy = null;
		}
	
	}

}