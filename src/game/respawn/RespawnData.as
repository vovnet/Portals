package game.respawn {
	
	/**
	 * Класс с данными. Хранит информацию о юните, который будет добавлен в игру.
	 * ...
	 * @author Vladimir
	 */
	public class RespawnData {
		
		public var type:Class; // тип врага
		public var delay:int; // сколько времени ждать после добавления этого юнита
		
		public function RespawnData(type:Class, delay:int) {
			this.type = type;
			this.delay = delay;
		}
	
	}

}