{
  config,
  lib,
  ...
}:
let
  cfg = config.programs.discord;
  inherit (lib)
    mkEnableOption
    mkIf
    ;
in
{
  options.programs.discord = {
    enable = mkEnableOption "";
  };

  config = mkIf cfg.enable {
    programs.nixcord = {
      enable = true;
      user = "error";

      discord = {
        openASAR.enable = false;
        vencord.enable = false;

        silenceNoModClientWarning = true;
      };

      equibop = {
        enable = true;

        settings = {
          arRPC = true;
          discordBranch = "stable";
          enableSplashScreen = false;
          hardwareVideoAcceleration = true;
          minimizeToTray = true;
          splashTheming = false;
        };
      };

      config = {
        enableReactDevtools = true;

        plugins = {
          accountPanelServerProfile.enable = true;
          alwaysTrust.enable = true;
          betterForwards.enable = true;
          betterRoleContext.enable = true;
          betterSessions.enable = true;
          callTimer.enable = true;
          clearUrls.enable = true;
          copyEmojiMarkdown.enable = true;
          copyFileContents.enable = true;
          copyProfileColors.enable = true;
          copyStickerLinks.enable = true;
          copyUserUrls.enable = true;
          crashHandler = {
            enable = true;
            attemptToNavigateToHome = true;
          };
          downloadAllAttachments.enable = true;
          equibopStreamFixes.enable = true;
          experiments.enable = true;
          fakeNitro.enable = true;
          fixCodeblockGap.enable = true;
          fixSpotifyEmbeds.enable = true;
          fixYoutubeEmbeds.enable = true;
          forceOwnerCrown.enable = true;
          gifMaker.enable = true;
          imageZoom = {
            enable = true;
            size = 250.0;
          };
          implicitRelationships.enable = true;
          jumpTo.enable = true;
          keepCurrentChannel.enable = true;
          lastActive.enable = true;
          limitlessScreenshare.enable = true;
          markdownTables.enable = true;
          memberCount.enable = true;
          mentionAvatars.enable = true;
          messageLatency = {
            enable = true;
            latency = 2;
            showMillis = true;
          };
          messageLinkEmbeds.enable = true;
          messageLogger = {
            enable = true;
            deleteStyle = "overlay";
          };
          mutualGroupDms.enable = true;
          noDevtoolsWarning.enable = true;
          noF1.enable = true;
          noReplyMention = {
            enable = true;
            userList = "372809091208445953,419880181101232129";
            shouldPingListed = false;
          };
          permissionsViewer.enable = true;
          petpet.enable = true;
          platformIndicators = {
            enable = true;
            messages = false;
          };
          relationshipNotifier = {
            enable = true;
            notices = true;
          };
          revealAllSpoilers.enable = true;
          reviewDb = {
            enable = true;
            showWarning = false;
          };
          sedEnhanced.enable = true;
          serverInfo.enable = true;
          showHiddenChannels.enable = true;
          showHiddenThings.enable = true;
          silentTyping = {
            enable = true;
            enabledGlobally = true;
            chatIcon = true;
            defaultHidden = true;
            enabledLocations = "";
            disabledLocations = "";
            chatIconLeftClickAction = "channel";
            chatIconMiddleClickAction = "settings";
            chatIconRightClickAction = "global";
            hideChatBoxTypingIndicators = false;
            hideMembersListTypingIndicators = false;
          };
          spotifyCrack.enable = true;
          translate.enable = true;
          typingIndicator.enable = true;
          typingTweaks.enable = true;
          unindent.enable = true;
          userVoiceShow.enable = true;
          viewIcons.enable = true;
          viewRaw.enable = true;
          voiceDownload.enable = true;
          voiceMessages.enable = true;
          voiceStats.enable = true;
          volumeBooster.enable = true;
          webKeybinds.enable = true;
          webScreenShareFixes.enable = true;
          whoReacted.enable = true;
          youtubeAdblock.enable = true;
          zipPreview.enable = true;
          altKrispSwitch.enable = true;
          betterAudioPlayer.enable = true;
          betterInvites.enable = true;
          messageLoggerEnhanced = {
            enable = true;
            messageLimit = 100;
            cacheLimit = 250;
            saveImages = true;
          };
          messageTranslate = {
            enable = true;
            autoTranslate = false;
          };
          moyai = {
            enable = true;
            volume = 0.25;
          };
          newPluginsManager.enable = true;
          cancelFriendRequest.enable = true;
          questify = {
            enable = true;
            disableSponsoredBanner = true;
            allowChangingDangerousSettings = true;
            makeMobileVideoQuestsDesktopCompatible = true;
            autoCompleteQuestTypes = {
              WATCH_VIDEO = true;
              WATCH_VIDEO_ON_MOBILE = true;
              ACHIEVEMENT_IN_ACTIVITY = true;
            };
            notifyOnNewQuests = false;
            questButtonDisplay = "never";
            questFetchInterval = 12 * 60 * 60;
          };
          showSongName.enable = true;
          timezones = {
            enable = true;
            askedTimezone = true;
            showOwnTimezone = false;
            twentyFourHourFormat = true;
          };
          voiceRejoin.enable = true;
          whosWatching.enable = true;
          webContextMenus.enable = true;
          equicordHelper = {
            enable = true;
            noMirroredCamera = false;
            removeActivitySection = false;
            showYourOwnActivityButtons = false;
            forceRoleIcon = false;
            restoreFileDownloadButton = false;
            noModalAnimation = false;
            disableAdoptTagPrompt = false;
            jsonGateway = false;
            noBulletPoints = false;
            accountStandingButton = false;
          };
          disableDeepLinks.enable = true;
        };
      };
    };
  };
}
