package units.enemies {
	import gui.HealthLine;
	import states.GameState;
	
	/**
	 * ...
	 * @author Vladimir
	 */
	public class Enemy_2 extends EnemyBase {
		
		public function Enemy_2() {
			super();
		}
		
		override protected function create():void {
			addAnimationFromCache("unitWalk_02", "walk");
			addAnimationFromCache("unitAttack_02", "attack");
			addAnimationFromCache("unitDeath_02", "death");
			addAnimationFromCache("unitStand_02", "stay");
			addAnimationFromCache("unitOut_02", "out");
			
			startHealth = 30;
			damage = 10;
			minAttackDistance = 60;
			maxAttackDistance = 70;
			speed = -26;
			maxDelayAttack = 2.2;
			price = 8;
			coinValue = 20;
			
			posX = 800;
			posY = 310;
			
			healthLine = new HealthLine(this, startHealth);
			add(healthLine);
			healthLine.reset(2, -20);
		}
		
		/**
		 * Метод корректирующий луч снайпера.
		 */
		override public function ray():void {
			GameState.instance.showRay(x + 12, -60);
		}
	
	}

}