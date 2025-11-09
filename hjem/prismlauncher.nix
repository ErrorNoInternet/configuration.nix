{
  lib,
  osConfig,
  pkgs,
  ...
}:
{
  xdg.data.files = lib.mkIf osConfig.gaming.enable {
    "PrismLauncher/prismlauncher.cfg".text = lib.generators.toINI { } {
      General = {
        ApplicationTheme = "system";
        AutoCloseConsole = false;
        AutomaticJavaDownload = false;
        AutomaticJavaSwitch = true;
        BackgroundCat = "rory";
        CatOpacity = 100;
        CloseAfterLaunch = true;
        ConfigVersion = 1.2;
        ConsoleFont = osConfig.fonts.preferred;
        ConsoleFontSize = osConfig.fonts.preferredSize;
        ConsoleMaxLines = 100000;
        ConsoleOverflowStop = true;
        CustomGLFWPath = "";
        CustomOpenALPath = "";
        DownloadsDirWatchRecursive = false;
        EnableFeralGamemode = false;
        EnableMangoHud = false;
        FlameKeyOverride = "";
        IconTheme = "pe_colored";
        IgnoreJavaCompatibility = false;
        IgnoreJavaWizard = false;
        JavaDir = "java";
        JavaPath = "${pkgs.openjdk21}/bin/java";
        JProfilerPath = "";
        JsonEditor = "";
        JVisualVMPath = "";
        JvmArgs = "";
        Language = "en_US";
        LastHostname = "zenith";
        LaunchMaximized = false;
        MaxMemAlloc = 4096;
        MCEditPath = "";
        MenuBarInsteadOfToolBar = false;
        MetaURLOverride = "";
        MinecraftWinHeight = 480;
        MinecraftWinWidth = 854;
        MinMemAlloc = 512;
        ModDependenciesDisabled = false;
        ModMetadataDisabled = false;
        ModrinthToken = "";
        MSAClientIDOverride = "";
        NumberOfConcurrentDownloads = 6;
        NumberOfConcurrentTasks = 10;
        NumberOfManualRetries = 1;
        OnlineFixes = true;
        PastebinCustomAPIBase = "";
        PastebinType = 3;
        PermGen = 128;
        PostExitCommand = "";
        PreLaunchCommand = "";
        ProxyAddr = "127.0.0.1";
        ProxyPass = "";
        ProxyPort = 8080;
        ProxyType = "None";
        ProxyUser = "";
        QuitAfterGameStop = false;
        RecordGameTime = true;
        RequestTimeout = 60;
        ShowConsole = false;
        ShowConsoleOnError = true;
        ShowGameTime = true;
        ShowGameTimeWithoutDays = true;
        ShowGlobalGameTime = true;
        SkipModpackUpdatePrompt = false;
        StatusBarVisible = true;
        TechnicClientID = "";
        ToolbarsLocked = false;
        UseDiscreteGpu = true;
        UseNativeGLFW = false;
        UseNativeOpenAL = false;
        UserAgentOverride = "";
        UserAskedAboutAutomaticJavaDownload = true;
        UseZink = false;
        WrapperCommand = "";

        CentralModsDir = "/home/error/games/minecraft/mods";
        DownloadsDir = "/home/error/downloads";
        IconsDir = "/home/error/games/minecraft/icons";
        InstanceDir = "/home/error/games/minecraft/instances";
        SkinsDir = "/home/error/games/minecraft/skins";
      };
    };
  };
}
