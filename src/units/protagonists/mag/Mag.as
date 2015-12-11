package units.protagonists.mag {
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntG;
	import states.GameState;
	
	/**
	 * ...
	 * @author Vladimir
	 */
	public class Mag extends AntActor {
		
		private var currentTimeHeal:Number = 0;
		
		public var maxDelayHeal:Number = 3;
		public var heal:int = 6;
		
		public function Mag() {
			super();
			addAnimationFromCache("magStay", "stay");
			addAnimationFromCache("magAttack", "heal", false);
			play();
		}
		
		override public function update():void {
			super.update();
			
			currentTimeHeal += AntG.elapsed;
			
			if (currentTimeHeal >= maxDelayHeal) {
				if (GameState.instance.guardHero != null && (GameState.instance.guardHero.health < GameState.instance.guardHero.startHealth)) {
					switchAnimation("heal");
				}
				if (currentAnimation == "heal" && currentFrame == 3 && GameState.instance.guardHero != null) {
					GameState.instance.guardHero.heal(heal);
					currentTimeHeal = 0;
				}
			}
			
			if (currentAnimation == "heal" && currentFrame == totalFrames) {
				switchAnimation("stay");
			}
			
			
		}
	
	}

}