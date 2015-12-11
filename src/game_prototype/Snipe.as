package game_prototype {
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntG;
	
	/**
	 * ...
	 * @author Vladimir
	 */
	public class Snipe extends AntActor {
		
		public var damage:int = 10;
		
		private var _attackTime:Number = 3;
		private var countAttack:Number = 3;
		
		private var world:PrototypeState;
		
		private var attackState:int = 1;
		private var currentState:int = 1;
		
		private var enemy:Enemy;
		
		public function Snipe(world:PrototypeState) {
			super();
			this.world = world;
			addAnimationFromCache("snipe");
		}
		
		override public function update():void {
			super.update();
			if (countAttack >= _attackTime) {
				if (world.enemies.length > 0)
					enemy = world.enemies[0];
				if (enemy != null && enemy.alive) {
					enemy.health -= damage;
					world.attack(damage, enemy.x, enemy.y - 50);
					world.showLabel("Fire!", this.x, this.y - 50, 0xf03705);
					countAttack = 0;
				}
			}
			countAttack += AntG.elapsed;
		}
		
		public function get attackTime():Number {
			return _attackTime;
		}
		
		public function set attackTime(value:Number):void {
			value = value < 0.2 ? 0.2 : value;
			value = int(value * 100) / 100;
			_attackTime = value;
		}
	
	}

}