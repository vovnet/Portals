package game_prototype {
	import flash.events.MouseEvent;
	import ru.antkarlov.anthill.AntActor;
	import ru.antkarlov.anthill.AntButton;
	import ru.antkarlov.anthill.AntG;
	import ru.antkarlov.anthill.AntLabel;
	import ru.antkarlov.anthill.AntPoint;
	import ru.antkarlov.anthill.AntState;
	import ru.antkarlov.anthill.utils.AntColor;
	import gui.textFields.BonusTextField;
	
	/**
	 * ...
	 * @author Vladimir
	 */
	public class PrototypeState extends AntState {
		
		public var hero:Hero;
		private var enemy:Enemy;
		private var medic:Medic;
		private var snipe:Snipe;
		
		private var respCount:Number = 0;
		private var respTime:Number = 15;
		public var enemiesCount:int = 1;
		public var enemies:Vector.<Enemy> = new Vector.<Enemy>();
		public var us:User;
		
		public function PrototypeState() {
			super();
			var back:AntActor = new AntActor();
			back.addAnimationFromCache("back");
			add(back);
			
			us = new User(this);
			
			snipe = new Snipe(this);
			snipe.reset(400, 160);
			//add(snipe);
			
			var label:AntLabel = new AntLabel("system", 8, AntColor.LIME);
			label.text = "Restart Hero: R";
			label.reset(AntG.widthHalf - label.width / 2, 20);
			add(label);
			
			hero = defGroup.recycle(Hero) as Hero;
			hero.revive();
			hero.init(this);
			hero.reset(100, 300);
			add(hero);
			
			medic = new Medic(this);
			medic.reset(180, 160);
			//add(medic);
			
			respawnEnemy();
			
			heroUI();
			medicUI();
			snipeUI();
			
		}
		
		
		private function onClickHeal(btn:AntButton):void {
			medic.heal += 25;
			btn.text = medic.heal.toString();
		}
		
		private function onClickHeroDamage(btn:AntButton):void {
			hero.damage += 25;
			btn.text = hero.damage.toString();
		}
		
		override public function update():void {
			super.update();
			AntG.watchValue("enemies", enemies.length);
			respCount += AntG.elapsed;
			if (respCount >= respTime) {
				respCount = 0;
				respawnEnemy();
			}
			
			if (AntG.keys.isPressed("R"))
				respawnHero();
			
			us.update();
		}
		
		private function respawnHero():void {
			if (hero.health > 0)
				return;
			hero = defGroup.recycle(Hero) as Hero;
			hero.revive();
			hero.init(this);
			hero.reset(100, 300);
		}
		
		public function attack(damage:int, posX:Number, posY:Number):void {
			var attackLable:BonusTextField = defGroup.recycle(BonusTextField) as BonusTextField;
			attackLable.revive();
			attackLable.init("-" + damage.toString());
			attackLable.reset(posX, posY);
			add(attackLable);
		}
		
		public function heal(h:int, posX:Number, posY:Number):void {
			var healLable:BonusTextField = defGroup.recycle(BonusTextField) as BonusTextField;
			healLable.revive();
			healLable.init("+" + h.toString(), 0x247bde);
			healLable.reset(posX, posY);
			add(healLable);
		}
		
		public function showLabel(text:String, posX:Number, posY:Number, color:uint = 0x247bde):void {
			var lable:BonusTextField = defGroup.recycle(BonusTextField) as BonusTextField;
			lable.revive();
			lable.init(text, color);
			lable.reset(posX, posY);
			add(lable);
		}
		
		private function respawnEnemy():void {
			enemiesCount++;
			enemy = defGroup.recycle(Enemy) as Enemy;
			enemy.revive();
			enemy.init(this);
			enemy.damage = 10;
			enemy.reset(750, 300);
			add(enemy);
			enemies.push(enemy);
		}
		
		private function heroUI():void {
			var heroLabel:AntLabel = new AntLabel("system", 8, AntColor.OLIVE);
			heroLabel.text = "Hero:";
			heroLabel.reset(40, 450);
			add(heroLabel);
			
			var heroDamageLabel:AntLabel = new AntLabel("system", 8, AntColor.SILVER);
			heroDamageLabel.text = "Damage:";
			heroDamageLabel.reset(20, 480);
			add(heroDamageLabel);
			
			var btnHeroDamage:AntButton = AntButton.makeButton("btn", hero.damage.toString(), new AntLabel("system"));
			btnHeroDamage.reset(80, 480);
			add(btnHeroDamage);
			btnHeroDamage.eventClick.add(onClickHeroDamage);
			
			var heroHealthLabel:AntLabel = new AntLabel("system", 8, AntColor.SILVER);
			heroHealthLabel.text = "Health:";
			heroHealthLabel.reset(20, 510);
			add(heroHealthLabel);
			
			var btnHeroHealth:AntButton = AntButton.makeButton("btn", hero.maxHealth.toString(), new AntLabel("system"));
			btnHeroHealth.reset(80, 510);
			add(btnHeroHealth);
			btnHeroHealth.eventClick.add(onClickHeroHealth);
			
			var heroSpeedLabel:AntLabel = new AntLabel("system", 8, AntColor.SILVER);
			heroSpeedLabel.text = "Speed:";
			heroSpeedLabel.reset(20, 540);
			add(heroSpeedLabel);
			
			var btnHeroSpeed:AntButton = AntButton.makeButton("btn", hero.delayAttack.toString(), new AntLabel("system"));
			btnHeroSpeed.reset(80, 540);
			add(btnHeroSpeed);
			btnHeroSpeed.eventClick.add(onClickHeroSpeed);
		}
		
		private function onClickHeroSpeed(btn:AntButton):void {
			hero.delayAttack -= 0.2;
			btn.text = hero.delayAttack.toString();
		}
		
		private function onClickHeroHealth(btn:AntButton):void {
			hero.maxHealth += 30;
			btn.text = hero.maxHealth.toString();
		}
		
		private function medicUI():void {
			var medicLabel:AntLabel = new AntLabel("system", 8, AntColor.PURPLE);
			medicLabel.text = "Medic:";
			medicLabel.reset(240, 450);
			add(medicLabel);
			
			var medicPowerLabel:AntLabel = new AntLabel("system", 8, AntColor.SILVER);
			medicPowerLabel.text = "Power:";
			medicPowerLabel.reset(190, 480);
			add(medicPowerLabel);
			
			var btnHeal:AntButton = AntButton.makeButton("btn", medic.heal.toString(), new AntLabel("system"));
			btnHeal.reset(240, 480);
			add(btnHeal);
			btnHeal.eventClick.add(onClickHeal);
			
			var medicSpeedLabel:AntLabel = new AntLabel("system", 8, AntColor.SILVER);
			medicSpeedLabel.text = "Speed:";
			medicSpeedLabel.reset(190, 510);
			add(medicSpeedLabel);
			
			var btnSpeed:AntButton = AntButton.makeButton("btn", medic.healTime.toString(), new AntLabel("system"));
			btnSpeed.reset(240, 510);
			add(btnSpeed);
			btnSpeed.eventClick.add(onClickMedicSpeed);
		}
		
		private function onClickMedicSpeed(btn:AntButton):void {
			medic.healTime -= 0.2;
			btn.text = medic.healTime.toString();
		}
		
		private function snipeUI():void {
			var snipeLabel:AntLabel = new AntLabel("system", 8, AntColor.YELLOW);
			snipeLabel.text = "Sniper:";
			snipeLabel.reset(400, 450);
			add(snipeLabel);
			
			var snipeDamageLabel:AntLabel = new AntLabel("system", 8, AntColor.SILVER);
			snipeDamageLabel.text = "Damage:";
			snipeDamageLabel.reset(360, 480);
			add(snipeDamageLabel);
			
			var btnDamage:AntButton = AntButton.makeButton("btn", snipe.damage.toString(), new AntLabel("system"));
			btnDamage.reset(420, 480);
			add(btnDamage);
			btnDamage.eventClick.add(onClickSnipeDamage);
			
			var snipeSpeedLabel:AntLabel = new AntLabel("system", 8, AntColor.SILVER);
			snipeSpeedLabel.text = "Speed:";
			snipeSpeedLabel.reset(360, 510);
			add(snipeSpeedLabel);
			
			var btnSpeed:AntButton = AntButton.makeButton("btn", snipe.attackTime.toString(), new AntLabel("system"));
			btnSpeed.reset(420, 510);
			add(btnSpeed);
			btnSpeed.eventClick.add(onClickSnipeSpeed);
		}
		
		private function onClickSnipeSpeed(btn:AntButton):void {
			snipe.attackTime -= 0.2;
			btn.text = snipe.attackTime.toString();
		}
		
		private function onClickSnipeDamage(btn:AntButton):void {
			snipe.damage += 10;
			btn.text = snipe.damage.toString();
		}
	
	}

}