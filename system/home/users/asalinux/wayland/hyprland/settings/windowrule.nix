{ ... }:
{
	windowrule = [
		"float, class:(clipse)"
		"size 622 652, class:(clipse)"
		"stayfocused, class:(clipse)"

		"suppressevent maximize, class:.*"
		"nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
	]
	++
	(map (rule: "${rule}, class:^(xwaylandvideobridge)$") [
		"opacity 0.0 override"
		"noanim"
		"noinitialfocus"
		"maxsize 1 1"
		"noblur"
		"nofocus"
	])
	++
	(map (rule: "${rule}, class:^(GeForce NOW)$") [
		"suppressevent fullscreen"
		"float"
		"maxsize 1280 720"
		"minsize 1280 720"
		"center 1"
	])
	++
	(map (rule: "${rule}, initialTitle:^(Picture-in-Picture)$") (
	let
		WIDTH = 400;
		HEIGHT = 225;
	in
	[
		"suppressevent fullscreen"
		"float"
		"pin"
		"size ${toString WIDTH} ${toString HEIGHT}"
		"move 100%-${toString (WIDTH + 10)} 100%-${toString (HEIGHT + 10)}"
	]));

	windowrulev2 = [
		"tile, class:^(Chromium)$"
	];
}
