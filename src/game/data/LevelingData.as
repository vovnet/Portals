package game.data 
{
	/**
	 * ...
	 * @author Vladimir
	 */
	public class LevelingData 
	{
		/**
		 * Скорость применения способностей
		 */
		public static var guardsSpeedLeveling:Vector.<SimpleLevelData> = new Vector.<SimpleLevelData>();
		
		/**
		 * Наносимый урон
		 */
		public static var guardsAttackPowerLeveling:Vector.<SimpleLevelData> = new Vector.<SimpleLevelData>();
		
		/**
		 * Количество восстанавливаемого здоровья
		 */
		public static var guardsHealPowerLeveling:Vector.<SimpleLevelData> = new Vector.<SimpleLevelData>();
		
		/**
		 * Здоровье
		 */
		public static var guardsHealthPowerLeveling:Vector.<SimpleLevelData> = new Vector.<SimpleLevelData>();
		
		/**
		 * Время воскрешения
		 */
		public static var guardsRegenerationLeveling:Vector.<SimpleLevelData> = new Vector.<SimpleLevelData>();
		
		/**
		 * Интервал применения суперспособностей
		 */
		public static var superSpeedLeveling:Vector.<SimpleLevelData> = new Vector.<SimpleLevelData>();
		
		
		public static function init():void {
			guardsSpeedLeveling.push(new SimpleLevelData(20, 10.0));
			guardsSpeedLeveling.push(new SimpleLevelData(56, 9.5));
			guardsSpeedLeveling.push(new SimpleLevelData(150, 9.1));
			guardsSpeedLeveling.push(new SimpleLevelData(260, 8.6));
			guardsSpeedLeveling.push(new SimpleLevelData(455, 8.1));
			guardsSpeedLeveling.push(new SimpleLevelData(830, 7.7));
			guardsSpeedLeveling.push(new SimpleLevelData(1560, 7.2));
			guardsSpeedLeveling.push(new SimpleLevelData(3000, 6.5));
			guardsSpeedLeveling.push(new SimpleLevelData(7500, 6.0));
			guardsSpeedLeveling.push(new SimpleLevelData(16400, 5.6));
			guardsSpeedLeveling.push(new SimpleLevelData(25000, 5.1));
			guardsSpeedLeveling.push(new SimpleLevelData(56000, 4.7));
			guardsSpeedLeveling.push(new SimpleLevelData(120000, 4.2));
			guardsSpeedLeveling.push(new SimpleLevelData(290000, 3.7));
			guardsSpeedLeveling.push(new SimpleLevelData(400000, 3.2));
			guardsSpeedLeveling.push(new SimpleLevelData(1000000, 2.2));
			
			guardsAttackPowerLeveling.push(new SimpleLevelData(35, 4));
			guardsAttackPowerLeveling.push(new SimpleLevelData(52, 6));
			guardsAttackPowerLeveling.push(new SimpleLevelData(78, 9));
			guardsAttackPowerLeveling.push(new SimpleLevelData(118, 13));
			guardsAttackPowerLeveling.push(new SimpleLevelData(177, 20));
			guardsAttackPowerLeveling.push(new SimpleLevelData(265, 30));
			guardsAttackPowerLeveling.push(new SimpleLevelData(395, 45));
			guardsAttackPowerLeveling.push(new SimpleLevelData(600, 68));
			guardsAttackPowerLeveling.push(new SimpleLevelData(895, 102));
			guardsAttackPowerLeveling.push(new SimpleLevelData(1345, 153));
			guardsAttackPowerLeveling.push(new SimpleLevelData(2020, 230));
			guardsAttackPowerLeveling.push(new SimpleLevelData(3030, 345));
			guardsAttackPowerLeveling.push(new SimpleLevelData(4540, 518));
			guardsAttackPowerLeveling.push(new SimpleLevelData(6810, 778));
			guardsAttackPowerLeveling.push(new SimpleLevelData(10220, 1167));
			guardsAttackPowerLeveling.push(new SimpleLevelData(15325, 1750));
			guardsAttackPowerLeveling.push(new SimpleLevelData(22990, 2625));
			guardsAttackPowerLeveling.push(new SimpleLevelData(34500, 3938));
		}
		
	}

}