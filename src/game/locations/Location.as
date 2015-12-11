package game.locations {
	import adobe.utils.CustomActions;
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntG;
	import ru.antkarlov.anthill.AntMath;
	
	/**
	 * ...
	 * @author Vladimir
	 * Класс отвечающий за отрисовку земли, неба, задних планов в игре.
	 */
	public class Location extends AntActor {
		
		private var ground:AntActor = new AntActor();
		private var groundBack1:AntActor = new AntActor();
		private var groundBack2:AntActor = new AntActor();
		private var sky:AntActor = new AntActor();
		private var planet:AntActor = new AntActor();
		
		private var planetAngle:Number;
		
		public function Location() {
			super();
			
			sky.addAnimationFromCache("sky_01");
			sky.reset(0, -10);
			add(sky);
			
			
			planet.addAnimationFromCache("planet");
			planet.x = 100;
			planet.y = 300;
			add(planet);
			planet.angularVelocity = 20;
			planet.moves = true;
			planetAngle = Math.atan2(300 - planet.x, 300 - planet.y);
			
			// смещение точки регистрации на центр по х
			var tmp2:AntActor = new AntActor();
			tmp2.addAnimationFromCache("ground_back_02");
			groundBack2.add(tmp2);
			tmp2.x = -tmp2.width / 2;
			groundBack2.x = tmp2.width / 2;
			groundBack2.y = 118;
			add(groundBack2);
			
			var tmp1:AntActor = new AntActor();
			tmp1.addAnimationFromCache("ground_back_01");
			groundBack1.add(tmp1);
			tmp1.x = -tmp1.width / 2;
			groundBack1.x = tmp1.width / 2;
			groundBack1.y = 110;
			add(groundBack1);
			
			ground.addAnimationFromCache("ground_01");
			ground.reset(0, 50);
			add(ground);
			
			
		}
		
		override public function update():void {
			super.update();
			
			// меняем положение задников (паралакс)
			var speed1:Number = 20;
			var pos1:Number = AntG.stage.width / 2 - (AntG.mouse.screenX - AntG.stage.width / 2) / 10;
			groundBack1.x += (pos1 - groundBack1.x) / speed1;
			
			var speed2:Number = 60;
			var pos2:Number = AntG.stage.width / 2 - (AntG.mouse.screenX - AntG.stage.width / 2) / 14;
			groundBack2.x += (pos2 - groundBack2.x) / speed2;
			
			
			planet.x = Math.cos(planetAngle) * 100 + 300;
			planet.y = Math.sin(planetAngle) * 100 + 200;
			planetAngle += AntG.elapsed * 0.3;
			
		}
	
	}

}