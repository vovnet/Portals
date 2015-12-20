package sources {
	import flash.display.Sprite;
	import flash.sampler.StackFrame;
	import ru.antkarlov.anthill.AntAssetLoader;
	
	/**
	 * ...
	 * @author Vladimir
	 */
	public class Assets {
		
		[Embed(source = "../../asset/car_01.png")]
		private static var CarEmbed:Class;
		
		[Embed(source = "../../asset/Coin.png")]
		private static var CoinEmbed:Class;
		
		[Embed(source = "../../asset/trava.png")]
		private static var TravaEmbed:Class;
		
		[Embed(source = "../../asset/fonts/foo.ttf", fontFamily = "foo", embedAsCFF = "false")]
		protected var junk1:String;
		
		[Embed(source = "../../asset/fonts/casper.ttf",  fontFamily = "casper", embedAsCFF = "false")]
		protected var junk2:String;
		
		[Embed(source = "../../asset/background.jpg")]
		private static var BackEmbed:Class;
		
		[Embed(source = "../../asset/prototype/game_snipe.png")]
		private static var snipe:Class;
		[Embed(source = "../../asset/prototype/game_medic.png")]
		private static var medic:Class;
		[Embed(source = "../../asset/prototype/game_hero.png")]
		private static var hero:Class;
		[Embed(source = "../../asset/prototype/game_enemy.png")]
		private static var enemy:Class;
		[Embed(source = "../../asset/prototype/btn.png")]
		private static var btn:Class;
		
		[Embed(source = "../../asset/game/world/ground_01.png")]
		private static var EmbedGround_01:Class;
		[Embed(source = "../../asset/game/world/ground_back_01.png")]
		private static var EmbedGroundBack_01:Class;
		[Embed(source = "../../asset/game/world/ground_back_02.png")]
		private static var EmbedGroundBack_02:Class;
		[Embed(source = "../../asset/game/world/sky_01.png")]
		private static var EmbedSky_01:Class;
		
		[Embed(source = "../../asset/game/world/planet.png")]
		private static var EmbedPlanet:Class;
		
		// portal
		[Embed(source = "../../asset/game/spritesheets/spritesheep_portal.png")]
		private static var EmbedSpritesheetPortal:Class;
		[Embed(source = "../../asset/game/spritesheets/spritesheep_portal.xml",mimeType="application/octet-stream")]
		private static var EmbedXmlPortal:Class;
		
		// guard hero
		[Embed(source = "../../asset/game/spritesheets/spritesheet_guardgreen.png")]
		private static var EmbedSpritesheetGuardHero:Class;
		[Embed(source = "../../asset/game/spritesheets/spritesheet_guardgreen.xml", mimeType = "application/octet-stream")]
		private static var EmbedXmlGuardHero:Class;
		
		[Embed(source = "../../asset/game/spritesheets/backing.png")]
		private static var EmbedBacking:Class;
		
		
		public static function load(loader:AntAssetLoader, onComplete:Function):void {			
			loader.addGraphic(CarEmbed, "car");
			loader.addGraphic(CoinEmbed, "coin");
			loader.addGraphic(TravaEmbed, "trava");
			loader.addGraphic(BackEmbed, "back");
			loader.addGraphic(snipe, "snipe");
			loader.addGraphic(medic, "medic");
			loader.addGraphic(hero, "hero");
			loader.addGraphic(enemy, "enemy");
			loader.addGraphic(btn, "btn");
			
			loader.addGraphic(EmbedSky_01, "sky_01");
			loader.addGraphic(EmbedGround_01, "ground_01");
			loader.addGraphic(EmbedGroundBack_01, "ground_back_01");
			loader.addGraphic(EmbedGroundBack_02, "ground_back_02");
			
			loader.addClip(fon_menu_mc, "levels_background");
			loader.addClip(planet_LVL_mc, "planet_level");
			
			loader.addClip(pause_mc, "backing");
			
			loader.addClip(portal_mc, "portalWait");
			loader.addClip(portal_passage_mc, "portalOut");
			
			loader.addClip(planets_mc, "planet");
			loader.addClip(hp_line_mc, "hpLine");
			
			loader.addClip(guardgreen_mc, "guardStay");
			loader.addClip(guardgreen_atack_mc, "guardAttack");
			loader.addClip(gurdgreen_dead_mc, "guardDeath");
			
			loader.addClip(guardred_mc, "magStay");
			loader.addClip(guardred_attack_mc, "magAttack");
			
			loader.addClip(guradblue_mc, "snipeStay");
			loader.addClip(guardblue_attack_mc, "sniperAttack");
			
			loader.addClip(unit_mc, "unitWalk_01");
			loader.addClip(unit_dead_mc, "unitDeath_01");
			loader.addClip(unit_attack_mc, "unitAttack_01");
			loader.addClip(unit_stand_mc, "unitStand_01");
			loader.addClip(passage_mc, "unitOut_01");
			
			loader.addClip(unit2_mc, "unitWalk_02");
			loader.addClip(unit2_stand_mc, "unitStand_02");
			loader.addClip(unit2_dead_mc, "unitDeath_02");
			loader.addClip(unit2_attack_mc, "unitAttack_02");
			loader.addClip(unit2_passage_mc, "unitOut_02");
			
			
			loader.addClip(ray_mc, "ray");
			
			loader.addClip(button_menu_mc, "btn_menu");
			loader.addClip(pausee_mc, "btn_pause");
			loader.addClip(next_mc, "btn_back_to_play");
			loader.addClip(refresh_mc, "btn_refresh");
			
			// upgrades
			loader.addClip(upgrade_mc, "go_leveling_button");
			loader.addClip(Plashka_mc, "pre_button");
			loader.addClip(upgrade_active_mc, "lit_sign");
			loader.addClip(button_mc, "price_button");
			
			
			// upgrades icon
			loader.addClip(heart_mc, "heart_icon");
			loader.addClip(blades_mc, "attack_icon");
			loader.addClip(clock_mc, "clock_icon");
			
			
			// loading
			loader.start();
			loader.eventComplete.add(onComplete);
		}
	}

}