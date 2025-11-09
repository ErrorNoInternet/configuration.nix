{ lib, osConfig, ... }:
{
  xdg.config.files = lib.mkIf osConfig.graphical.enable {
    "vesktop/settings/settings.json".text = builtins.toJSON {
      autoUpdate = true;
      autoUpdateNotification = false;
      disableMinSize = false;
      enableReactDevtools = false;
      enabledThemes = [ ];
      frameless = false;
      macosTranslucency = false;
      notifications = {
        logLimit = 50;
        position = "bottom-right";
        timeout = 5000;
        useNative = "not-focused";
      };
      notifyAboutUpdates = false;
      plugins = {
        AlwaysTrust = {
          enabled = true;
          domain = true;
          file = true;
        };
        BadgeAPI = {
          enabled = true;
        };
        BetterFolders = {
          closeAllFolders = false;
          closeAllHomeButton = false;
          closeOthers = false;
          enabled = true;
          forceOpen = false;
          keepIcons = false;
          showFolderIcon = 1;
          sidebar = true;
          sidebarAnim = true;
        };
        BetterNotesBox = {
          enabled = true;
          hide = false;
          noSpellCheck = true;
        };
        BiggerStreamPreview = {
          enabled = true;
        };
        CallTimer = {
          enabled = true;
          format = "human";
        };
        ChatInputButtonAPI = {
          enabled = true;
        };
        CommandsAPI = {
          enabled = true;
        };
        ContextMenuAPI = {
          enabled = true;
        };
        CrashHandler = {
          attemptToNavigateToHome = false;
          attemptToPreventCrashes = true;
          enabled = false;
        };
        Experiments = {
          enableIsStaff = false;
          enabled = true;
          forceStagingBanner = false;
          toolbarDevMenu = false;
        };
        FakeNitro = {
          emojiSize = 48;
          enableEmojiBypass = true;
          enableStickerBypass = true;
          enableStreamQualityBypass = true;
          enabled = true;
          stickerSize = 160;
          transformCompoundSentence = false;
          transformEmojis = true;
          transformStickers = true;
          hyperLinkText = "{{NAME}}";
          useHyperLinks = true;
          disableEmbedPermissionCheck = false;
        };
        FavoriteEmojiFirst = {
          enabled = true;
        };
        FixYoutubeEmbeds = {
          enabled = true;
        };
        ForceOwnerCrown = {
          enabled = true;
        };
        FriendsSince = {
          enabled = true;
        };
        GifPaste = {
          enabled = true;
        };
        ImageZoom = {
          enabled = true;
          invertScroll = true;
          nearestNeighbour = false;
          preventCarouselFromClosingOnClick = true;
          saveZoomValues = true;
          size = 792;
          square = false;
          zoom = { };
          zoomSpeed = { };
        };
        KeepCurrentChannel = {
          enabled = true;
        };
        LoadingQuotes = {
          enabled = true;
          replaceEvents = true;
          enableDiscordPresetQuotes = false;
          additionalQuotes = "";
          additionalQuotesDelimiter = "|";
          enablePluginPresetQuotes = true;
        };
        MemberCount = {
          enabled = true;
          memberList = true;
          toolTip = true;
          voiceActivity = true;
        };
        MemberListDecoratorsAPI = {
          enabled = true;
        };
        MessageAccessoriesAPI = {
          enabled = true;
        };
        MessageClickActions = {
          enabled = true;
          requireModifier = true;
          enableDoubleClickToReply = true;
          enableDoubleClickToEdit = true;
          enableDeleteOnClick = true;
        };
        MessageDecorationsAPI = {
          enabled = true;
        };
        MessageEventsAPI = {
          enabled = true;
        };
        MessageLinkEmbeds = {
          automodEmbeds = "never";
          enabled = true;
          idList = "";
          listMode = "blacklist";
        };
        MessageLogger = {
          deleteStyle = "overlay";
          enabled = true;
          ignoreBots = false;
          ignoreChannels = "";
          ignoreGuilds = "";
          ignoreSelf = false;
          ignoreUsers = "";
          logDeletes = true;
          logEdits = true;
          collapseDeleted = false;
          inlineEdits = true;
        };
        MessagePopoverAPI = {
          enabled = true;
        };
        MoreUserTags = {
          enabled = true;
          tagSettings = {
            ADMINISTRATOR = {
              showInChat = true;
              showInNotChat = true;
              text = "Admin";
            };
            MODERATOR = {
              showInChat = true;
              showInNotChat = true;
              text = "Mod";
            };
            MODERATOR_STAFF = {
              showInChat = false;
              showInNotChat = false;
              text = "Staff";
            };
            OWNER = {
              showInChat = true;
              showInNotChat = true;
              text = "Owner";
            };
            VOICE_MODERATOR = {
              showInChat = false;
              showInNotChat = true;
              text = "VC Mod";
            };
            WEBHOOK = {
              showInChat = true;
              showInNotChat = true;
              text = "Webhook";
            };
            CHAT_MODERATOR = {
              text = "Chat Mod";
              showInChat = true;
              showInNotChat = true;
            };
          };
        };
        MutualGroupDMs = {
          enabled = true;
        };
        NoF1 = {
          enabled = true;
        };
        NoReplyMention = {
          enabled = true;
          inverseShiftReply = false;
          shouldPingListed = false;
          userList = "372809091208445953 419880181101232129";
          roleList = "1234567890123445,1234567890123445";
        };
        NoTrack = {
          enabled = true;
          disableAnalytics = true;
        };
        NoTypingAnimation = {
          enabled = true;
        };
        NoticesAPI = {
          enabled = true;
        };
        PermissionsViewer = {
          defaultPermissionsDropdownState = false;
          enabled = true;
          permissionsSortOrder = 0;
        };
        PlatformIndicators = {
          badges = true;
          colorMobileIndicator = true;
          enabled = true;
          list = true;
          messages = false;
        };
        RelationshipNotifier = {
          enabled = true;
          friendRequestCancels = true;
          friends = true;
          groups = true;
          notices = true;
          offlineRemovals = true;
          servers = true;
        };
        ReverseImageSearch = {
          enabled = true;
        };
        SendTimestamps = {
          enabled = true;
          replaceMessageContents = true;
        };
        ServerListAPI = {
          enabled = true;
        };
        Settings = {
          enabled = true;
          settingsLocation = "aboveActivity";
        };
        SettingsStoreAPI = {
          enabled = true;
        };
        ShikiCodeblocks = {
          bgOpacity = 100;
          enabled = true;
          theme = "https://raw.githubusercontent.com/shikijs/textmate-grammars-themes/2d87559c7601a928b9f7e0f0dda243d2fb6d4499/packages/tm-themes/themes/github-dark-dimmed.json";
          tryHljs = "SECONDARY";
          useDevIcon = "GREYSCALE";
        };
        ShowHiddenChannels = {
          defaultAllowedUsersAndRolesDropdownState = true;
          enabled = true;
          hideUnreads = true;
          showMode = 1;
        };
        SilentTyping = {
          enabled = true;
          isEnabled = true;
          showIcon = false;
        };
        SortFriendRequests = {
          enabled = true;
          showDates = false;
        };
        SupportHelper = {
          enabled = true;
        };
        Translate = {
          autoTranslate = false;
          enabled = true;
          receivedInput = "auto";
          receivedOutput = "en";
          sentInput = "auto";
          sentOutput = "en";
          showChatBarButton = true;
          service = "google";
        };
        TypingIndicator = {
          enabled = true;
          includeBlockedUsers = false;
          includeCurrentChannel = true;
          includeMutedChannels = true;
          indicatorMode = 3;
        };
        TypingTweaks = {
          alternativeFormatting = true;
          enabled = true;
          showAvatars = true;
          showRoleColors = true;
        };
        Unindent = {
          enabled = true;
        };
        UserVoiceShow = {
          enabled = true;
          showInUserProfileModal = true;
          showVoiceChannelSectionHeader = true;
          showInMemberList = true;
          showInMessages = true;
        };
        UwUifier = {
          enabled = true;
          uwuEveryMessage = false;
        };
        ValidUser = {
          enabled = true;
        };
        ViewIcons = {
          enabled = true;
          format = "png";
          imgSize = "4096";
        };
        ViewRaw = {
          clickMethod = "Left";
          enabled = true;
        };
        VoiceChatDoubleClick = {
          enabled = true;
        };
        WebContextMenus = {
          addBack = true;
          enabled = true;
        };
        WebKeybinds = {
          enabled = true;
        };
        WhoReacted = {
          enabled = true;
        };
        ShowHiddenThings = {
          enabled = true;
          showTimeouts = true;
          showInvitesPaused = true;
          showModView = true;
          disableDiscoveryFilters = true;
          disableDisallowedDiscoveryFilters = true;
        };
        AlwaysAnimate = {
          enabled = false;
        };
        AnonymiseFileNames = {
          enabled = false;
        };
        "WebRichPresence (arRPC)" = {
          enabled = false;
        };
        AutomodContext = {
          enabled = false;
        };
        BANger = {
          enabled = false;
        };
        BetterGifAltText = {
          enabled = false;
        };
        BetterGifPicker = {
          enabled = false;
        };
        BetterRoleContext = {
          enabled = true;
          roleIconFileFormat = "png";
        };
        BetterRoleDot = {
          enabled = false;
        };
        BetterSessions = {
          enabled = true;
          backgroundCheck = false;
          checkInterval = 20;
        };
        BetterSettings = {
          enabled = true;
          disableFade = false;
          organizeMenu = true;
          eagerLoad = true;
        };
        BetterUploadButton = {
          enabled = false;
        };
        BlurNSFW = {
          enabled = false;
        };
        ClearURLs = {
          enabled = false;
        };
        ClientTheme = {
          enabled = false;
        };
        ColorSighted = {
          enabled = false;
        };
        ConsoleShortcuts = {
          enabled = false;
        };
        CopyUserURLs = {
          enabled = false;
        };
        CtrlEnterSend = {
          enabled = false;
        };
        CustomRPC = {
          enabled = false;
          type = 0;
          timestampMode = 0;
        };
        CustomIdle = {
          enabled = false;
        };
        Dearrow = {
          enabled = false;
        };
        Decor = {
          enabled = false;
        };
        DisableCallIdle = {
          enabled = false;
        };
        DontRoundMyTimestamps = {
          enabled = false;
        };
        F8Break = {
          enabled = false;
        };
        FakeProfileThemes = {
          enabled = false;
        };
        FavoriteGifSearch = {
          enabled = false;
        };
        FixCodeblockGap = {
          enabled = false;
        };
        FixSpotifyEmbeds = {
          enabled = true;
        };
        FriendInvites = {
          enabled = false;
        };
        GameActivityToggle = {
          enabled = false;
        };
        GreetStickerPicker = {
          enabled = false;
        };
        iLoveSpam = {
          enabled = false;
        };
        IgnoreActivities = {
          enabled = false;
        };
        ImageLink = {
          enabled = false;
        };
        ImplicitRelationships = {
          enabled = true;
          sortByAffinity = true;
        };
        InvisibleChat = {
          enabled = false;
          savedPasswords = "password, Password";
        };
        LastFMRichPresence = {
          enabled = false;
        };
        MaskedLinkPaste = {
          enabled = false;
        };
        MessageLatency = {
          enabled = true;
          latency = 2;
          detectDiscordKotlin = true;
          showMillis = true;
          ignoreSelf = false;
        };
        MessageTags = {
          enabled = false;
        };
        MoreCommands = {
          enabled = false;
        };
        MoreKaomoji = {
          enabled = false;
        };
        Moyai = {
          enabled = false;
        };
        NewGuildSettings = {
          enabled = false;
        };
        NoBlockedMessages = {
          enabled = false;
        };
        NoDefaultHangStatus = {
          enabled = false;
        };
        NoDevtoolsWarning = {
          enabled = false;
        };
        NoMosaic = {
          enabled = false;
        };
        NoPendingCount = {
          enabled = false;
        };
        NoProfileThemes = {
          enabled = false;
        };
        NoScreensharePreview = {
          enabled = false;
        };
        NoServerEmojis = {
          enabled = false;
        };
        NoUnblockToJump = {
          enabled = false;
        };
        NormalizeMessageLinks = {
          enabled = true;
        };
        NotificationVolume = {
          enabled = false;
        };
        NSFWGateBypass = {
          enabled = true;
        };
        OnePingPerDM = {
          enabled = false;
        };
        oneko = {
          enabled = false;
        };
        OpenInApp = {
          enabled = false;
        };
        OverrideForumDefaults = {
          enabled = false;
        };
        PartyMode = {
          enabled = false;
        };
        PauseInvitesForever = {
          enabled = false;
        };
        PermissionFreeWill = {
          enabled = false;
        };
        petpet = {
          enabled = false;
        };
        PictureInPicture = {
          enabled = false;
        };
        PinDMs = {
          enabled = false;
        };
        PlainFolderIcon = {
          enabled = false;
        };
        PreviewMessage = {
          enabled = false;
        };
        QuickMention = {
          enabled = false;
        };
        QuickReply = {
          enabled = false;
        };
        ReactErrorDecoder = {
          enabled = false;
        };
        ReadAllNotificationsButton = {
          enabled = false;
        };
        ReplaceGoogleSearch = {
          enabled = false;
        };
        ReplyTimestamp = {
          enabled = false;
        };
        ResurrectHome = {
          enabled = false;
        };
        RevealAllSpoilers = {
          enabled = false;
        };
        ReviewDB = {
          enabled = true;
          notifyReviews = true;
          showWarning = true;
          hideBlockedUsers = true;
          hideTimestamps = false;
        };
        RoleColorEverywhere = {
          enabled = false;
        };
        SecretRingToneEnabler = {
          enabled = false;
        };
        Summaries = {
          enabled = false;
        };
        ServerListIndicators = {
          enabled = false;
        };
        ShowAllMessageButtons = {
          enabled = false;
        };
        ShowConnections = {
          enabled = false;
        };
        ShowMeYourName = {
          enabled = false;
        };
        ShowTimeoutDuration = {
          enabled = true;
          displayStyle = "ssalggnikool";
        };
        SilentMessageToggle = {
          enabled = false;
        };
        SpotifyControls = {
          enabled = false;
        };
        SpotifyCrack = {
          enabled = true;
          noSpotifyAutoPause = true;
          keepSpotifyActivityOnIdle = false;
        };
        SpotifyShareCommands = {
          enabled = false;
        };
        StartupTimings = {
          enabled = false;
        };
        StreamerModeOnStream = {
          enabled = false;
        };
        SuperReactionTweaks = {
          enabled = false;
        };
        TextReplace = {
          enabled = false;
        };
        ThemeAttributes = {
          enabled = false;
        };
        TimeBarAllActivities = {
          enabled = false;
        };
        UnlockedAvatarZoom = {
          enabled = false;
        };
        UnsuppressEmbeds = {
          enabled = false;
        };
        UrbanDictionary = {
          enabled = false;
        };
        USRBG = {
          enabled = false;
        };
        ValidReply = {
          enabled = false;
        };
        VcNarrator = {
          enabled = false;
        };
        VencordToolbox = {
          enabled = false;
        };
        VoiceDownload = {
          enabled = false;
        };
        VoiceMessages = {
          enabled = true;
        };
        WebScreenShareFixes = {
          enabled = true;
        };
        Wikisearch = {
          enabled = false;
        };
        XSOverlay = {
          enabled = false;
        };
        ServerInfo = {
          enabled = true;
        };
        MessageUpdaterAPI = {
          enabled = true;
        };
        AppleMusicRichPresence = {
          enabled = false;
        };
        CopyEmojiMarkdown = {
          enabled = true;
          copyUnicode = true;
        };
        NoOnboardingDelay = {
          enabled = false;
        };
        UserSettingsAPI = {
          enabled = true;
        };
        YoutubeAdblock = {
          enabled = true;
        };
        ConsoleJanitor = {
          enabled = false;
        };
        MentionAvatars = {
          enabled = true;
          showAtSymbol = true;
        };
        NoMaskedUrlPaste = {
          enabled = false;
        };
        AlwaysExpandRoles = {
          enabled = true;
        };
        CopyFileContents = {
          enabled = true;
        };
        StickerPaste = {
          enabled = false;
        };
        VolumeBooster = {
          enabled = true;
          multiplier = 2;
        };
        FullSearchContext = {
          enabled = true;
        };
        AccountPanelServerProfile = {
          enabled = true;
          prioritizeServerProfile = false;
        };
        UserMessagesPronouns = {
          enabled = false;
        };
        DynamicImageModalAPI = {
          enabled = true;
        };
        FixImagesQuality = {
          enabled = true;
        };
        HideMedia = {
          enabled = false;
        };
        FullUserInChatbox = {
          enabled = false;
        };
        IrcColors = {
          enabled = false;
        };
        DisableDeepLinks = {
          enabled = true;
        };
        ExpressionCloner = {
          enabled = true;
        };
        CopyStickerLinks = {
          enabled = false;
        };
        ImageFilename = {
          enabled = false;
        };
      };
      themeLinks =
        let
          inherit (osConfig.scheme) slug;
        in
        if slug == "nord" then
          [ "https://raw.githubusercontent.com/orblazer/discord-nordic/master/nordic.vencord.css" ]
        else if slug == "kanagawa" then
          [ "https://raw.githubusercontent.com/ardishco-the-great/KanagawaGTK-for-discord/main/theme.css" ]
        else
          [ ];
      transparent = false;
      useQuickCss = false;
      winCtrlQ = false;
      winNativeTitleBar = false;
      cloud = {
        authenticated = false;
        url = "https://api.vencord.dev/";
        settingsSync = false;
        settingsSyncVersion = 1761696607889;
      };
      eagerPatches = false;
    };
    "vesktop/settings.json".text = builtins.toJSON {
      discordBranch = "stable";
      hardwareAcceleration = true;
      hardwareVideoAcceleration = true;
      minimizeToTray = "on";
      splashBackground = "rgb(64, 72, 89)";
      splashColor = "rgb(210, 214, 224)";
      splashTheming = true;
      tray = true;
      trayBadge = true;
      checkUpdates = false;
      spellCheckLanguages = [
        "en-US"
        "en"
      ];
      arRPC = true;
      trayMainOverride = true;
      clickTrayToShowHide = true;
      trayAutoFill = "auto";
      trayColorType = "default";
      enableSplashScreen = false;
    };
  };
}
