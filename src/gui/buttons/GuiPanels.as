package gui.buttons {
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntButton;
	import states.GameState;
	
	/**
	 * Панель с кнопками в игре (пауза, звук, кнопка в меню прокачки и другие)
	 * ...
	 * @author Vladimir
	 */
	public class GuiPanels extends AntActor {
		
		private var pauseBtn:AntButton;
		private var levelingBtn:GoLevelingButton;
		
		public function GuiPanels() {
			super();
			
			pauseBtn = AntButton.makeButton("btn_pause");
			pauseBtn.reset(500, 10);
			pauseBtn.eventClick.add(onClickPause);
			add(pauseBtn);
			
			levelingBtn = new GoLevelingButton();
			levelingBtn.reset(680, 540);
			add(levelingBtn);
			
			// test
			var test:LevelingButton = new LevelingButton(0, "attack_icon");
			test.reset(100, 500);
			add(test);
		}
		
		
		
		private function onClickPause(btn:AntButton):void {
			GameState.instance.setPause(true);
			GameState.instance.showPausePop();
		}
	
	}

}