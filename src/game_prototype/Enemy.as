package game_prototype {
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntG;
	import ru.antkarlov.anthill.AntLabel;
	import ru.antkarlov.anthill.AntMath;
	
	/**
	 * ...
	 * @author Vladimir
	 */
	public class Enemy extends AntActor {
		
		public var speed:Number = 100;
		public var damage:int = 9;
		public var minDamage:int = 3;
		public var maxDamage:int = 19;
		
		private var world:PrototypeState;
		private var currentState:int = 1;
		private var moveState:int = 1;
		private var atackState:int = 2;
		private var deadState:int = 3;
		
		private var countDelayAttack:Number = 0;
		private var delayAttack:Number = 1.7;
		
		private var label:AntLabel;
		
		public function Enemy() {
			super();
			health = 100;
			addAnimationFromCache("enemy");
			label = new AntLabel("system", 8, 0x247bde);
			label.reset(0, 50);
			add(label);
		}
		
		public function init(world:PrototypeState):void {
			this.world = world;
			health = 20000;
			currentState = moveState;
			label.revive();
			label.text = health.toString();
		}
		
		override public function update():void {
			super.update();
			if (health <= 0)
				currentState = deadState;
			
			label.text = health.toString();
			
			switch (currentState) {
				case moveState: 
					this.x -= speed * AntG.elapsed;
					if ((this.x <= world.hero.x + world.hero.width + 10) && (this.x > world.hero.x) && (world.hero.health > 0)) {
						currentState = atackState;
					}
					break;
				case atackState: 
					world.hero.setEnemy(this);
					if (countDelayAttack >= delayAttack) {
						countDelayAttack = 0;
						damage = AntMath.randomRangeInt(minDamage, maxDamage);
						world.hero.health -= damage;
						world.attack(damage, world.hero.x, world.hero.y - 20);
					}
					countDelayAttack += AntG.elapsed;
					if (world.hero.health <= 0) {
						currentState = moveState;
					}
					break;
				case deadState: 
					kill();
					break;
			}
			if (this.x < 0)
				kill();
		}
		
		override public function kill():void {
			super.kill();
			world.enemies.splice(world.enemies.indexOf(this), 1);
		}
	
	}

}