package states.menu {
	import flash.ui.Mouse;
	import game.GameProgress;
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntG;
	import states.GameState;
	
	/**
	 * ...
	 * @author Vladimir
	 */
	public class PlanetLevel extends AntActor {
		
		public var levelId:int;
		
		public function PlanetLevel() {
			super();
			addAnimationFromCache("planet_level");
		}
		
		override public function update():void {
			super.update();
			
			// меняем размер планет при наведении указателя мыши
			if (hitTest(AntG.mouse.x, AntG.mouse.y) && currentFrame != 1) {
				scaleX = 1.05;
				scaleY = 1.05;
			} else {
				scaleX = 1;
				scaleY = 1;
			}
			
			// запускаем уровень
			if (AntG.mouse.isPressed()) {
				if (hitTest(AntG.mouse.x, AntG.mouse.y) && currentFrame != 1) {
					scaleX = 1;
					scaleY = 1;
					GameProgress.getInstance().currentLevel = levelId;
					GameProgress.getInstance().engine.switchState(new GameState);
				}
			}
		}
	
	}

}