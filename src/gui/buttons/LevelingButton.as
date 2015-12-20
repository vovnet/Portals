package gui.buttons {
	import game.data.SkillsData;
	import game.data.SimpleLevelData;
	import game.GameProgress;
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntButton;
	import ru.antkarlov.anthill.AntLabel;
	import ru.antkarlov.anthill.extensions.skills.AntSkills;
	
	/**
	 * Кнопка для прокачки характеристик юнитов.
	 * Хранит цену прокачку и характеристику.
	 * ...
	 * @author Vladimir
	 */
	public class LevelingButton extends AntActor {
		
		private var id:String;
		private var back:AntActor;
		private var priceBtn:AntButton;
		private var icon:AntActor;
		private var label:AntLabel;
		
		/**
		 * Конструктор
		 * @param	id Берется из GameProgress.getInstance().leveling
		 * @param 	skills Список скилов с их стоимостью и значениями
		 * @param	iconName Имя иконки отображающей тип прокачки (сердце, меч, часы)
		 */
		public function LevelingButton(id:String, iconName:String) {
			super();
			this.id = id;
			
			// плашка
			back = new AntActor();
			back.addAnimationFromCache("pre_button");
			add(back);
			
			// кнопка со стоимостью прокачки
			var btnLabel:AntLabel = new AntLabel("foo", 16);
			priceBtn = AntButton.makeButton("price_button", "", btnLabel);
			priceBtn.reset(6, 8);
			priceBtn.eventClick.add(onClickBtn);
			add(priceBtn);
			
			// иконка
			icon = new AntActor();
			icon.addAnimationFromCache(iconName);
			icon.reset(20, 58);
			add(icon);
			
			// текущее значение
			label = new AntLabel("foo", 22);
			label.text = "32";
			label.reset(50, 54);
			add(label);
			
			
		}
		
		private function onClickBtn(btn:AntButton):void {
			var price:Number = AntSkills.getSkillPrice(id);
			if (GameProgress.getInstance().money >= price) {
				GameProgress.getInstance().money -= price;
				AntSkills.levelUp(id);
			}
		}
		
		override public function update():void {
			super.update();
			if (AntSkills.isMaxLevel(id)) {
				priceBtn.visible = false;
			}
			priceBtn.text = AntSkills.getSkillPrice(id).toString();
			label.text = AntSkills.getSkillValue(id).toString();
		}
	
	}

}