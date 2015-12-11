package units.protagonists.sniper {
	import ru.antkarlov.anthill.AntActor;
	
	/**
	 * ...
	 * @author Vladimir
	 */
	public class Ray extends AntActor {
		
		public function Ray() {
			super();
			addAnimationFromCache("ray");
			animationSpeed = 0.6;
			play();
		}
		
		override public function update():void {
			super.update();
			if (currentFrame == totalFrames) {
				kill();
			}
		}
	
	}

}