package gui.buttons {
	import game.data.LevelingData;
	import game.GameProgress;
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntButton;
	
	/**
	 * Кнопка с восклицательным знаком, которая отображается в игре.
	 * ...
	 * @author Vladimir
	 */
	public class GoLevelingButton extends AntActor {
		
		private var levelingBtn:AntButton;
		private var attentionSign:AntActor;
		
		public function GoLevelingButton() {
			super();
			
			levelingBtn = AntButton.makeButton("go_leveling_button");
			levelingBtn.eventClick.add(onClickLeveling);
			add(levelingBtn);
			
			attentionSign = new AntActor();
			attentionSign.addAnimationFromCache("lit_sign");
			attentionSign.play();
			attentionSign.reset(40, -30);
			add(attentionSign);
			attentionSign.visible = false;
		}
		
		override public function update():void {
			super.update();
			attentionSign.visible = false;
			// проверяем можно ли что-нибудь прокачать, и показываем восклицательный знак
			if (LevelingData.guardsAttackPowerLeveling[GameProgress.getInstance().leveling[0]].price <= GameProgress.getInstance().money) {
				attentionSign.visible = true;
			}
			
		}
		
		private function onClickLeveling(btn:AntButton):void {
		
		}
	
	}

}