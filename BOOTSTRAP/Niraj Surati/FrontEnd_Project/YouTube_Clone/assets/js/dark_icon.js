$(document).ready(function(){

    // YouTube-TV Logo
    $("#YouTube-TV-logo").empty();
    let YouTube_TV_logo = $("<img />").attr({
        "alt":"YouTube-TV-logo",
        "src":"assets/icons/common/YouTube-TV.svg"
    });
    $("#YouTube-TV-logo").append(YouTube_TV_logo);

    // YouTube-Music-logo
    $("#YouTube-Music-logo").empty();
    let YouTube_Music_logo = $("<img />").attr({
        "alt":"YouTube-Music-logo",
        "src":"assets/icons/common/YouTube-Music.svg"
    });
    $("#YouTube-Music-logo").append(YouTube_Music_logo);

    // YouTube-Kids Logo
    $("#YouTube-Kids-logo").empty();
    let YouTube_Kids_logo = $("<img />").attr({
        "alt":"YouTube-Kids-logo",
        "src":"assets/icons/common/YouTube-Kids.svg"
    });
    $("#YouTube-Kids-logo").append(YouTube_Kids_logo);

    // YouTube-Play Logo
    $(".YouTube-Play-logo").empty();
    let YouTube_Play_logo = $("<img />").attr({
        "alt":"YouTube-Play-logo",
        "src":"assets/icons/common/YouTube-Button.svg"
    });
    $(".YouTube-Play-logo").append(YouTube_Play_logo);

    // sub-profile-img
    $(".sub-profile-img").empty();
    let sub_profile_img = $("<img />").attr({
        "alt":"sub-profile-img",
        "src":"assets/img/dabi.jpg"
    }).addClass("rounded-circle");
    $(".sub-profile-img").append(sub_profile_img);
});


// Dark Theme
function DarkTheme(){
    $(function(){
        // YouTube Logo
        $("#youTubeLogo").empty();
        let yLogo_img = $("<img />").attr({
            "alt":"Youtube-logo",
            "src":"assets/icons/dark/YouTube.svg"
        }).addClass("logo-img");
        $("#youTubeLogo").append(yLogo_img);

        // bars
        $("#barsIconButton").empty();
        let bars_img = $("<img />").attr({
            "alt":"bars",
            "src":"assets/icons/dark/bars.svg"
        }).addClass("icon-item");
        $("#barsIconButton").append(bars_img);
        
        // mic
        $("#micIconButton").empty();
        let mic_img = $("<img />").attr({
            "alt":"mic",
            "src":"assets/icons/dark/mic.svg"
        }).addClass("icon-item");
        $("#micIconButton").append(mic_img);
        
        // search
        $("#searchIconButton").empty();
        let search_img = $("<img />").attr({
            "alt":"search",
            "src":"assets/icons/dark/search.svg"
        }).addClass("icon-item");
        $("#searchIconButton").append(search_img);

        // search mobile
        $("#mSearchIconButton").empty();
        let mSearch_img = $("<img />").attr({
            "alt":"search",
            "src":"assets/icons/dark/search.svg"
        }).addClass("icon-item");
        $("#mSearchIconButton").append(mSearch_img);

        // video create
        $("#videoIconButton").empty();
        let video_img = $("<img />").attr({
            "alt":"video",
            "src":"assets/icons/dark/video.svg"
        }).addClass("icon-item");
        $("#videoIconButton").append(video_img);

        // menu
        $("#menuIconButton").empty();
        let menu_img = $("<img />").attr({
            "alt":"menu",
            "src":"assets/icons/dark/menu.svg"
        }).addClass("icon-item");
        $("#menuIconButton").append(menu_img);

        // bell
        $("#bellIconButton").empty();
        let bell_img = $("<img />").attr({
            "alt":"bell",
            "src":"assets/icons/dark/bell.svg"
        }).addClass("icon-item");
        $("#bellIconButton").append(bell_img);

        // right-arrow
        $(".link-dropdown-logo").empty();
        let right_arrow_img = $("<img />").attr({
            "alt":"right arrow",
            "src":"assets/icons/dark/right-arrow.svg"
        });
        $(".link-dropdown-logo").append(right_arrow_img);

        // profile-logo
        $("#profile-logo").empty();
        let profile_logo = $("<img />").attr({
            "alt":"profile",
            "src":"assets/icons/dark/profile.svg"
        });
        $("#profile-logo").append(profile_logo);

        // money-logo
        $("#money-logo").empty();
        let money_logo = $("<img />").attr({
            "alt":"dollar",
            "src":"assets/icons/dark/dollar.svg"
        });
        $("#money-logo").append(money_logo);

        // setting-logo
        $("#setting-logo").empty();
        let setting_logo= $("<img />").attr({
            "alt":"setting",
            "src":"assets/icons/dark/setting.svg"
        });
        $("#setting-logo").append(setting_logo);

        // profile-1-logo
        $("#profile-1-logo").empty();
        let profile_1_logo= $("<img />").attr({
            "alt":"profile-1",
            "src":"assets/icons/dark/profile-1.svg"
        });
        $("#profile-1-logo").append(profile_1_logo);

        // exit-logo
        $("#exit-logo").empty();
        let exit_logo= $("<img />").attr({
            "alt":"exit",
            "src":"assets/icons/dark/exit.svg"
        });
        $("#exit-logo").append(exit_logo);

        // moon-logo
        $("#moon-logo").empty();
        let moon_logo= $("<img />").attr({
            "alt":"moon",
            "src":"assets/icons/dark/moon.svg"
        });
        $("#moon-logo").append(moon_logo);

        // translate-logo
        $("#translate-logo").empty();
        let translate_logo= $("<img />").attr({
            "alt":"translate",
            "src":"assets/icons/dark/translate.svg"
        });
        $("#translate-logo").append(translate_logo);

        // web-logo
        $("#web-logo").empty();
        let web_logo= $("<img />").attr({
            "alt":"web",
            "src":"assets/icons/dark/web.svg"
        });
        $("#web-logo").append(web_logo);

        // settings-logo
        $("#settings-logo").empty();
        let settings_logo= $("<img />").attr({
            "alt":"settings",
            "src":"assets/icons/dark/settings.svg"
        });
        $("#settings-logo").append(settings_logo);

        // shield-logo
        $("#shield-logo").empty();
        let shield_logo= $("<img />").attr({
            "alt":"shield",
            "src":"assets/icons/dark/shield.svg"
        });
        $("#shield-logo").append(shield_logo);

        // question-mark-logo
        $("#question-mark-logo").empty();
        let question_mark_logo= $("<img />").attr({
            "alt":"question-mark",
            "src":"assets/icons/dark/question-mark.svg"
        });
        $("#question-mark-logo").append(question_mark_logo);

        // exclamation-mark-logo
        $("#exclamation-mark-logo").empty();
        let exclamation_mark_logo= $("<img />").attr({
            "alt":"question-mark",
            "src":"assets/icons/dark/exclamation-mark.svg"
        });
        $("#exclamation-mark-logo").append(exclamation_mark_logo);

        // keyboard-logo
        $("#keyboard-logo").empty();
        let keyboard_logo= $("<img />").attr({
            "alt":"keyboard",
            "src":"assets/icons/dark/keyboard.svg"
        });
        $("#keyboard-logo").append(keyboard_logo);

        // play-logo
        $("#play-logo").empty();
        let play_logo= $("<img />").attr({
            "alt":"play",
            "src":"assets/icons/dark/play.svg"
        });
        $("#play-logo").append(play_logo);

        // live-logo
        $("#live-logo").empty();
        let live_logo= $("<img />").attr({
            "alt":"live",
            "src":"assets/icons/dark/live.svg"
        });
        $("#live-logo").append(live_logo);

        // home-logo
        $("#home-logo").empty();
        let home_logo= $("<img />").attr({
            "alt":"home",
            "src":"assets/icons/dark/home.svg"
        });
        $("#home-logo").append(home_logo);

        // explore-logo
        $("#explore-logo").empty();
        let explore_logo= $("<img />").attr({
            "alt":"explore",
            "src":"assets/icons/dark/explore.svg"
        });
        $("#explore-logo").append(explore_logo);

        // subscriptions-logo
        $("#subscriptions-logo").empty();
        let subscriptions_logo= $("<img />").attr({
            "alt":"subscriptions",
            "src":"assets/icons/dark/subscriptions.svg"
        });
        $("#subscriptions-logo").append(subscriptions_logo);

        // library-logo
        $("#library-logo").empty();
        let library_logo= $("<img />").attr({
            "alt":"library",
            "src":"assets/icons/dark/library.svg"
        });
        $("#library-logo").append(library_logo);

        // history-logo
        $("#history-logo").empty();
        let history_logo= $("<img />").attr({
            "alt":"history",
            "src":"assets/icons/dark/history.svg"
        });
        $("#history-logo").append(history_logo);

        // your-videos-logo
        $("#your-videos-logo").empty();
        let your_videos_logo= $("<img />").attr({
            "alt":"your-videos",
            "src":"assets/icons/dark/your-videos.svg"
        });
        $("#your-videos-logo").append(your_videos_logo);

        // watch-later-logo
        $("#watch-later-logo").empty();
        let watch_later_logo= $("<img />").attr({
            "alt":"watch-later",
            "src":"assets/icons/dark/watch-later.svg"
        });
        $("#watch-later-logo").append(watch_later_logo);

        // liked-videos-logo
        $("#liked-videos-logo").empty();
        let liked_videos_logo= $("<img />").attr({
            "alt":"liked-videos",
            "src":"assets/icons/dark/liked-videos.svg"
        });
        $("#liked-videos-logo").append(liked_videos_logo);

        // down-arrow-logo
        $(".down-arrow-logo").empty();
        let down_arrow_logo= $("<img />").attr({
            "alt":"down-arrow-logo",
            "src":"assets/icons/dark/down-arrow.svg"
        });
        $(".down-arrow-logo").append(down_arrow_logo);

        // premium-logo
        $("#premium-logo").empty();
        let premium_logo= $("<img />").attr({
            "alt":"premium-logo",
            "src":"assets/icons/dark/premium.svg"
        });
        $("#premium-logo").append(premium_logo);

        // films-logo
        $("#films-logo").empty();
        let films_logo= $("<img />").attr({
            "alt":"films-logo",
            "src":"assets/icons/dark/films.svg"
        });
        $("#films-logo").append(films_logo);

        // gaming-logo
        $("#gaming-logo").empty();
        let gaming_logo= $("<img />").attr({
            "alt":"gaming-logo",
            "src":"assets/icons/dark/gaming.svg"
        });
        $("#gaming-logo").append(gaming_logo);

        // live-s-logo
        $("#live-s-logo").empty();
        let live_s_logo= $("<img />").attr({
            "alt":"live-s-logo",
            "src":"assets/icons/dark/live.svg"
        });
        $("#live-s-logo").append(live_s_logo);

        // fashion-logo
        $("#fashion-logo").empty();
        let fashion_logo= $("<img />").attr({
            "alt":"fashion-logo",
            "src":"assets/icons/dark/fashion.svg"
        });
        $("#fashion-logo").append(fashion_logo);

        // bulb-logo
        $("#bulb-logo").empty();
        let bulb_logo= $("<img />").attr({
            "alt":"bulb-logo",
            "src":"assets/icons/dark/bulb.svg"
        });
        $("#bulb-logo").append(bulb_logo);

        // sport-logo
        $("#sport-logo").empty();
        let sport_logo= $("<img />").attr({
            "alt":"sport-logo",
            "src":"assets/icons/dark/sport.svg"
        });
        $("#sport-logo").append(sport_logo);

        // settings-s-logo
        $("#settings-s-logo").empty();
        let settings_s_logo= $("<img />").attr({
            "alt":"settings-s-logo",
            "src":"assets/icons/dark/settings.svg"
        });
        $("#settings-s-logo").append(settings_s_logo);

        // report-logo
        $("#report-logo").empty();
        let report_logo= $("<img />").attr({
            "alt":"report-logo",
            "src":"assets/icons/dark/flag.svg"
        });
        $("#report-logo").append(report_logo);

        // help-logo
        $("#help-logo").empty();
        let help_logo= $("<img />").attr({
            "alt":"help-logo",
            "src":"assets/icons/dark/question-mark.svg"
        });
        $("#help-logo").append(help_logo);

        // sport-logo
        $("#send-feedback-logo").empty();
        let send_feedback_logo= $("<img />").attr({
            "alt":"send-feedback-logo",
            "src":"assets/icons/dark/exclamation-mark.svg"
        });
        $("#send-feedback-logo").append(send_feedback_logo);
    });
}

// Light Theme

function LightTheme(){
    $(function(){
        // YouTube Logo
        $("#youTubeLogo").empty();
        let yLogo_img = $("<img />").attr({
            "alt":"Youtube-logo",
            "src":"assets/icons/light/YouTube.svg"
        }).addClass("logo-img");
        $("#youTubeLogo").append(yLogo_img);

        // bars
        $("#barsIconButton").empty();
        let bars_img = $("<img />").attr({
            "alt":"bars",
            "src":"assets/icons/light/bars.svg"
        }).addClass("icon-item");
        $("#barsIconButton").append(bars_img);
        
        // mic
        $("#micIconButton").empty();
        let mic_img = $("<img />").attr({
            "alt":"mic",
            "src":"assets/icons/light/mic.svg"
        }).addClass("icon-item");
        $("#micIconButton").append(mic_img);

        // search
        $("#searchIconButton").empty();
        let search_img = $("<img />").attr({
            "alt":"search",
            "src":"assets/icons/light/search.svg"
        }).addClass("icon-item");
        $("#searchIconButton").append(search_img);

        // search mobile
        $("#mSearchIconButton").empty();
        let mSearch_img = $("<img />").attr({
            "alt":"search",
            "src":"assets/icons/light/search.svg"
        }).addClass("icon-item");
        $("#mSearchIconButton").append(mSearch_img);

        // video create
        $("#videoIconButton").empty();
        let video_img = $("<img />").attr({
            "alt":"video",
            "src":"assets/icons/light/video.svg"
        }).addClass("icon-item");
        $("#videoIconButton").append(video_img);

        // menu
        $("#menuIconButton").empty();
        let menu_img = $("<img />").attr({
            "alt":"menu",
            "src":"assets/icons/light/menu.svg"
        }).addClass("icon-item");
        $("#menuIconButton").append(menu_img);

        // bell
        $("#bellIconButton").empty();
        let bell_img = $("<img />").attr({
            "alt":"bell",
            "src":"assets/icons/light/bell.svg"
        }).addClass("icon-item");
        $("#bellIconButton").append(bell_img);

        // right-arrow
        $(".link-dropdown-logo").empty();
        let right_arrow_img = $("<img />").attr({
            "alt":"right arrow",
            "src":"assets/icons/light/right-arrow.svg"
        });
        $(".link-dropdown-logo").append(right_arrow_img);

        // profile-logo
        $("#profile-logo").empty();
        let profile_logo = $("<img />").attr({
            "alt":"profile",
            "src":"assets/icons/light/profile.svg"
        });
        $("#profile-logo").append(profile_logo);

        // money-logo
        $("#money-logo").empty();
        let money_logo = $("<img />").attr({
            "alt":"dollar",
            "src":"assets/icons/light/dollar.svg"
        });
        $("#money-logo").append(money_logo);

        // setting-logo
        $("#setting-logo").empty();
        let setting_logo= $("<img />").attr({
            "alt":"setting",
            "src":"assets/icons/light/setting.svg"
        });
        $("#setting-logo").append(setting_logo);

        // profile-1-logo
        $("#profile-1-logo").empty();
        let profile_1_logo= $("<img />").attr({
            "alt":"profile-1",
            "src":"assets/icons/light/profile-1.svg"
        });
        $("#profile-1-logo").append(profile_1_logo);

        // exit-logo
        $("#exit-logo").empty();
        let exit_logo= $("<img />").attr({
            "alt":"exit",
            "src":"assets/icons/light/exit.svg"
        });
        $("#exit-logo").append(exit_logo);

        // moon-logo
        $("#moon-logo").empty();
        let moon_logo= $("<img />").attr({
            "alt":"moon",
            "src":"assets/icons/light/moon.svg"
        });
        $("#moon-logo").append(moon_logo);

        // translate-logo
        $("#translate-logo").empty();
        let translate_logo= $("<img />").attr({
            "alt":"translate",
            "src":"assets/icons/light/translate.svg"
        });
        $("#translate-logo").append(translate_logo);

        // web-logo
        $("#web-logo").empty();
        let web_logo= $("<img />").attr({
            "alt":"web",
            "src":"assets/icons/light/web.svg"
        });
        $("#web-logo").append(web_logo);

        // settings-logo
        $("#settings-logo").empty();
        let settings_logo= $("<img />").attr({
            "alt":"settings",
            "src":"assets/icons/light/settings.svg"
        });
        $("#settings-logo").append(settings_logo);

        // shield-logo
        $("#shield-logo").empty();
        let shield_logo= $("<img />").attr({
            "alt":"shield",
            "src":"assets/icons/light/shield.svg"
        });
        $("#shield-logo").append(shield_logo);

        // question-mark-logo
        $("#question-mark-logo").empty();
        let question_mark_logo= $("<img />").attr({
            "alt":"question-mark",
            "src":"assets/icons/light/question-mark.svg"
        });
        $("#question-mark-logo").append(question_mark_logo);

        // exclamation-mark-logo
        $("#exclamation-mark-logo").empty();
        let exclamation_mark_logo= $("<img />").attr({
            "alt":"question-mark",
            "src":"assets/icons/light/exclamation-mark.svg"
        });
        $("#exclamation-mark-logo").append(exclamation_mark_logo);

        // keyboard-logo
        $("#keyboard-logo").empty();
        let keyboard_logo= $("<img />").attr({
            "alt":"keyboard",
            "src":"assets/icons/light/keyboard.svg"
        });
        $("#keyboard-logo").append(keyboard_logo);

        // play-logo
        $("#play-logo").empty();
        let play_logo= $("<img />").attr({
            "alt":"play",
            "src":"assets/icons/light/play.svg"
        });
        $("#play-logo").append(play_logo);

        // live-logo
        $("#live-logo").empty();
        let live_logo= $("<img />").attr({
            "alt":"live",
            "src":"assets/icons/light/live.svg"
        });
        $("#live-logo").append(live_logo);

        // home-logo
        $("#home-logo").empty();
        let home_logo= $("<img />").attr({
            "alt":"home",
            "src":"assets/icons/light/home.svg"
        });
        $("#home-logo").append(home_logo);

        // explore-logo
        $("#explore-logo").empty();
        let explore_logo= $("<img />").attr({
            "alt":"explore",
            "src":"assets/icons/light/explore.svg"
        });
        $("#explore-logo").append(explore_logo);

        // subscriptions-logo
        $("#subscriptions-logo").empty();
        let subscriptions_logo= $("<img />").attr({
            "alt":"subscriptions",
            "src":"assets/icons/light/subscriptions.svg"
        });
        $("#subscriptions-logo").append(subscriptions_logo);

        // library-logo
        $("#library-logo").empty();
        let library_logo= $("<img />").attr({
            "alt":"library",
            "src":"assets/icons/light/library.svg"
        });
        $("#library-logo").append(library_logo);

        // history-logo
        $("#history-logo").empty();
        let history_logo= $("<img />").attr({
            "alt":"history",
            "src":"assets/icons/light/history.svg"
        });
        $("#history-logo").append(history_logo);

        // your-videos-logo
        $("#your-videos-logo").empty();
        let your_videos_logo= $("<img />").attr({
            "alt":"your-videos",
            "src":"assets/icons/light/your-videos.svg"
        });
        $("#your-videos-logo").append(your_videos_logo);

        // watch-later-logo
        $("#watch-later-logo").empty();
        let watch_later_logo= $("<img />").attr({
            "alt":"watch-later",
            "src":"assets/icons/light/watch-later.svg"
        });
        $("#watch-later-logo").append(watch_later_logo);

        // liked-videos-logo
        $("#liked-videos-logo").empty();
        let liked_videos_logo= $("<img />").attr({
            "alt":"liked-videos",
            "src":"assets/icons/light/liked-videos.svg"
        });
        $("#liked-videos-logo").append(liked_videos_logo);

        // down-arrow-logo
        $(".down-arrow-logo").empty();
        let down_arrow_logo= $("<img />").attr({
            "alt":"down-arrow-logo",
            "src":"assets/icons/light/down-arrow.svg"
        });
        $(".down-arrow-logo").append(down_arrow_logo);

        // premium-logo
        $("#premium-logo").empty();
        let premium_logo= $("<img />").attr({
            "alt":"premium-logo",
            "src":"assets/icons/light/premium.svg"
        });
        $("#premium-logo").append(premium_logo);

        // films-logo
        $("#films-logo").empty();
        let films_logo= $("<img />").attr({
            "alt":"films-logo",
            "src":"assets/icons/light/films.svg"
        });
        $("#films-logo").append(films_logo);

        // gaming-logo
        $("#gaming-logo").empty();
        let gaming_logo= $("<img />").attr({
            "alt":"gaming-logo",
            "src":"assets/icons/light/gaming.svg"
        });
        $("#gaming-logo").append(gaming_logo);

        // live-s-logo
        $("#live-s-logo").empty();
        let live_s_logo= $("<img />").attr({
            "alt":"live-s-logo",
            "src":"assets/icons/light/live.svg"
        });
        $("#live-s-logo").append(live_s_logo);

        // fashion-logo
        $("#fashion-logo").empty();
        let fashion_logo= $("<img />").attr({
            "alt":"fashion-logo",
            "src":"assets/icons/light/fashion.svg"
        });
        $("#fashion-logo").append(fashion_logo);

        // bulb-logo
        $("#bulb-logo").empty();
        let bulb_logo= $("<img />").attr({
            "alt":"bulb-logo",
            "src":"assets/icons/light/bulb.svg"
        });
        $("#bulb-logo").append(bulb_logo);

        // sport-logo
        $("#sport-logo").empty();
        let sport_logo= $("<img />").attr({
            "alt":"sport-logo",
            "src":"assets/icons/light/sport.svg"
        });
        $("#sport-logo").append(sport_logo);

        // settings-s-logo
        $("#settings-s-logo").empty();
        let settings_s_logo= $("<img />").attr({
            "alt":"settings-s-logo",
            "src":"assets/icons/light/settings.svg"
        });
        $("#settings-s-logo").append(settings_s_logo);

        // report-logo
        $("#report-logo").empty();
        let report_logo= $("<img />").attr({
            "alt":"report-logo",
            "src":"assets/icons/light/flag.svg"
        });
        $("#report-logo").append(report_logo);

        // help-logo
        $("#help-logo").empty();
        let help_logo= $("<img />").attr({
            "alt":"help-logo",
            "src":"assets/icons/light/question-mark.svg"
        });
        $("#help-logo").append(help_logo);

        // sport-logo
        $("#send-feedback-logo").empty();
        let send_feedback_logo= $("<img />").attr({
            "alt":"send-feedback-logo",
            "src":"assets/icons/light/exclamation-mark.svg"
        });
        $("#send-feedback-logo").append(send_feedback_logo);
    });
}