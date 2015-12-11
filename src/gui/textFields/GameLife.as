package gui.textFields {
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntLabel;
	
	/**
	 * Отображает на экране количество жизней (проходов через портал)
	 * ...
	 * @author Vladimir
	 */
	public class GameLife extends AntActor {
		
		private var lifeLable:AntLabel;
		
		public function GameLife() {
			super();
			
			lifeLable = new AntLabel("foo", 36);
			lifeLable.text = "";
			lifeLable.reset(30, 5);
			add(lifeLable);
		}
		
		public function setValue(value:int):void {
			lifeLable.text = value.toString();
		}
	
	}

}