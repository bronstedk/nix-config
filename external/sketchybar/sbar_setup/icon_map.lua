function icon_map(appName)
    local icon_result = {}

    for _, key in ipairs({ "Keynote", "Keynote 讲演" }) do
        icon_result[key] = ":keynote:"
    end
    icon_result["Figma"]           = ":figma:"
    icon_result["VMware Fusion"]   = ":vmware_fusion:"
    for _, key in ipairs({ "Alacritty", "Hyper", "iTerm2", "kitty", "Terminal", "终端", "WezTerm" }) do
        icon_result[key] = ":terminal:"
    end
    for _, key in ipairs({ "Microsoft To Do", "Things" }) do
        icon_result[key] = ":things:"
    end
    icon_result["Keyboard Maestro"]   = ":keyboard_maestro:"
    icon_result["App Store"]          = ":app_store:"
    icon_result["CleanMyMac X"]       = ":desktop:"
    icon_result["Android Messages"]   = ":android_messages:"
    icon_result["Reeder"]             = ":reeder5:"
    icon_result["Joplin"]             = ":joplin:"
    for _, key in ipairs({ "Discord", "Discord Canary", "Discord PTB" }) do
        icon_result[key] = ":discord:"
    end
    icon_result["Logseq"] = ":logseq:"
    icon_result["Microsoft Excel"] = ":microsoft_excel:"
    icon_result["Microsoft PowerPoint"] = ":microsoft_power_point:"
    icon_result["Telegram"] = ":telegram:"
    icon_result["Transmit"] = ":transmit:"
    icon_result["Pi-hole Remote"] = ":pihole:"
    icon_result["League of Legends"] = ":league_of_legends:"
    icon_result["Element"] = ":element:"
    icon_result["Zulip"] = ":zulip:"
    icon_result["Sequel Ace"] = ":sequel_ace:"
    icon_result["Zed"] = ":zed:"
    icon_result["TeamSpeak 3"] = ":team_speak:"
    icon_result["1Password"] = ":one_password:"
    icon_result["Caprine"] = ":caprine:"
    icon_result["카카오톡"] = ":kakaotalk:"
    icon_result["Dropbox"] = ":dropbox:"
    icon_result["Kakoune"] = ":kakoune:"
    for _, key in ipairs({ "Rider", "JetBrains Rider" }) do
        icon_result[key] = ":rider:"
    end
    icon_result["Godot"]         = ":godot:"
    icon_result["qutebrowser"]   = ":qute_browser:"
    icon_result["Typora"]        = ":text:"
    icon_result["Sequel Pro"]    = ":sequel_pro:"
    for _, key in ipairs({ "Reminders", "提醒事项" }) do
        icon_result[key] = ":reminders:"
    end
    icon_result["Setapp"] = ":setapp:"
    for _, key in ipairs({ "Finder", "访达" }) do
        icon_result[key] = ":finder:"
    end
    icon_result["Matlab"]      = ":matlab:"
    icon_result["LibreWolf"]   = ":libre_wolf:"
    for _, key in ipairs({ "Notes", "备忘录" }) do
        icon_result[key] = ":notes:"
    end
    icon_result["Notion"]                  = ":notion:"
    icon_result["Brave Browser"]           = ":brave_browser:"
    icon_result["Spotlight"]               = ":spotlight:"
    icon_result["Iris"]                    = ":iris:"
    icon_result["Tower"]                   = ":tower:"
    icon_result["Jellyfin Media Player"]   = ":jellyfin:"
    for _, key in ipairs({ "Code", "Code - Insiders" }) do
        icon_result[key] = ":code:"
    end
    icon_result["Linear"]              = ":linear:"
    icon_result["Live"]                = ":ableton:"
    icon_result["Parallels Desktop"]   = ":parallels:"
    icon_result["Final Cut Pro"]       = ":final_cut_pro:"
    for _, key in ipairs({ "Chromium", "Google Chrome", "Google Chrome Canary" }) do
        icon_result[key] = ":google_chrome:"
    end
    icon_result["GitHub Desktop"]   = ":git_hub:"
    icon_result["Firefox"]          = ":firefox:"
    icon_result["Slack"]            = ":slack:"
    icon_result["Spotify"]          = ":spotify:"
    for _, key in ipairs({ "Neovide", "MacVim", "Vim", "VimR" }) do
        icon_result[key] = ":vim:"
    end
    icon_result["KeePassXC"]      = ":kee_pass_x_c:"
    icon_result["PomoDone App"]   = ":pomodone:"
    icon_result["DEVONthink 3"]   = ":devonthink3:"
    for _, key in ipairs({ "Color Picker", "数码测色计" }) do
        icon_result[key] = ":color_picker:"
    end
    for _, key in ipairs({ "Tweetbot", "Twitter" }) do
        icon_result[key] = ":twitter:"
    end
    icon_result["Default"] = ":default:"
    for _, key in ipairs({ "Pages", "Pages 文稿" }) do
        icon_result[key] = ":pages:"
    end
    icon_result["Emacs"] = ":emacs:"
    for _, key in ipairs({ "MAMP", "MAMP PRO" }) do
        icon_result[key] = ":mamp:"
    end
    for _, key in ipairs({ "Canary Mail", "HEY", "Mail", "Mailspring", "MailMate", "邮件" }) do
        icon_result[key] = ":mail:"
    end
    icon_result["WebStorm"]   = ":web_storm:"
    icon_result["TickTick"]   = ":tick_tick:"
    icon_result["TIDAL"]      = ":tidal:"
    icon_result["VLC"]        = ":vlc:"
    icon_result["Blender"]    = ":blender:"
    for _, key in ipairs({ "Music", "音乐" }) do
        icon_result[key] = ":music:"
    end
    for _, key in ipairs({ "Calendar", "日历", "Fantastical", "Cron", "Amie" }) do
        icon_result[key] = ":calendar:"
    end
    icon_result["Evernote Legacy"]   = ":evernote_legacy:"
    icon_result["Microsoft Word"]    = ":microsoft_word:"
    for _, key in ipairs({ "Safari", "Safari浏览器", "Safari Technology Preview" }) do
        icon_result[key] = ":safari:"
    end
    icon_result["MoneyMoney"]   = ":bank:"
    icon_result["Xcode"]        = ":xcode:"
    for _, key in ipairs({ "Numbers", "Numbers 表格" }) do
        icon_result[key] = ":numbers:"
    end
    icon_result["ClickUp"] = ":click_up:"
    icon_result["Arc"] = ":arc:"
    icon_result["Zeplin"] = ":zeplin:"
    icon_result["Trello"] = ":trello:"
    icon_result["Vivaldi"] = ":vivaldi:"
    icon_result["Calibre"] = ":book:"
    icon_result["Min"] = ":min_browser:"
    icon_result["网易云音乐"] = ":netease_music:"
    for _, key in ipairs({ "GrandTotal", "Receipts" }) do
        icon_result[key] = ":dollar:"
    end
    icon_result["zoom.us"] = ":zoom:"
    icon_result["Folx"] = ":folx:"
    icon_result["微信"] = ":wechat:"
    for _, key in ipairs({ "Orion", "Orion RC" }) do
        icon_result[key] = ":orion:"
    end
    icon_result["Notability"]    = ":notability:"
    icon_result["Todoist"]       = ":todoist:"
    icon_result["Replit"]        = ":replit:"
    icon_result["Tor Browser"]   = ":tor_browser:"
    icon_result["Drafts"]        = ":drafts:"
    for _, key in ipairs({ "Preview", "预览", "Skim", "zathura" }) do
        icon_result[key] = ":pdf:"
    end
    icon_result["PyCharm"]    = ":pycharm:"
    icon_result["Audacity"]   = ":audacity:"
    icon_result["Cypress"]    = ":cypress:"
    icon_result["VSCodium"]   = ":vscodium:"
    for _, key in ipairs({ "Podcasts", "播客" }) do
        icon_result[key] = ":podcasts:"
    end
    for _, key in ipairs({ "DingTalk", "钉钉", "阿里钉" }) do
        icon_result[key] = ":dingtalk:"
    end
    icon_result["OBS"] = ":obsstudio:"
    for _, key in ipairs({ "Firefox Developer Edition", "Firefox Nightly" }) do
        icon_result[key] = ":firefox_developer_edition:"
    end
    icon_result["Alfred"]          = ":alfred:"
    icon_result["OmniFocus"]       = ":omni_focus:"
    icon_result["Skype"]           = ":skype:"
    icon_result["Spark Desktop"]   = ":spark:"
    for _, key in ipairs({ "Docker", "Docker Desktop" }) do
        icon_result[key] = ":docker:"
    end
    icon_result["Signal"]               = ":signal:"
    icon_result["Pine"]                 = ":pine:"
    icon_result["Insomnia"]             = ":insomnia:"
    icon_result["Microsoft Edge"]       = ":microsoft_edge:"
    icon_result["Affinity Photo"]       = ":affinity_photo:"
    icon_result["Sketch"]               = ":sketch:"
    icon_result["Android Studio"]       = ":android_studio:"
    icon_result["Bitwarden"]            = ":bit_warden:"
    icon_result["Affinity Publisher"]   = ":affinity_publisher:"
    icon_result["Zotero"]               = ":zotero:"
    icon_result["Sublime Text"]         = ":sublime_text:"
    icon_result["Warp"]                 = ":warp:"
    for _, key in ipairs({ "Messages", "信息", "Nachrichten" }) do
        icon_result[key] = ":messages:"
    end
    icon_result["Obsidian"]        = ":obsidian:"
    icon_result["IntelliJ IDEA"]   = ":idea:"
    icon_result["Atom"]            = ":atom:"
    for _, key in ipairs({ "FaceTime", "FaceTime 通话" }) do
        icon_result[key] = ":face_time:"
    end
    for _, key in ipairs({ "Yuque", "语雀" }) do
        icon_result[key] = ":yuque:"
    end
    icon_result["Grammarly Editor"]    = ":grammarly:"
    icon_result["Mattermost"]          = ":mattermost:"
    icon_result["Affinity Designer"]   = ":affinity_designer:"
    icon_result["mpv"]                 = ":mpv:"
    icon_result["Thunderbird"]         = ":thunderbird:"
    icon_result["Airmail"]             = ":airmail:"
    icon_result["Microsoft Teams"]     = ":microsoft_teams:"
    icon_result["Bear"]                = ":bear:"
    for _, key in ipairs({ "System Preferences", "System Settings", "系统设置" }) do
        icon_result[key] = ":gear:"
    end
    icon_result["Nova"]       = ":nova:"
    icon_result["WhatsApp"]   = ":whats_app:"

    if icon_result[appName] then
        return icon_result[appName]
    else
        return ":default:"
    end
end
