package game_prototype {
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntG;
	
	/**
	 * ...
	 * @author Vladimir
	 */
	public class Medic extends AntActor {
		
		public var heal:int = 20;
		private var countHeal:Number = 0;
		private var _healTime:Number = 3;
		
		private var world:PrototypeState;
		
		public function Medic(world:PrototypeState) {
			super();
			this.world = world;
			addAnimationFromCache("medic");
		}
		
		override public function update():void {
			super.update();
			countHeal += AntG.elapsed;
			if (countHeal >= _healTime) {
				if (world.hero.health > 0 && (world.hero.health < world.hero.maxHealth)) {
					countHeal = 0;
					world.hero.health += heal;
					if (world.hero.health > world.hero.maxHealth)
						world.hero.health = world.hero.maxHealth;
					world.heal(heal, world.hero.x + 5, world.hero.y - 30);
					world.showLabel("heal", this.x - 4, this.y - 30);
				}
			}
		}
		
		public function get healTime():Number {
			return _healTime;
		}
		
		public function set healTime(value:Number):void {
			value = value < 0.2 ? 0.2 : value;
			value = int(value * 100) / 100;
			_healTime = value;
		}
	
	}

}