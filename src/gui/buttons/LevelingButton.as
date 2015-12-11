package gui.buttons {
	import game.data.LevelingData;
	import game.data.SimpleLevelData;
	import game.GameProgress;
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntButton;
	import ru.antkarlov.anthill.AntLabel;
	
	/**
	 * Кнопка для прокачки характеристик юнитов.
	 * Хранит цену прокачку и характеристику.
	 * ...
	 * @author Vladimir
	 */
	public class LevelingButton extends AntActor {
		
		/**
		 * По id находим текущий уровень прокачки определенной характеристики
		 */
		private var id:int;
		
		/**
		 * Стоимость и значение прокачки, берется исходя из id характеристики
		 */
		private var levelDataList:Vector.<SimpleLevelData>;
		
		private var back:AntActor;
		private var priceBtn:AntButton;
		private var icon:AntActor;
		private var label:AntLabel;
		
		/**
		 * Конструктор
		 * @param	id Берется из GameProgress.getInstance().leveling
		 * @param	iconName Имя иконки отображающей тип прокачки (сердце, меч, часы)
		 */
		public function LevelingButton(id:int, iconName:String) {
			super();
			
			this.id = id;
			switch(id) {
				case 0:
					levelDataList = LevelingData.guardsAttackPowerLeveling;
					break;
			}
			
			back = new AntActor();
			back.addAnimationFromCache("pre_button");
			add(back);
			
			icon = new AntActor();
			icon.addAnimationFromCache(iconName);
			icon.reset(-34, 25);
			add(icon);
			
			label = new AntLabel("foo", 22);
			label.text = "32";
			label.reset(0, 10);
			add(label);
			
			var btnLabel:AntLabel = new AntLabel("foo", 16);
			priceBtn = AntButton.makeButton("price_button", "", btnLabel);
			priceBtn.reset(0, -14);
			priceBtn.eventClick.add(onClickBtn);
			add(priceBtn);
		}
		
		private function onClickBtn(btn:AntButton):void {
			var data:SimpleLevelData = levelDataList[GameProgress.getInstance().leveling[id]];
			if (data.price <= GameProgress.getInstance().money) {
				GameProgress.getInstance().money -= data.price;
				GameProgress.getInstance().leveling[id]++;
			}
		}
		
		override public function update():void {
			super.update();
			var data:SimpleLevelData = levelDataList[GameProgress.getInstance().leveling[id]];
			priceBtn.text = data.price.toString();
			label.text = data.value.toString();
			
		}
	
	}

}