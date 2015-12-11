package game.respawn {
	import adobe.utils.CustomActions;
	import game.GameProgress;
	import ru.antkarlov.anthill.AntG;
	import states.GameState;
	import units.enemies.Enemy_2;
	import units.enemies.EnemyBase;
	
	/**
	 * Класс отвечает за респаун врагов. Хранит список всех врагов и
	 * добавляет их в игру согласно заданным интервалам времени.
	 * ...
	 * @author Vladimir
	 */
	public class EnemyRespawner {
		
		private var enemies:Vector.<RespawnData> = new Vector.<RespawnData>();
		private var delay:Number = 3;
		
		public function EnemyRespawner() {
			switch (GameProgress.getInstance().currentLevel) {
				case 1:
					level_1();
					break;
				case 2:
					level_2();
					break;
				case 3:
					level_3();
					break;
				case 4:
					level_4();
					break;
				case 5:
					level_5();
					break;
				case 6:
					level_6();
					break;
				case 7:
					level_7();
					break;
				case 8:
					level_8();
					break;
				case 9:
					level_9();
					break;
				case 10:
					level_10();
					break;
				case 11:
					level_11();
					break;
				case 12:
					level_12();
					break;
				case 13:
					level_13();
					break;
				case 14:
					level_14();
					break;
				case 15:
					level_15();
					break;
				case 16:
					level_16();
					break;
				case 17:
					level_17();
					break;
				case 18:
					level_18();
					break;
				case 19:
					level_19();
					break;
				case 20:
					level_20();
					break;
			}
		}
		
		public function update():void {
			if (GameState.instance.isPause) {
				return;
			}
			delay -= AntG.elapsed;
			if (delay <= 0 && enemies.length > 0) {
				var en:RespawnData = enemies.shift();
				delay = en.delay;
				GameState.instance.addEnemy(en.type);
			}
		}
		
		public function numEnemies():int {
			return enemies.length;
		}
		
		private function level_1():void {
			enemies.push(new RespawnData(Enemy_2, 4));
			/*enemies.push(new RespawnData(EnemyBase, 10));
			enemies.push(new RespawnData(Enemy_2, 8));
			enemies.push(new RespawnData(EnemyBase, 15));
			enemies.push(new RespawnData(EnemyBase, 14));
			enemies.push(new RespawnData(EnemyBase, 8));
			enemies.push(new RespawnData(EnemyBase, 12));
			enemies.push(new RespawnData(EnemyBase, 7));
			enemies.push(new RespawnData(EnemyBase, 9));
			enemies.push(new RespawnData(EnemyBase, 6));
			enemies.push(new RespawnData(EnemyBase, 10));
			enemies.push(new RespawnData(EnemyBase, 8));
			enemies.push(new RespawnData(EnemyBase, 10));
			enemies.push(new RespawnData(EnemyBase, 8));
			enemies.push(new RespawnData(EnemyBase, 10));*/
		}
		
		private function level_2():void {
			enemies.push(new RespawnData(EnemyBase, 15));
		}
		
		private function level_3():void {
			enemies.push(new RespawnData(EnemyBase, 15));
		}
		
		private function level_4():void {
			enemies.push(new RespawnData(EnemyBase, 15));
		}
		
		private function level_5():void {
			enemies.push(new RespawnData(EnemyBase, 15));
		}
		
		private function level_6():void {
			enemies.push(new RespawnData(EnemyBase, 15));
		}
		
		private function level_7():void {
			enemies.push(new RespawnData(EnemyBase, 15));
		}
		
		private function level_8():void {
			enemies.push(new RespawnData(EnemyBase, 15));
		}
		
		private function level_9():void {
			enemies.push(new RespawnData(EnemyBase, 15));
		}
		
		private function level_10():void {
			enemies.push(new RespawnData(EnemyBase, 15));
		}
		
		private function level_11():void {
			enemies.push(new RespawnData(EnemyBase, 15));
		}
		
		private function level_12():void {
			enemies.push(new RespawnData(EnemyBase, 15));
		}
		
		private function level_13():void {
			enemies.push(new RespawnData(EnemyBase, 15));
		}
		
		private function level_14():void {
			enemies.push(new RespawnData(EnemyBase, 15));
		}
		
		private function level_15():void {
			enemies.push(new RespawnData(EnemyBase, 15));
		}
		
		private function level_16():void {
			enemies.push(new RespawnData(EnemyBase, 15));
		}
		
		private function level_17():void {
			enemies.push(new RespawnData(EnemyBase, 15));
		}
		
		private function level_18():void {
			enemies.push(new RespawnData(EnemyBase, 15));
		}
		
		private function level_19():void {
			enemies.push(new RespawnData(EnemyBase, 15));
		}
		
		private function level_20():void {
			enemies.push(new RespawnData(EnemyBase, 15));
		}
	
	}

}