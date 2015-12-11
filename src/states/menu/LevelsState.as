package states.menu {
	import game.GameProgress;
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntState;
	
	/**
	 * Класс выбора уровня (карты)
	 * ...
	 * @author Vladimir
	 */
	public class LevelsState extends AntState {
		
		private var back:AntActor = new AntActor(); // задний фон
		
		public function LevelsState() {
			super();
		
		}
		
		override public function create():void {
			super.create();
			
			back.addAnimationFromCache("levels_background");
			add(back);
			
			var levels:Array = GameProgress.getInstance().levelsProgress;
			var positionCounter:int = 0;
			for (var j:int = 0; j < 4; j++) {
				for (var i:int = 0; i < 5; i++) {
					var planet:PlanetLevel = new PlanetLevel();
					planet.reset(120 * i + 166, 130 * j + 110);
					add(planet);
					planet.levelId = positionCounter + 1;
					planet.gotoAndStop(levels[positionCounter++]);
				}
			}
			
		}
	
	}

}