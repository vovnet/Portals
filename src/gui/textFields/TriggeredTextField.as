package gui.textFields {
	import game.GameProgress;
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntLabel;
	import ru.antkarlov.anthill.plugins.AntTween;
	
	/**
	 * ...
	 * @author Vladimir
	 */
	public class TriggeredTextField extends AntActor {
		
		private var label:AntLabel;
		private var text:String = "1354";
		private var tween:AntTween;
		private var textSize:int;
		private var textColor:uint;
		
		public function TriggeredTextField(textSize:int = 20, textColor:uint = 0xe3cc96, text:String = "") {
			super();
			this.textSize = textSize;
			this.textColor = textColor;
			this.text = text;
			createLabel();
		}
		
		override public function update():void {
			super.update();
			label.text = GameProgress.getInstance().money.toString();
		}
		
		public function setText(text:String):void {
			this.text = text;
			label.text = text;
			tween = AntTween.get(label, 0.1);
			tween.animate("scaleY", 1.5);
			tween.animate("scaleX", 1.5);
			tween.eventComplete.add(onCompleteTween);
			tween.start();
		}
		
		private function onCompleteTween():void {
			tween = AntTween.get(label, 0.05);
			tween.animate("scaleY", 1);
			tween.animate("scaleX", 1);
			tween.start();
		}
		
		private function createLabel():void {
			label = new AntLabel("foo", textSize, textColor);
			//label.setStroke(0xffffff);
			label.text = text;
			add(label);
		}
	
	}

}