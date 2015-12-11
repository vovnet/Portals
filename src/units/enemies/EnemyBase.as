package units.enemies {
	import flash.geom.Point;
	import gui.HealthLine;
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntG;
	import states.GameState;
	
	/**
	 * ...
	 * @author Vladimir
	 */
	public class EnemyBase extends AntActor {
		
		// states
		public static const WALK_STATE:int = 1;
		public static const ATTACK_STATE:int = 2;
		public static const DEATH_STATE:int = 3;
		public static const OUT_STATE:int = 4;
		
		protected var currentState:int = 1;
		
		// полоса здоровья юнита
		protected var healthLine:HealthLine;
		
		// время прошедшее с момента последнего удара
		protected var currentTimeAttack:Number = 0;
		
		// боевые характеристики юнита
		protected var maxDelayAttack:Number;
		protected var startHealth:int;
		protected var damage:int;
		protected var minAttackDistance:int;
		protected var maxAttackDistance:int;
		protected var speed:int;
		protected var price:int;
		protected var coinValue:int;
		
		protected var posX:int;
		protected var posY:int;
		
		public function EnemyBase() {
			super();
			create(); // генерируем уникальный вид
			init();
		}
		
		/**
		 * Перекрыть метод в наследниках, для создания уникального вида
		 * и характеристик.
		 */
		protected function create():void {
			addAnimationFromCache("unitWalk_01", "walk");
			addAnimationFromCache("unitAttack_01", "attack");
			addAnimationFromCache("unitDeath_01", "death");
			addAnimationFromCache("unitStand_01", "stay");
			addAnimationFromCache("unitOut_01", "out");
			
			startHealth = 130;
			damage = 8;
			minAttackDistance = 30;
			maxAttackDistance = 50;
			speed = -30;
			maxDelayAttack = 2;
			price = 5;
			coinValue = 17;
			
			posX = 800;
			posY = 330;
			
			healthLine = new HealthLine(this, startHealth);
			add(healthLine);
			healthLine.reset(8, -16);
		}
		
		/**
		 * Вызвать для инициализации объекта, после его воскрешения
		 */
		public function init():void {
			play();
			moves = true;
			velocity.x = speed;
			health = startHealth;
			reset(posX, posY);
		}
		
		public function ray():void {
			GameState.instance.showRay(x + 14, -40);
		}
		
		override public function update():void {
			super.update();
			
			switch (currentState) {
				case WALK_STATE: 
					walkingState();
					break;
				case ATTACK_STATE: 
					attackingState();
					break;
				case DEATH_STATE: 
					moves = false;
					switchAnimation("death");
					if (currentFrame == totalFrames) {
						kill();
					}
					break;
				case OUT_STATE: 
					outingState();
					break;
			}
			
			currentTimeAttack += AntG.elapsed;
		}
		
		override public function kill():void {
			var index:int = GameState.instance.enemies.indexOf(this);
			GameState.instance.enemies.splice(index, 1);
			super.kill();
		}
		
		/**
		 * Метод вызывается для нанесения урона этому юниту
		 * @param	aDamage Получаемый урон
		 * @param	isCrit Флаг критичности урона
		 * @return
		 */
		public function hammer(aDamage:Number, isCrit:Boolean = false):Boolean {
			health -= aDamage;
			GameState.instance.showHammer(aDamage, new Point(x, y - 40), isCrit);
			if (health <= 0) {
				health = 0;
				currentState = DEATH_STATE;
				GameState.instance.deadEnemy(x + 10, y - 20, price, coinValue);
			}
			return true;
		}
		
		private function walkingState():void {
			switchAnimation("walk");
			moves = true;
			if (GameState.instance.guardHero != null && (x - GameState.instance.guardHero.x) < maxAttackDistance && (x - GameState.instance.guardHero.x) > minAttackDistance) {
				currentState = ATTACK_STATE;
			}
			if (x <= 108) {
				currentState = OUT_STATE;
			}
		}
		
		private function attackingState():void {
			moves = false;
			if (currentTimeAttack >= maxDelayAttack) {
				switchAnimation("attack");
				currentTimeAttack = 0;
			}
			if (currentAnimation == "attack" && currentFrame == 4 && GameState.instance.guardHero != null) {
				GameState.instance.guardHero.hurt(damage);
			}
			if (currentFrame == totalFrames) {
				switchAnimation("stay");
			}
			if (GameState.instance.guardHero == null) {
				currentState = WALK_STATE;
			}
		}
		
		private function outingState():void {
			switchAnimation("out");
			if (currentFrame == totalFrames) {
				GameState.instance.outOfPortal();
				kill();
			}
		}
		
		
	}

}