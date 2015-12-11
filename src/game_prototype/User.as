package game_prototype {
	import adobe.utils.ProductManager;
	import flash.events.AVStreamSwitchEvent;
	import ru.antkarlov.anthill.AntG;
	import ru.antkarlov.anthill.AntMath;
	
	/**
	 * ...
	 * @author Vladimir
	 */
	public class User {
		
		public var minDamage:int = 1;
		public var maxDamage:int = 10;
		public var timeAttack:int = 3;
		
		private var countAttackTime:Number = 0;
		
		private var world:PrototypeState;
		private var hero:Hero;
		
		public function User(world:PrototypeState) {
			this.world = world;
			this.hero = world.hero;
			countAttackTime = timeAttack;
		}
		
		public function update():void {
			countAttackTime += AntG.elapsed;
			hero = world.hero;
			
			if (AntG.mouse.isPressed()) {
				var en:Enemy;
				var enemies:Vector.<Enemy> = world.enemies;
				var damage:int;
				for (var i:int = 0; i < enemies.length; i++) {
					en = enemies[i];
					if (en.alive && en.hitTest(AntG.mouse.x, AntG.mouse.y) && countAttackTime >= timeAttack) {
						countAttackTime = 0;
						damage = AntMath.randomRangeInt(minDamage, maxDamage);
						en.hurt(damage);
						world.attack(damage, en.x , en.y - 50);
						break;
					}
				}
				if (hero.alive && hero.hitTest(AntG.mouse.x, AntG.mouse.y)) {
					hero.health += 4;
					world.heal(4, hero.x, hero.y - 50);
				}
			}
		}
	
	}

}