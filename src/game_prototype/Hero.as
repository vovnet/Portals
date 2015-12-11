package game_prototype {
	import gui.HealthLine;
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntG;
	import ru.antkarlov.anthill.AntLabel;
	import ru.antkarlov.anthill.AntMath;
	
	/**
	 * ...
	 * @author Vladimir
	 */
	public class Hero extends AntActor {
		
		public var damage:int = 25;
		public var maxHealth:int = 300000;
		public var attackPercent:int = 50;
		public var minDamage:int = 500;
		public var maxDamage:int = 1500;
		
		private var currentState:int = 1;
		private var waitingState:int = 1;
		private var attackState:int = 2;
		private var deadState:int = 3;
		
		private var countDelayAttack:Number = 0;
		private var _delayAttack:Number = 3.5;
		
		private var enemy:Enemy;
		private var world:PrototypeState;
		
		private var label:AntLabel;
		
		public function Hero() {
			super();
			addAnimationFromCache("hero");
			health = 300;
			label = new AntLabel("system");
			label.reset(0, 50);
			add(label);
			
		}
		
		public function init(world:PrototypeState):void {
			this.world = world;
			health = maxHealth;
			countDelayAttack = delayAttack;
			label.revive();
			label.text = health.toString();
			currentState = waitingState;
			enemy = null;
		}
		
		public function setEnemy(enemy:Enemy):void {
			this.enemy = enemy;
		}
		
		override public function update():void {
			super.update();
			if (health <= 0) currentState = deadState;
			
			label.text = health.toString();
			
			switch (currentState) {
				case waitingState: 
					if (enemy != null && enemy.health > 0)
						currentState = attackState;
					break;
				case attackState: 
					if (countDelayAttack >= delayAttack && enemy != null) {
						countDelayAttack = 0;
						attack();
					}
					countDelayAttack += AntG.elapsed;
					if (enemy != null && enemy.health <= 0) {
						//enemy = null;
						currentState = waitingState;
					}
					break;
				case deadState: 
					this.kill();
					break;
			}
		}
		
		private function attack():void {
			var isCritical:Boolean = AntMath.randomRangeInt(1, 100) <= attackPercent;
			damage = AntMath.randomRangeInt(minDamage, maxDamage);
			damage = isCritical ? (minDamage + maxDamage) * AntMath.randomRangeNumber(1.1, 1.7) : damage;
			enemy.health -= damage;
			world.attack(damage, enemy.x, enemy.y - 20);
			if (isCritical)
				world.showLabel("Critical", enemy.x - 6, enemy.y - 60);
			if (enemy.health <= 0)
				enemy = null;
		}
		
		public function get delayAttack():Number {
			return _delayAttack;
		}
		
		public function set delayAttack(value:Number):void {
			value = value < 0.2 ? 0.2 : value;
			value = int(value * 100) / 100;
			_delayAttack = value;
		}
	
	}

}