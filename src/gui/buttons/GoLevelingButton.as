package gui.buttons {
	import game.GameProgress;
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntButton;
	import ru.antkarlov.anthill.extensions.skills.AntSkillData;
	import ru.antkarlov.anthill.extensions.skills.AntSkills;
	import states.GameState;
	
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
			attentionSign.scaleX = 0.8;
			attentionSign.scaleY = 0.8;
			attentionSign.play();
			attentionSign.reset(44, -8, 30);
			add(attentionSign);
			attentionSign.visible = false;
		}
		
		override public function update():void {
			super.update();
			attentionSign.visible = false;
			
			var skillsList:Vector.<AntSkillData> = AntSkills.getSkillsList();
			for each(var skill:AntSkillData in skillsList) {
				if (GameProgress.getInstance().money >= skill.getSkillPrice()) {
					attentionSign.visible = true;
					break;
				}
			}
		}
		
		private function onClickLeveling(btn:AntButton):void {
			GameState.instance.setPause(true);
		}
	
	}

}