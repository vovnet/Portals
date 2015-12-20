package gui.popups {
	import gui.buttons.LevelingButton;
	import ru.antkarlov.anthill.AntActor;
	import sources.SkillManager;
	
	/**
	 * ...
	 * @author Vladimir
	 * 
	 * Всплывающее окно с кнопками для прокачки характеристик юнитов
	 */
	public class LevelingPop extends AntActor {
		
		public function LevelingPop() {
			super();
			
			//
			var user1:LevelingButton = new LevelingButton(SkillManager.USER_ATTACK_POWER, "attack_icon");
			user1.reset(0, 0);
			add(user1);
			
			var user2:LevelingButton = new LevelingButton(SkillManager.USER_ATTACK_SPEED, "heart_icon");
			user2.reset(180, 0);
			add(user2);
			
			var user3:LevelingButton = new LevelingButton(SkillManager.USER_HEAL_POWER, "clock_icon");
			user3.reset(360, 0);
			add(user3);
			
			var user4:LevelingButton = new LevelingButton(SkillManager.USER_HEAL_SPEED, "clock_icon");
			user4.reset(540, 0);
			add(user4);
			
			
			// guard
			var guard1:LevelingButton = new LevelingButton(SkillManager.GUARD_HEALTH, "heart_icon");
			guard1.reset(0, 120);
			add(guard1);
			
			var guard2:LevelingButton = new LevelingButton(SkillManager.GUARD_ATTACK_POWER, "attack_icon");
			guard2.reset(180, 120);
			add(guard2);
			
			var guard3:LevelingButton = new LevelingButton(SkillManager.GUARD_ATTACK_SPEED, "clock_icon");
			guard3.reset(360, 120);
			add(guard3);
		}
	
	}

}