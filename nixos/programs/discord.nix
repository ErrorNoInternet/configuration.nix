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
          betterRoleContext.enable = true;
          betterSessions.enable = true;
          callTimer.enable = true;
          ClearURLs.enable = true;
          copyFileContents.enable = true;
          CopyUserURLs.enable = true;
          crashHandler.enable = true;
          equibopStreamFixes.enable = true;
          experiments.enable = true;
          fakeNitro.enable = true;
          favoriteGifSearch.enable = true;
          fixCodeblockGap.enable = true;
          forceOwnerCrown.enable = true;
          friendsSince.enable = true;
          imageZoom.enable = true;
          implicitRelationships.enable = true;
          keepCurrentChannel.enable = true;
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
          MutualGroupDMs.enable = true;
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
          ReviewDB = {
            enable = true;
            showWarning = false;
          };
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
          translate.enable = true;
          typingIndicator.enable = true;
          typingTweaks.enable = true;
          unindent.enable = true;
          userVoiceShow.enable = true;
          viewIcons.enable = true;
          viewRaw.enable = true;
          voiceMessages.enable = true;
          volumeBooster.enable = true;
          webKeybinds.enable = true;
          webScreenShareFixes.enable = true;
          whoReacted.enable = true;
          altKrispSwitch.enable = true;
          betterAudioPlayer.enable = true;
          betterInvites.enable = true;
          messageLoggerEnhanced = {
            enable = true;
            messageLimit = 100;
            attachmentSizeLimitInMegabytes = 10;
            cacheLimit = 250;
          };
          moyai = {
            enable = true;
            volume = 0.25;
          };
          newPluginsManager.enable = true;
          cancelFriendRequest.enable = true;
          questify = {
            enable = true;
            disableQuestsDiscoveryTab = false;
            disableQuestsFetchingQuests = false;
            disableQuestsDirectMessagesTab = false;
            disableQuestsPageSponsoredBanner = false;
            disableQuestsPopupAboveAccountPanel = true;
            disableQuestsBadgeOnUserProfiles = false;
            disableQuestsGiftInventoryRelocationNotice = true;
            disableFriendsListActiveNowPromotion = true;
            disableMembersListActivelyPlayingIcon = true;
            disableQuestsEverything = false;
            makeMobileQuestsDesktopCompatible = true;
            completeVideoQuestsQuicker = false;
            completeVideoQuestsInBackground = true;
            completeGameQuestsInBackground = true;
            completeAchievementQuestsInBackground = true;
            notifyOnQuestComplete = true;
            questButtonDisplay = "never";
          };
          showSongName.enable = true;
          timezones = {
            enable = true;
            _24hTime = true;
            showOwnTimezone = false;
            askedTimezone = true;
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
