package gui {
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntLabel;
	import ru.antkarlov.anthill.AntMath;
	
	/**
	 * ...
	 * @author Vladimir
	 */
	public class HealthLine extends AntActor {
		
		private var character:AntActor;
		private var startHealth:int;
		
		public function HealthLine(character:AntActor, startHealth:int) {
			super();
			this.character = character;
			this.startHealth = startHealth;
			addAnimationFromCache("hpLine");
			gotoAndStop(totalFrames);
		}
		
		override public function update():void {
			super.update();
			var percent:int = AntMath.toPercent(character.health, startHealth);
			var frame:int = AntMath.ceil(AntMath.fromPercent(percent, totalFrames));
			frame = (frame < 2 && character.health > 0) ? 2 : frame;
			gotoAndStop(frame);
			
		}
	
	}

}