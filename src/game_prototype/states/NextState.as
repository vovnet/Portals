package game_prototype.states {
	import flash.ui.Mouse;
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntButton;
	import ru.antkarlov.anthill.AntG;
	import ru.antkarlov.anthill.AntState;
	import ru.antkarlov.anthill.plugins.AntTween;
	
	/**
	 * ...
	 * @author Vladimir
	 */
	public class NextState extends AntState {
		
		private var btn:AntButton;
		
		public function NextState() {
			super();
			btn = AntButton.makeButton("btn", "back");
			add(btn);
			btn.reset(200, 300);
			btn.eventClick.add(onClick);
		}
		
		private function onClick(btn:AntButton):void {
			btn.kill();
			AntG.switchState(new MenuState());
		}
	
	}

}