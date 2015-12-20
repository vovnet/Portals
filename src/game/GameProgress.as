package game {
	import adobe.utils.CustomActions;
	import ru.antkarlov.anthill.AntCookie;
	import ru.antkarlov.anthill.Anthill;
	
	/**
	 * Класс синглтон, хранит всю информацию о текущем прогрессе игрока.
	 * ...
	 * @author Vladimir
	 */
	public class GameProgress {
		
		public static const LOCK_LEVEL:int = 1;
		public static const UNLOCK_LEVEL:int = 2;
		public static const ONE_STAR_LEVEL:int = 3;
		public static const TWO_STARS_LEVEL:int = 4;
		public static const THREE_STAR_LEVEL:int = 5;
		
		public static var savesName:String = "SpaceGuard";
		
		public var engine:Anthill;
		
		public var levelsProgress:Array = [];
		public var currentLevel:int;
		public var money:int;
		public var isOpenMag:Boolean;
		public var isOpenSniper:Boolean;
		
		private var isExistSaves:Boolean = false;
		private var cookie:AntCookie = new AntCookie();
		
		
		private static var instance:GameProgress;
		
		public function GameProgress() {
			if (instance) {
				throw new Error("This is singleton class, use getInstance method.");
			}
			instance = this;
			init();
			cookie.open(savesName);
		}
		
		public static function getInstance():GameProgress {
			if (!instance) {
				new GameProgress();
			}
			return instance;
		}
		
		/**
		 * Устанавливает параметры по умолчанию.
		 */
		private function init():void {
			for (var i:int = 0; i < 20; i++) {
				levelsProgress[i] = LOCK_LEVEL;
			}
			levelsProgress[0] = UNLOCK_LEVEL;
			currentLevel = 0;
			money = 0;
			isExistSaves = false;
			isOpenMag = false;
			isOpenSniper = false;
			
		}
		
		/**
		 * Разблокирует следующий уровень.
		 */
		public function unlockNextLevel():void {
			for (var i:int = 0; i < levelsProgress.length; i++) {
				if (levelsProgress[i] == LOCK_LEVEL) {
					levelsProgress[i] = UNLOCK_LEVEL;
					return;
				}
			}
		}
		
		/**
		 * Сохраняет прогресс на диск.
		 */
		public function save():void {
			isExistSaves = true;
			cookie.write("isExistSaves", isExistSaves);
			cookie.write("money", money);
			cookie.write("levels", levelsProgress);
			cookie.write("isOpenMag", isOpenMag);
			cookie.write("isOpenSniper", isOpenSniper);
		}
		
		/**
		 * Загружает сохранения.
		 */
		public function load():void {
			// если сохранений нет на диске, то выходим из метода
			isExistSaves = cookie.read("isExistSaves") as Boolean;
			if (!isExistSaves) {
				return;
			}
			// сохранения есть - загружаем
			levelsProgress = cookie.read("levels") as Array;
			money = cookie.read("money") as int;
			isOpenMag = cookie.read("isOpenMag") as Boolean;
			isOpenSniper = cookie.read("isOpenSniper") as Boolean;
			trace(cookie.toString());
		}
		
		/**
		 * Удаляет все сохранения и сбрасывает прогресс.
		 */
		public function clear():void {
			cookie.clear();
			init();
		}
	
	}

}