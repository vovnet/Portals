package gui.textFields {
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntLabel;
	import ru.antkarlov.anthill.plugins.AntTween;
	
	/**
	 * Всплывающее текстовое поле и растворяющееся в воздухе.
	 * Используется для отображения нанесенного урона, получение бонуса и т.д.
	 * ...
	 * @author Vladimir
	 */
	public class BonusTextField extends AntActor {
		
		private var label:AntLabel;
		
		/** Анимация сплющивания текста */
		private var innerTween:AntTween;
		
		/** Анимация всплытия и исчезновения текста */
		private var outerTween:AntTween;
		
		private var text:String = "";
		
		public function BonusTextField() {
			super();
			createLabel();
		}
		
		public function init(text:String = "", color:uint = 0x990000):void {
			this.text = text;
			label.alpha = 1;
			label.x = 0;
			label.y = 0;
			label.revive();
			label.text = text;
			label.setColor(color);
			
			innerTween = AntTween.get(label, 0.15);
			innerTween.animate("scaleY", 2);
			innerTween.eventComplete.add(onCompleteInner);
			innerTween.start();
			
			outerTween = AntTween.get(label, 0.5);
			outerTween.animate("alpha", 0);
			outerTween.animate("y", label.y - 60);
			outerTween.start();
			outerTween.eventComplete.add(onCompleteOuter);
		}
		
		private function onCompleteOuter():void {
			kill();
		}
		
		private function onCompleteInner():void {
			innerTween = AntTween.get(label, 0.15);
			innerTween.animate("scaleY", 1);
			innerTween.start();
		}
		
		private function createLabel():void {
			label = new AntLabel("foo", 28, 0x990000);
			label.setStroke(0xffffff);
			add(label);
		}
	
	}

}