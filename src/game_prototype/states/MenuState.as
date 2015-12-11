package game_prototype.states {
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntButton;
	import ru.antkarlov.anthill.AntG;
	import ru.antkarlov.anthill.AntMask;
	import ru.antkarlov.anthill.AntMath;
	import ru.antkarlov.anthill.AntState;
	import ru.antkarlov.anthill.plugins.AntTween;
	
	/**
	 * ...
	 * @author Vladimir
	 */
	public class MenuState extends AntState {
		
		private var _mask:AntMask;
		
		public function MenuState() {
			super();
			var btn:AntButton = AntButton.makeButton("btn", "click");
			add(btn);
			btn.reset(100, 200); 
			btn.eventClick.add(onClick);
			_mask = new AntMask();
			_mask.addAnimationFromCache("car");
			var actor:AntActor = new AntActor();
			trace(AntMath.fromPercent(45, 250));
			actor.reset(300, 300);
			add(actor);
			actor.mask = _mask;
			var tw:AntTween = new AntTween(_mask, 2);
			tw.animate("x", 60);
			tw.start();
		}
		
		private function onClick(btn:AntButton):void {
			btn.kill();
			AntG.switchState(new NextState());
		}
		
		override public function destroy():void {
			super.destroy();
		}
	
	}

}