{ ... }:
{
	windowrule = [
		"float, class:(clipse)"
		"size 622 652, class:(clipse)"
		"stayfocused, class:(clipse)"

		"suppressevent maximize, class:.*"
		"nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"

		"opacity 0.0 override, class:^(xwaylandvideobridge)$"
		"noanim, class:^(xwaylandvideobridge)$"
		"noinitialfocus, class:^(xwaylandvideobridge)$"
		"maxsize 1 1, class:^(xwaylandvideobridge)$"
		"noblur, class:^(xwaylandvideobridge)$"
		"nofocus, class:^(xwaylandvideobridge)$"
	];
	windowrulev2 = [
		"tile, class:^(Chromium)$"
	];
}
