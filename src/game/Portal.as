package game {
	import ru.antkarlov.anthill.AntActor;
	import states.GameState;
	
	/**
	 * Класс портала, через который проходят враги.
	 * ...
	 * @author Vladimir
	 */
	public class Portal extends AntActor {
		
		// states
		private var waitState:int = 1;
		private var outState:int = 2;
		private var currentState:int = 1;
		
		public function Portal() {
			super();
			addAnimationFromCache("portalWait");
			addAnimationFromCache("portalOut");
			animationSpeed = 0.8;
			play();
			
		}
		
		override public function update():void {
			super.update();
			
			switch (currentState) {
				case waitState:
					switchAnimation("portalWait");
					break;
				case outState:
					switchAnimation("portalOut");
					if (currentFrame == totalFrames) {
						currentState = waitState;
					}
					break;
			}
		}
		
		/**
		 * Устанавливает портал в режим ожидания
		 */
		public function setWait():void {
			currentState = waitState;
		}
		
		/**
		 * Устанавливает портал в режим проникновения (враг проходит через портал)
		 */
		public function setOut():void {
			currentState = outState;
		}
	
	}

}