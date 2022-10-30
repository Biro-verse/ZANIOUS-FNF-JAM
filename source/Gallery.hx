package;

#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
#if MODS_ALLOWED
import sys.FileSystem;
import sys.io.File;
#end
import lime.utils.Assets;

using StringTools;

class Gallery extends MusicBeatState
{
	var curSelected:Int = -1;

	private var grpOptions:FlxTypedGroup<Alphabet>;
	private var iconArray:Array<AttachedSprite> = [];
	private var creditsStuff:Array<Array<String>> = [];
	var menuItems:FlxTypedGroup<FlxSprite>;

	var bg:FlxSprite;
	var descText:FlxText;
	var intendedColor:Int;
	var colorTween:FlxTween;
	var weekSprites:FlxSprite;

	var offsetThing:Float = -75;

	override function create()
	{
		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("Looking at credits", null);
		#end

		FlxG.sound.playMusic('assets/music/ThanksForPlaying.ogg');

		persistentUpdate = true;
		bg = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		//add(bg);
		bg.screenCenter();

		weekSprites =  new FlxSprite(0, -45).loadGraphic(Paths.image('CreditsCrap/Credits'), true, 1920, 1080);
		weekSprites.animation.add('week0', [0], 0, false);
		weekSprites.animation.add('week1', [1], 0, false);
		weekSprites.animation.add('week2', [2], 0, false);
		weekSprites.animation.add('week3', [3], 0, false);
		weekSprites.animation.add('week4', [4], 0, false);
		weekSprites.animation.add('week5', [5], 0, false);
		weekSprites.animation.add('week6', [6], 0, false);
		weekSprites.animation.add('week7', [7], 0, false);
		weekSprites.animation.add('week8', [8], 0, false);
		weekSprites.animation.add('week9', [9], 0, false);
		weekSprites.animation.add('week10', [10], 0, false);
		weekSprites.animation.add('week11', [11], 0, false);
		weekSprites.animation.add('week12', [12], 0, false);
		weekSprites.animation.add('week13', [13], 0, false);

		weekSprites.antialiasing = true;
		weekSprites.updateHitbox();
		weekSprites.setGraphicSize(Std.int(weekSprites.width * 0.7));
		weekSprites.scrollFactor.x = 0.01;
		weekSprites.scrollFactor.y = 0;
		weekSprites.screenCenter();
		weekSprites.antialiasing = ClientPrefs.globalAntialiasing;

		add(weekSprites);
		
		grpOptions = new FlxTypedGroup<Alphabet>();
		add(grpOptions);

		#if MODS_ALLOWED
		var path:String = 'modsList.txt';
		if(FileSystem.exists(path))
		{
			var leMods:Array<String> = CoolUtil.coolTextFile(path);
			for (i in 0...leMods.length)
			{
				if(leMods.length > 1 && leMods[0].length > 0) {
					var modSplit:Array<String> = leMods[i].split('|');
					if(!Paths.ignoreModFolders.contains(modSplit[0].toLowerCase()) && !modsAdded.contains(modSplit[0]))
					{
						if(modSplit[1] == '1')
							pushModCreditsToList(modSplit[0]);
						else
							modsAdded.push(modSplit[0]);
					}
				}
			}
		}

		var arrayOfFolders:Array<String> = Paths.getModDirectories();
		arrayOfFolders.push('');
		for (folder in arrayOfFolders)
		{
			pushModCreditsToList(folder);
		}
		#end

		var pisspoop:Array<Array<String>> = [ //Name - Icon name - Description - Link - BG Color
			['Biro',        'biro',        'A bonus song character where butcher fights wizard lady (zoo wee mama)',                    'https://www.youtube.com/channel/UCkDhHejKkl40_S1Mb5RzMBg',    'FFDD33'],
			['Spacemen',        'knight',        'ZAMN',                    'https://www.youtube.com/watch?v=cRZFp8Si6po&t=1s',    'E9D75A'],
			['Milkman',        'milkman',        'Logo',                    'https://www.youtube.com/channel/UCXzfc_osmtS0sEw7Lq7ca4g',    'FFF8F9'],
			['Vvy',        'vvy',        'A concept of the title screen',                    'https://www.youtube.com/channel/UCtt5i053XlP0Ynu_b5dFbeA/videos',    '635B78'],
			['Saturn',        'saturn',        'GERALD GERALD WE NEED TO GO ON AN ADVENTURE GERALD',                    'https://www.youtube.com/channel/UCk7Q2kTP7-2J2WX0jLkT5tA',    '5B382A'],
			['Rainbow',        'rainbow',        'hi -RainbowRider6499',                    'https://www.youtube.com/channel/UCA93rLHSCGZoradNb0zk1Yg',    'D00027'],
			['Oofator',        'oofator',        'OMG SLAY BESTIE',                    'https://www.youtube.com/channel/UCtt5i053XlP0Ynu_b5dFbeA/videos',    '635B78'],
			['Chillito',        'chillito',        'Merch go HEAT rn',                    'https://www.youtube.com/channel/UCtt5i053XlP0Ynu_b5dFbeA/videos',    '635B78'],
			['Copycat',        'copycat',        'hapi',                    'https://www.youtube.com/channel/UCtt5i053XlP0Ynu_b5dFbeA/videos',    '635B78'],
			['Bi 3',        'bi 3',        'CHAOS CHAOS! (proceeds to rap battle)',                    'https://www.youtube.com/channel/UCtt5i053XlP0Ynu_b5dFbeA/videos',    '635B78'],
			['B00GMAN 08',        'b00gman-08',        'More concept art of the characters!',                    'https://www.youtube.com/channel/UCRwMMpIxRh7BHLDk2GxxIyw',    '4169E1'],
			['Nick',        'nick',        'como leche me gusta gato sin carne',                    'https://www.youtube.com/channel/UCIuV47XDp8-zH-qfQ4slwzg',    'E500E7'],
		];
		
		for(i in pisspoop){
			creditsStuff.push(i);
		}

	
		for (i in 0...creditsStuff.length)
		{
			var isSelectable:Bool = !unselectableCheck(i);

			// for new items you might have to manually center this thing sorry :/
			// actually no im stupid
			// just subtract the offset by 42 lol
			var offset:Float = 493;

			if(isSelectable) {
				if(creditsStuff[i][5] != null)
				{
					Paths.currentModDirectory = creditsStuff[i][5];
				}

				Paths.currentModDirectory = '';

				if(curSelected == -1) curSelected = i;
			}
		}

		descText = new FlxText(50, FlxG.height + offsetThing - 325, 1180, "", 32);
		descText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.BLUE, CENTER/*, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK*/);
		descText.scrollFactor.set();
		//descText.borderSize = 2.4;
		add(descText);

		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);

		bg.color = getCurrentBGColor();
		intendedColor = bg.color;
		changeSelection();
		super.create();
	}

	var quitting:Bool = false;
	var holdTime:Float = 0;
	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.7)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		if(!quitting)
		{
			if(creditsStuff.length > 1)
			{
				var shiftMult:Int = 1;
				if(FlxG.keys.pressed.SHIFT) shiftMult = 3;

				var upP = controls.UI_UP_P;
				var downP = controls.UI_DOWN_P;

				if (upP)
				{
					changeSelection(-1 * shiftMult);
					holdTime = 0;
				}
				if (downP)
				{
					changeSelection(1 * shiftMult);
					holdTime = 0;
				}

				if(controls.UI_DOWN || controls.UI_UP)
				{
					var checkLastHold:Int = Math.floor((holdTime - 0.5) * 10);
					holdTime += elapsed;
					var checkNewHold:Int = Math.floor((holdTime - 0.5) * 10);

					if(holdTime > 0.5 && checkNewHold - checkLastHold > 0)
					{
						changeSelection((checkNewHold - checkLastHold) * (controls.UI_UP ? -shiftMult : shiftMult));
					}
				}
			}

			if (controls.BACK)
			{
				if(colorTween != null) {
					colorTween.cancel();
				}
				FlxG.sound.play(Paths.sound('cancelMenu'));
				FlxG.sound.music.stop();
				FlxG.sound.playMusic('assets/music/freakyMenu.ogg');
				MusicBeatState.switchState(new MainMenuState());
				quitting = true;
			}
		}
		
		for (item in grpOptions.members)
			{
				if(!item.bold)
				{
					var lerpVal:Float = CoolUtil.boundTo(elapsed * 12, 0, 1);
					if(item.targetY == 0)
					{
						var lastX:Float = item.x;
						item.screenCenter(X);
						item.x = FlxMath.lerp(lastX, item.x - 70, lerpVal);
					}
					else
					{
						item.x = FlxMath.lerp(item.x, 200 + -40 * Math.abs(item.targetY), lerpVal);
					}
				}
			}
			super.update(elapsed);
		}

	var moveTween:FlxTween = null;
	function changeSelection(change:Int = 0)
	{
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
		do {
			curSelected += change;
			if (curSelected < 0)
				curSelected = creditsStuff.length - 1;
			if (curSelected >= creditsStuff.length)
				curSelected = 0;
		} while(unselectableCheck(curSelected));

		var newColor:Int =  getCurrentBGColor();
		if(newColor != intendedColor) {
			if(colorTween != null) {
				colorTween.cancel();
			}
			intendedColor = newColor;
			colorTween = FlxTween.color(bg, 1, bg.color, intendedColor, {
				onComplete: function(twn:FlxTween) {
					colorTween = null;
				}
			});
		}

		var bullShit:Int = 0;

		for (item in grpOptions.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			if(!unselectableCheck(bullShit-1)) {
				item.alpha = 0.6;
				if (item.targetY == 0) {
					item.alpha = 1;
				}
			}
		}

		descText.text = creditsStuff[curSelected][2];
		descText.y = FlxG.height - descText.height + offsetThing - 100;

		if(moveTween != null) moveTween.cancel();
		moveTween = FlxTween.tween(descText, {y : descText.y + 75}, 0.25, {ease: FlxEase.sineOut});

		if (curSelected >= creditsStuff.length)
			curSelected = 0;
		weekSprites.animation.play('week' + curSelected);
		if (curSelected < 0)
			curSelected = creditsStuff.length - 1;
		weekSprites.animation.play('week' + curSelected);

	}

	#if MODS_ALLOWED
	private var modsAdded:Array<String> = [];
	function pushModCreditsToList(folder:String)
	{
		if(modsAdded.contains(folder)) return;

		var creditsFile:String = null;
		if(folder != null && folder.trim().length > 0) creditsFile = Paths.mods(folder + '/data/credits.txt');
		else creditsFile = Paths.mods('data/credits.txt');

		if (FileSystem.exists(creditsFile))
		{
			var firstarray:Array<String> = File.getContent(creditsFile).split('\n');
			for(i in firstarray)
			{
				var arr:Array<String> = i.replace('\\n', '\n').split("::");
				if(arr.length >= 5) arr.push(folder);
				creditsStuff.push(arr);
			}
			creditsStuff.push(['']);
		}
		modsAdded.push(folder);
	}
	#end

	function getCurrentBGColor() {
		var bgColor:String = creditsStuff[curSelected][4];
		if(!bgColor.startsWith('0x')) {
			bgColor = '0xFF' + bgColor;
		}
		return Std.parseInt(bgColor);
	}

	private function unselectableCheck(num:Int):Bool {
		return creditsStuff[num].length <= 1;
	}
}