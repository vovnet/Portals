package states {
	import flash.geom.Point;
	import game.CoinsController;
	import game.GameProgress;
	import game.locations.Location;
	import game.Portal;
	import game.respawn.EnemyRespawner;
	import game.user.UserClicker;
	import gui.buttons.GuiPanels;
	import gui.popups.LevelingPop;
	import gui.popups.PausePop;
	import gui.textFields.BonusTextField;
	import gui.textFields.GameLife;
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntG;
	import ru.antkarlov.anthill.AntState;
	import states.menu.LevelsState;
	import units.enemies.EnemyBase;
	import units.protagonists.guard.Guard;
	import units.protagonists.mag.Mag;
	import units.protagonists.sniper.Ray;
	import units.protagonists.sniper.Sniper;
	
	/**
	 * ...
	 * @author Vladimir
	 */
	public class GameState extends AntState {
		
		// states
		public static const RUN_STATE:int = 1;
		public static const WIN_STATE:int = 2;
		public static const LOSE_STATE:int = 3;
		
		private var currentState:int = 1;
		
		public var isPause:Boolean = false;
		
		// указатель на текущий объект игры
		public static var instance:GameState;
		
		public var enemies:Vector.<EnemyBase> = new Vector.<EnemyBase>();
		
		private var background:Location = new Location();
		private var portalWorld:Portal = new Portal();
		
		public var guardHero:Guard = new Guard();
		public var magHero:Mag = new Mag();
		public var sniperHero:Sniper = new Sniper();
		
		// layers
		private var gameLayer:AntActor = new AntActor();
		private var uiLayer:AntActor = new AntActor();
		private var popLayer:AntActor = new AntActor();
		
		// черная подложка для паузы
		private var backPause:AntActor = new AntActor();
		
		// попап для прокачек
		private var lvlPop:LevelingPop = new LevelingPop();
		
		// ui
		private var outsLabel:GameLife;
		private var coins:CoinsController;
		
		// счетчик проходов врагов через портал
		private var outsCouner:int = 5;
		
		// отвечает за респаун врагов
		private var respawnerOfEnemies:EnemyRespawner = new EnemyRespawner();
		
		private var user:UserClicker = new UserClicker();
		
		private var winElapsed:Number = 5;
		
		public function GameState() {
			super();
			
			instance = this;
			initLayers();
			
			if (GameProgress.getInstance().isOpenMag) {
				magHero.reset(320, 240);
				gameLayer.add(magHero);
			}
			
			if (GameProgress.getInstance().isOpenSniper) {
				sniperHero.reset(400, 238);
				gameLayer.add(sniperHero);
			}
		}
		
		/**
		 * Игровой цикл
		 */
		override public function update():void {
			super.update();
			
			if (AntG.keys.isPressed("P")) {
				setPause(true);
			} else if (AntG.keys.isPressed("Q")) {
				GameProgress.getInstance().save();
				GameProgress.getInstance().clear();
			}
			
			switch (currentState) {
				case RUN_STATE: 
					outsLabel.setValue(outsCouner);
					break;
				case WIN_STATE: 
					winningState();
					break;
				case LOSE_STATE: 
					outsLabel.setValue(0);
					
					break;
			}
			
			// respawn of enemies
			respawnerOfEnemies.update();
			// clicks of user
			user.update();
		
		}
		
		/**
		 * Вкл\Откл паузу.
		 * @param	val
		 */
		public function setPause(val:Boolean):void {
			isPause = val;
			CoinsController.world.pause = isPause;
			gameLayer.active = !isPause;
			uiLayer.active = !isPause;
			backPause.visible = isPause;
		}
		
		/**
		 * Показывает окно паузы.
		 */
		public function showPausePop():void {
			var p:PausePop = popLayer.recycle(PausePop) as PausePop;
			p.revive();
			p.init();
			popLayer.add(p);
		}
		
		/**
		 * Состояние выйгрыша уровня
		 */
		private function winningState():void {
			if (!isPause) {
				winElapsed -= AntG.elapsed;
			}
			if (winElapsed <= 0) {
				var prog:GameProgress = GameProgress.getInstance();
				// если текущий уровень пройден впервые, то разблокируем следующий уровень
				if (prog.levelsProgress[prog.currentLevel - 1] == GameProgress.UNLOCK_LEVEL) {
					prog.unlockNextLevel();
				}
				prog.levelsProgress[prog.currentLevel - 1] = GameProgress.THREE_STAR_LEVEL;
				prog.save();
				prog.engine.switchState(new LevelsState);
			}
		}
		
		/**
		 * Инициализация слоев в игре
		 */
		private function initLayers():void {
			add(gameLayer);
			add(uiLayer);
			add(popLayer);
			
			uiLayer.add(new GuiPanels());
			
			coins = new CoinsController();
			uiLayer.add(coins);
			
			outsLabel = new GameLife();
			outsLabel.reset(700, 5);
			uiLayer.add(outsLabel);
			
			backPause.addAnimationFromCache("backing");
			backPause.visible = false;
			popLayer.add(backPause);
			
			gameLayer.add(background);
			
			portalWorld.x = -20;
			portalWorld.y = 130;
			gameLayer.add(portalWorld);
			
			guardHero.reset(190, 300);
			guardHero.init();
			gameLayer.add(guardHero);
			
			lvlPop.reset(10, 50);
			popLayer.add(lvlPop);
			//lvlPop.visible = false;
		}
		
		/**
		 * Добавляет врага в игру
		 * @param	type Класс врага
		 */
		public function addEnemy(type:Class):void {
			var en:EnemyBase = defGroup.recycle(type) as EnemyBase;
			en.init();
			gameLayer.add(en);
			enemies.push(en);
		}
		
		/**
		 * Когда враг проходит через портал, нужно вызвать этот метод.
		 */
		public function outOfPortal():void {
			outsCouner--;
			portalWorld.setOut();
			if (outsCouner <= 0) {
				currentState = LOSE_STATE;
			}
		}
		
		/**
		 * Необходимо вызвать, когда умирает враг
		 * @param	posX
		 * @param	posY
		 */
		public function deadEnemy(posX:int, posY:int, price:int, coinValue:int):void {
			for (var i:int = 0; i < price; i++) {
				coins.makeCoin(posX, posY, coinValue);
			}
			// если это был последний враг, то выйграли
			if (respawnerOfEnemies.numEnemies() == 0) {
				currentState = WIN_STATE;
			}
		}
		
		/**
		 * Показывает нанесенный урон
		 * @param	value 		Количество нанесенного урона
		 * @param	position 	Точка появления уведомления
		 */
		public function showHammer(value:int, position:Point, isCrit:Boolean = false):void {
			var prompt:BonusTextField = defGroup.recycle(BonusTextField) as BonusTextField;
			var str:String = "";
			var colorPrompt:uint = 0x990000;
			if (isCrit) {
				str += "CRIT\n"
				colorPrompt = 0xAC0443;
			}
			str += "- " + value.toString();
			prompt.init(str, colorPrompt);
			prompt.reset(position.x, position.y);
			uiLayer.add(prompt);
		}
		
		/**
		 * Показывает сколько хп полечено юниту.
		 * @param	value
		 * @param	posX
		 * @param	posY
		 */
		public function showHeal(value:int, posX:int, posY:int):void {
			var prompt:BonusTextField = defGroup.recycle(BonusTextField) as BonusTextField;
			prompt.init("+" + value.toString(), 0x378E22);
			prompt.reset(posX, posY);
			uiLayer.add(prompt);
		}
		
		/**
		 * Приблуда для снайпера, показывает анимацию удара молнии по врагу.
		 * @param	posX
		 * @param	posY
		 */
		public function showRay(posX:int, posY:int):void {
			var ray:Ray = defGroup.recycle(Ray) as Ray;
			ray.reset(posX, posY);
			gameLayer.add(ray);
		}
	
	}

}