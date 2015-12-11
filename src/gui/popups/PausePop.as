package gui.popups {
	import flash.ui.Mouse;
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntButton;
	import ru.antkarlov.anthill.AntG;
	import ru.antkarlov.anthill.plugins.AntTween;
	import states.GameState;
	import states.menu.LevelsState;
	
	/**
	 * ...
	 * @author Vladimir
	 */
	public class PausePop extends AntActor {
		
		private var refreshBtn:AntButton;
		private var menuBtn:AntButton;
		private var playBtn:AntButton;
		
		public function PausePop() {
			super();
			
			playBtn = AntButton.makeButton("btn_back_to_play");
			playBtn.reset(0, 0);
			add(playBtn);
			playBtn.eventClick.add(onClickPlay);
			
			refreshBtn = AntButton.makeButton("btn_refresh");
			refreshBtn.reset(100, 0);
			refreshBtn.eventClick.add(onClickRefresh);
			add(refreshBtn);
			
			menuBtn = AntButton.makeButton("btn_menu");
			menuBtn.reset(200, 0);
			menuBtn.eventClick.add(onClickMenu);
			add(menuBtn);
			
			init();
			update();
		}
		
		public function init():void {
			x = 280;
			y = 200;
			menuBtn.alpha = 0;
			refreshBtn.alpha = 0;
			playBtn.alpha = 0;
			menuBtn.revive();
			playBtn.revive();
			refreshBtn.revive();
			
			var speed:Number = 0.1;
			
			var tween:AntTween = new AntTween(this, speed);
			tween.moveTo(280, 240);
			tween.start();
			
			var tweenMenu:AntTween = new AntTween(menuBtn, speed);
			tweenMenu.animate("alpha", 1);
			tweenMenu.start();
			
			var tweenReset:AntTween = new AntTween(refreshBtn, speed);
			tweenReset.animate("alpha", 1);
			tweenReset.start();
			
			var tweenPlay:AntTween = new AntTween(playBtn, speed);
			tweenPlay.animate("alpha", 1);
			tweenPlay.start();
		}
		
		public function close():void {
			var speed:Number = 0.1;
			
			var tween:AntTween = new AntTween(this, speed);
			tween.moveTo(280, 200);
			tween.eventComplete.add(onCompleteCloseWindow);
			tween.start();
			
			var tweenMenu:AntTween = new AntTween(menuBtn, speed);
			tweenMenu.animate("alpha", 0);
			tweenMenu.start();
			
			var tweenReset:AntTween = new AntTween(refreshBtn, speed);
			tweenReset.animate("alpha", 0);
			tweenReset.start();
			
			var tweenPlay:AntTween = new AntTween(playBtn, speed);
			tweenPlay.animate("alpha", 0);
			tweenPlay.start();
		}
		
		private function onCompleteCloseWindow():void {
			GameState.instance.setPause(false);
			kill();
		}
		
		private function onClickMenu(btn:AntButton):void {
			AntG.switchState(new LevelsState);
			Mouse.cursor = "auto";
		}
		
		private function onClickRefresh(btn:AntButton):void {
			AntG.switchState(new GameState);
			Mouse.cursor = "auto";
		}
		
		private function onClickPlay(btn:AntButton):void {
			close();
		}
	
	}

}