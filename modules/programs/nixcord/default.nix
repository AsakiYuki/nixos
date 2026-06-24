{libs, ...}: {
  programs.nixcord = {
    enable = true;
    vesktop.enable = true;
    discord = {
      enable = true;
      vencord.enable = true;
    };

    quickCss = builtins.readFile (libs.root "/assets/discord/style.css");

    config = {
      useQuickCss = true;
      enableReactDevtools = true;
      themeLinks = ["https://catppuccin.github.io/discord/dist/catppuccin-mocha-blue.theme.css"];

      plugins = {
        blurNsfw.enable = true;
        volumeBooster.enable = true;
        clearUrls.enable = true;
        copyEmojiMarkdown.enable = true;
        youtubeAdblock.enable = true;
        experiments.enable = true;
        fixCodeblockGap.enable = true;
        fixImagesQuality.enable = true;
        fixSpotifyEmbeds.enable = true;
        fixYoutubeEmbeds.enable = true;
        gameActivityToggle.enable = true;
        imageZoom.enable = true;
        memberCount.enable = true;
        mentionAvatars.enable = true;
        noDevtoolsWarning.enable = true;
        noF1.enable = true;
        openInApp.enable = true;
        voiceDownload.enable = true;
        validUser.enable = true;
        translate.enable = true;
        whoReacted.enable = true;

        fakeNitro = {
          enable = true;
          enableEmojiBypass = false;
        };
      };
    };
  };
}
