package sources {
	import game.GameProgress;
	import ru.antkarlov.anthill.AntMath;
	import ru.antkarlov.anthill.extensions.skills.AntSkills;
	
	/**
	 * Менеджер скилов.
	 * Тут добавляются все скилы в игру.
	 * 
	 * @author Vladimir
	 */
	public class SkillManager {
		
		// user
		public static const USER_ATTACK_POWER:String = "user_attack_power";
		public static const USER_ATTACK_SPEED:String = "user_attack_speed";
		public static const USER_HEAL_POWER:String = "user_heal_power";
		public static const USER_HEAL_SPEED:String = "user_heal_speed";
		// guard
		public static const GUARD_ATTACK_POWER:String = "guard_attack_power";
		public static const GUARD_ATTACK_SPEED:String = "guard_attack_speed";
		public static const GUARD_HEALTH:String = "guard_health";
		// mag
		public static const MAG_HEAL_POWER:String = "mag_heal_power";
		public static const MAG_HEAL_SPEED:String = "mag_heal_speed";
		// sniper
		public static const SNIPER_ATTACK_POWER:String = "sniper_attack_power";
		public static const SNIPER_ATTACK_SPEED:String = "sniper_attack_speed";
		// super power
		public static const SUPER_ICE_POWER:String = "super_ice_power";
		public static const SUPER_ICE_SPEED:String = "super_ice_speed";
		public static const SUPER_METHEOR_POWER:String = "super_metheor_power";
		public static const SUPER_METHEOR_SPEED:String = "super_metheor_speed";
		public static const SUPER_TORNADO_POWER:String = "super_tornado_power";
		public static const SUPER_TORNADO_SPEED:String = "super_tornado_speed";
		public static const SUPER_THOR_POWER:String = "super_thor_power";
		public static const SUPER_THOR_SPEED:String = "super_thor_speed";
		
		public function SkillManager() {
			throw new Error("This is a static class!");
		}
		
		
		public static function init():void {
			AntSkills.saveName = GameProgress.savesName;
			
			// Регистрируем все возможные скилы
			// user
			AntSkills.registerSkill(USER_ATTACK_POWER, 10);
			AntSkills.registerSkill(USER_ATTACK_SPEED, 4.0);
			AntSkills.registerSkill(USER_HEAL_POWER, 3);
			AntSkills.registerSkill(USER_HEAL_SPEED, 4.0);
			// guard
			AntSkills.registerSkill(GUARD_ATTACK_POWER, 10);
			AntSkills.registerSkill(GUARD_ATTACK_SPEED, 4.8);
			AntSkills.registerSkill(GUARD_HEALTH, 60);
			// mag
			AntSkills.registerSkill(MAG_HEAL_POWER, 3);
			AntSkills.registerSkill(MAG_HEAL_SPEED, 8.2);
			// sniper
			AntSkills.registerSkill(SNIPER_ATTACK_POWER, 6);
			AntSkills.registerSkill(SNIPER_ATTACK_SPEED, 7.3);
			// super
			AntSkills.registerSkill(SUPER_ICE_POWER, 20);
			AntSkills.registerSkill(SUPER_ICE_SPEED, 6.5);
			AntSkills.registerSkill(SUPER_METHEOR_POWER, 30);
			AntSkills.registerSkill(SUPER_METHEOR_SPEED, 10.8);
			AntSkills.registerSkill(SUPER_TORNADO_POWER, 40);
			AntSkills.registerSkill(SUPER_TORNADO_SPEED, 16.4);
			AntSkills.registerSkill(SUPER_THOR_POWER, 50);
			AntSkills.registerSkill(SUPER_THOR_SPEED, 30.2);
			
			// Добавляем прокачки в скилы
			generateSkillPower(USER_ATTACK_POWER, 20, 20, 1.3, 25, 1.2);
			generateSkillSpeed(USER_ATTACK_SPEED, 15, 35, 1.6, 4.0, 0.2);
			generateSkillPower(USER_HEAL_POWER, 20, 20, 1.3, 25, 1.2);
			generateSkillSpeed(USER_HEAL_SPEED, 15, 35, 1.6, 4.0, 0.2);
			
			generateSkillPower(GUARD_ATTACK_POWER, 20, 20, 1.3, 25, 1.2);
			generateSkillSpeed(GUARD_ATTACK_SPEED, 15, 35, 1.6, 4.0, 0.2);
			generateSkillPower(GUARD_HEALTH, 20, 20, 1.3, 60, 1.2);
			
			generateSkillPower(MAG_HEAL_POWER, 20, 20, 1.3, 3, 1.2);
			generateSkillSpeed(MAG_HEAL_SPEED, 15, 35, 1.6, 8.2, 0.4);
			
			generateSkillPower(SNIPER_ATTACK_POWER, 20, 20, 1.3, 25, 1.2);
			generateSkillSpeed(SNIPER_ATTACK_SPEED, 15, 35, 1.6, 7.3, 0.3);
			
			generateSkillPower(SUPER_ICE_POWER, 20, 20, 1.3, 20, 1.2);
			generateSkillSpeed(SUPER_ICE_SPEED, 15, 35, 1.6, 6.5, 0.3);
			
			generateSkillPower(SUPER_METHEOR_POWER, 20, 20, 1.3, 30, 1.2);
			generateSkillSpeed(SUPER_METHEOR_SPEED, 15, 35, 1.6, 10.8, 0.4);
			
			generateSkillPower(SUPER_TORNADO_POWER, 20, 20, 1.3, 40, 1.2);
			generateSkillSpeed(SUPER_TORNADO_SPEED, 15, 35, 1.6, 16.4, 0.5);
			
			generateSkillPower(SUPER_THOR_POWER, 20, 20, 1.3, 50, 1.2);
			generateSkillSpeed(SUPER_THOR_SPEED, 15, 35, 1.6, 30.2, 0.8);
			
			
			// load
			AntSkills.loadData();
		}
		
		private static function generateSkillPower(id:String, loopsNumber:int, startPrice:Number, ratePrice:Number, startValue:Number, rateValue:Number):void {
			for (var i:int = 1; i <= loopsNumber; i++) {
				startPrice *= ratePrice;
				var price:int = startPrice;
				var value:int = (startValue + i) * (rateValue * i) - (i * 4);
				AntSkills.add(id, price, value);
				trace("price: " + price.toString() + "; value: " + value.toString());
			}
			trace("===================================");
		}
		
		private static function generateSkillSpeed(id:String, loopsNumber:int, startPrice:Number, ratePrice:Number, startValue:Number, rateValue:Number):void {
			for (var i:int = 1; i <= loopsNumber; i++) {
				startPrice *= ratePrice;
				var price:int = startPrice;
				startValue -= rateValue;
				startValue = Math.round(startValue / .01) * .01;
				var value:Number = startValue;
				AntSkills.add(id, price, value);
				trace("price: " + price.toString() + "; value: " + value.toString());
			}
			trace("===================================");
		}
	
	}

}