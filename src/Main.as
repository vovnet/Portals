package {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import game.data.LevelingData;
	import game.GameProgress;
	import game_prototype.PrototypeState;
	import ru.antkarlov.anthill.AntAssetLoader;
	import ru.antkarlov.anthill.AntG;
	import ru.antkarlov.anthill.Anthill;
	import sources.Assets;
	import states.GameState;
	import states.GameStateTest;
	import states.menu.LevelsState;
	
	/**
	 * ...
	 * @author Vladimir
	 */
	[Frame(factoryClass = "Preloader")]
	
	public class Main extends Sprite {
		
		public function Main() {
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			stage.scaleMode = StageScaleMode.EXACT_FIT;
			stage.align = StageAlign.TOP_LEFT;
			Assets.load(new AntAssetLoader(), onCompleteRasterize);
			
		}
		
		private function onCompleteRasterize(loader:AntAssetLoader):void {
			GameProgress.getInstance().load(); // загружаем сохранения
			LevelingData.init(); // инициализируем данные об прокачке
			
			var engine:Anthill = new Anthill(LevelsState, 35);
			addChild(engine);
			GameProgress.getInstance().engine = engine;
			
			
			AntG.debugger.hide();
			AntG.debugger.monitor.hide();
			AntG.debugger.perfomance.y = 8;
			AntG.debugger.perfomance.show();
			AntG.debugger.console.hide();
			
			AntG.mouse.rightButton.enabled = true;
		}
	
	}

}