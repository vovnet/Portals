package game.data {
	
	/**
	 * ...
	 * @author Vladimir
	 *
	 * Хранит стоимости и значения всех прокачек
	 */
	public class SkillsData {
		/**
		 * user
		 */
		public static var userAttackPower:Vector.<SimpleLevelData> = new Vector.<SimpleLevelData>();
		public static var userHealPower:Vector.<SimpleLevelData> = new Vector.<SimpleLevelData>();
		public static var userAttackSpeed:Vector.<SimpleLevelData> = new Vector.<SimpleLevelData>();
		public static var userHealSpeed:Vector.<SimpleLevelData> = new Vector.<SimpleLevelData>();
		
		/**
		 * guard
		 */
		public static var guardHealth:Vector.<SimpleLevelData> = new Vector.<SimpleLevelData>();
		public static var guardAttackPower:Vector.<SimpleLevelData> = new Vector.<SimpleLevelData>();
		public static var guardAttackSpeed:Vector.<SimpleLevelData> = new Vector.<SimpleLevelData>();
		public static var guardAttackPowerSuper:Vector.<SimpleLevelData> = new Vector.<SimpleLevelData>();
		public static var guardAttackSpeedSuper:Vector.<SimpleLevelData> = new Vector.<SimpleLevelData>();
		
		/**
		 * mag
		 */
		public static var magHealPower:Vector.<SimpleLevelData> = new Vector.<SimpleLevelData>();
		public static var magHealSpeed:Vector.<SimpleLevelData> = new Vector.<SimpleLevelData>();
		public static var magHealPowerSuper:Vector.<SimpleLevelData> = new Vector.<SimpleLevelData>();
		public static var magHealSpeedSuper:Vector.<SimpleLevelData> = new Vector.<SimpleLevelData>();
		
		/**
		 * sniper
		 */
		public static var sniperAttackPower:Vector.<SimpleLevelData> = new Vector.<SimpleLevelData>();
		public static var sniperAttackSpeed:Vector.<SimpleLevelData> = new Vector.<SimpleLevelData>();
		public static var sniperAttackPowerSuper:Vector.<SimpleLevelData> = new Vector.<SimpleLevelData>();
		public static var sniperAttackSpeedSuper:Vector.<SimpleLevelData> = new Vector.<SimpleLevelData>();
		
		public static function init():void {
			initUser();
			initGuard();
		}
		
		static private function initGuard():void {
			guardHealth.push(new SimpleLevelData(35, 45));
			guardHealth.push(new SimpleLevelData(50, 60));
			guardHealth.push(new SimpleLevelData(100, 90));
			guardHealth.push(new SimpleLevelData(160, 150));
			guardHealth.push(new SimpleLevelData(210, 300));
			guardHealth.push(new SimpleLevelData(400, 490));
			guardHealth.push(new SimpleLevelData(600, 650));
			guardHealth.push(new SimpleLevelData(860, 800));
			
			guardAttackPower.push(new SimpleLevelData(30, 43));
			guardAttackPower.push(new SimpleLevelData(35, 45));
			guardAttackPower.push(new SimpleLevelData(50, 60));
			guardAttackPower.push(new SimpleLevelData(100, 90));
			guardAttackPower.push(new SimpleLevelData(160, 150));
			guardAttackPower.push(new SimpleLevelData(210, 300));
			guardAttackPower.push(new SimpleLevelData(400, 490));
			guardAttackPower.push(new SimpleLevelData(600, 650));
			guardAttackPower.push(new SimpleLevelData(860, 800));
			
			guardAttackSpeed.push(new SimpleLevelData(10, 7.2));
			guardAttackSpeed.push(new SimpleLevelData(20, 7.1));
			guardAttackSpeed.push(new SimpleLevelData(30, 7.0));
			guardAttackSpeed.push(new SimpleLevelData(45, 6.9));
			guardAttackSpeed.push(new SimpleLevelData(70, 6.7));
			guardAttackSpeed.push(new SimpleLevelData(95, 6.2));
			guardAttackSpeed.push(new SimpleLevelData(120, 5.9));
			guardAttackSpeed.push(new SimpleLevelData(190, 5.2));
			guardAttackSpeed.push(new SimpleLevelData(300, 4.2));
			
			guardAttackPowerSuper.push(new SimpleLevelData(30, 43));
			guardAttackPowerSuper.push(new SimpleLevelData(35, 45));
			guardAttackPowerSuper.push(new SimpleLevelData(50, 60));
			guardAttackPowerSuper.push(new SimpleLevelData(100, 90));
			guardAttackPowerSuper.push(new SimpleLevelData(160, 150));
			
			guardAttackSpeedSuper.push(new SimpleLevelData(95, 6.2));
			guardAttackSpeedSuper.push(new SimpleLevelData(120, 5.9));
			guardAttackSpeedSuper.push(new SimpleLevelData(190, 5.2));
			guardAttackSpeedSuper.push(new SimpleLevelData(300, 4.2));
		}
		
		static private function initUser():void {
			userAttackPower.push(new SimpleLevelData(35, 4));
			userAttackPower.push(new SimpleLevelData(52, 6));
			userAttackPower.push(new SimpleLevelData(78, 9));
			userAttackPower.push(new SimpleLevelData(118, 13));
			userAttackPower.push(new SimpleLevelData(177, 20));
			userAttackPower.push(new SimpleLevelData(265, 30));
			userAttackPower.push(new SimpleLevelData(395, 45));
			userAttackPower.push(new SimpleLevelData(600, 68));
			userAttackPower.push(new SimpleLevelData(895, 102));
			userAttackPower.push(new SimpleLevelData(1345, 153));
			userAttackPower.push(new SimpleLevelData(2020, 230));
			userAttackPower.push(new SimpleLevelData(3030, 345));
			userAttackPower.push(new SimpleLevelData(4540, 518));
			userAttackPower.push(new SimpleLevelData(6810, 778));
			userAttackPower.push(new SimpleLevelData(10220, 1167));
			userAttackPower.push(new SimpleLevelData(15325, 1750));
			userAttackPower.push(new SimpleLevelData(22990, 2625));
			userAttackPower.push(new SimpleLevelData(34500, 3938));
			
			userHealPower.push(new SimpleLevelData(20, 10.0));
			userHealPower.push(new SimpleLevelData(56, 9.5));
			userHealPower.push(new SimpleLevelData(150, 9.1));
			userHealPower.push(new SimpleLevelData(260, 8.6));
			userHealPower.push(new SimpleLevelData(455, 8.1));
			userHealPower.push(new SimpleLevelData(830, 7.7));
			userHealPower.push(new SimpleLevelData(1560, 7.2));
			userHealPower.push(new SimpleLevelData(3000, 6.5));
			userHealPower.push(new SimpleLevelData(7500, 6.0));
			userHealPower.push(new SimpleLevelData(16400, 5.6));
			userHealPower.push(new SimpleLevelData(25000, 5.1));
			userHealPower.push(new SimpleLevelData(56000, 4.7));
			userHealPower.push(new SimpleLevelData(120000, 4.2));
			userHealPower.push(new SimpleLevelData(290000, 3.7));
			userHealPower.push(new SimpleLevelData(400000, 3.2));
			userHealPower.push(new SimpleLevelData(1000000, 2.2));
			
			userAttackSpeed.push(new SimpleLevelData(10, 7.2));
			userAttackSpeed.push(new SimpleLevelData(20, 7.1));
			userAttackSpeed.push(new SimpleLevelData(30, 7.0));
			userAttackSpeed.push(new SimpleLevelData(45, 6.9));
			userAttackSpeed.push(new SimpleLevelData(70, 6.7));
			userAttackSpeed.push(new SimpleLevelData(95, 6.2));
			userAttackSpeed.push(new SimpleLevelData(120, 5.9));
			userAttackSpeed.push(new SimpleLevelData(190, 5.2));
			userAttackSpeed.push(new SimpleLevelData(300, 4.2));
			
			userHealSpeed.push(new SimpleLevelData(10, 8.5));
			userHealSpeed.push(new SimpleLevelData(20, 8.4));
			userHealSpeed.push(new SimpleLevelData(30, 8.3));
			userHealSpeed.push(new SimpleLevelData(40, 8.2));
			userHealSpeed.push(new SimpleLevelData(50, 8.0));
			userHealSpeed.push(new SimpleLevelData(70, 7.8));
			userHealSpeed.push(new SimpleLevelData(90, 7.5));
			userHealSpeed.push(new SimpleLevelData(120, 7.2));
			userHealSpeed.push(new SimpleLevelData(150, 6.5));
			userHealSpeed.push(new SimpleLevelData(190, 6.0));
			userHealSpeed.push(new SimpleLevelData(220, 5.5));
			userHealSpeed.push(new SimpleLevelData(310, 4.9));
		}
	
	}

}