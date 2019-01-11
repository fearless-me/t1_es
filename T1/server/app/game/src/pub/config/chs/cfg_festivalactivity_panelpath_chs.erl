%% coding: latin-1
%%: 实现
-module(cfg_festivalactivity_panelpath_chs).
-compile(export_all).
-include("cfg_festivalactivity_panelpath.hrl").
-include("logger.hrl").

getRow("Anchor/Offset/ChangeButton/Copy/Background")->
    #festivalactivity_panelpathCfg {
    id = 3,
    path = "SpringTab",
    name = "Anchor/Offset/ChangeButton/Copy/Background"
    };
getRow("Anchor/Offset/ChangeButton/Copy/HighSprite")->
    #festivalactivity_panelpathCfg {
    id = 3,
    path = "SpringTabPress",
    name = "Anchor/Offset/ChangeButton/Copy/HighSprite"
    };
getRow("Anchor/Offset/ChangeButton/Exchange/Background")->
    #festivalactivity_panelpathCfg {
    id = 3,
    path = "SpringTab",
    name = "Anchor/Offset/ChangeButton/Exchange/Background"
    };
getRow("Anchor/Offset/ChangeButton/Exchange/HighSprite")->
    #festivalactivity_panelpathCfg {
    id = 3,
    path = "SpringTabPress",
    name = "Anchor/Offset/ChangeButton/Exchange/HighSprite"
    };
getRow("Anchor/Offset/ChangeButton/Gift/Background")->
    #festivalactivity_panelpathCfg {
    id = 3,
    path = "SpringGiftTab",
    name = "Anchor/Offset/ChangeButton/Gift/Background"
    };
getRow("Anchor/Offset/ChangeButton/Gift/HighSprite")->
    #festivalactivity_panelpathCfg {
    id = 3,
    path = "SpringGiftTabPress",
    name = "Anchor/Offset/ChangeButton/Gift/HighSprite"
    };
getRow("Anchor/Offset/Content/Copy/BossCopy/Btn")->
    #festivalactivity_panelpathCfg {
    id = 3,
    path = "Base_Btn_0_2",
    name = "Anchor/Offset/Content/Copy/BossCopy/Btn"
    };
getRow("Anchor/Offset/Content/Copy/BossCopy/Btn/Sprite")->
    #festivalactivity_panelpathCfg {
    id = 3,
    path = "SpringBossButton",
    name = "Anchor/Offset/Content/Copy/BossCopy/Btn/Sprite"
    };
getRow("Anchor/Offset/Content/Copy/BossCopy/Icon")->
    #festivalactivity_panelpathCfg {
    id = 3,
    path = "item_9680",
    name = "Anchor/Offset/Content/Copy/BossCopy/Icon"
    };
getRow("Anchor/Offset/Content/Copy/CommonCopy/Btn")->
    #festivalactivity_panelpathCfg {
    id = 3,
    path = "Base_Btn_0_2",
    name = "Anchor/Offset/Content/Copy/CommonCopy/Btn"
    };
getRow("Anchor/Offset/Content/Copy/CommonCopy/Icon")->
    #festivalactivity_panelpathCfg {
    id = 3,
    path = "item_9680",
    name = "Anchor/Offset/Content/Copy/CommonCopy/Icon"
    };
getRow("Anchor/Offset/Content/Exchange/Bg")->
    #festivalactivity_panelpathCfg {
    id = 3,
    path = "SpringDiKuang",
    name = "Anchor/Offset/Content/Exchange/Bg"
    };
getRow("Anchor/Offset/Content/Exchange/Clone/Arrow")->
    #festivalactivity_panelpathCfg {
    id = 3,
    path = "SpringArrow",
    name = "Anchor/Offset/Content/Exchange/Clone/Arrow"
    };
getRow("Anchor/Offset/Content/Exchange/Clone/Bg")->
    #festivalactivity_panelpathCfg {
    id = 3,
    path = "SpringListBottom",
    name = "Anchor/Offset/Content/Exchange/Clone/Bg"
    };
getRow("Anchor/Offset/Content/Exchange/Clone/Btn")->
    #festivalactivity_panelpathCfg {
    id = 3,
    path = "Base_Btn_0_3",
    name = "Anchor/Offset/Content/Exchange/Clone/Btn"
    };
getRow("Anchor/Offset/Content/Gift/Buy/Arrow/Clone")->
    #festivalactivity_panelpathCfg {
    id = 3,
    path = "Bg_1",
    name = "Anchor/Offset/Content/Gift/Buy/Arrow/Clone"
    };
getRow("Anchor/Offset/Content/Gift/Buy/Arrow/Clone/active")->
    #festivalactivity_panelpathCfg {
    id = 3,
    path = "Bg_2",
    name = "Anchor/Offset/Content/Gift/Buy/Arrow/Clone/active"
    };
getRow("Anchor/Offset/Content/Gift/Buy/Arrow/Left")->
    #festivalactivity_panelpathCfg {
    id = 3,
    path = "Arrow_1",
    name = "Anchor/Offset/Content/Gift/Buy/Arrow/Left"
    };
getRow("Anchor/Offset/Content/Gift/Buy/Arrow/Right")->
    #festivalactivity_panelpathCfg {
    id = 3,
    path = "Arrow_1",
    name = "Anchor/Offset/Content/Gift/Buy/Arrow/Right"
    };
getRow("Anchor/Offset/Content/Gift/Buy/Btn")->
    #festivalactivity_panelpathCfg {
    id = 3,
    path = "Base_Btn_0_2",
    name = "Anchor/Offset/Content/Gift/Buy/Btn"
    };
getRow("Anchor/Offset/Content/Gift/Buy/Expend/Icon")->
    #festivalactivity_panelpathCfg {
    id = 3,
    path = "Diamond",
    name = "Anchor/Offset/Content/Gift/Buy/Expend/Icon"
    };
getRow("Anchor/Offset/Content/Gift/Texture")->
    #festivalactivity_panelpathCfg {
    id = 3,
    path = "Base_Bg_139",
    name = "Anchor/Offset/Content/Gift/Texture"
    };
getRow("Anchor/Offset/Static/CloseButton")->
    #festivalactivity_panelpathCfg {
    id = 3,
    path = "SpringClose",
    name = "Anchor/Offset/Static/CloseButton"
    };
getRow("Anchor/Offset/Static/Icon")->
    #festivalactivity_panelpathCfg {
    id = 3,
    path = "Diamond",
    name = "Anchor/Offset/Static/Icon"
    };
getRow("Anchor/Offset/Static/Icon/Sprite")->
    #festivalactivity_panelpathCfg {
    id = 3,
    path = "SpringNumBottom",
    name = "Anchor/Offset/Static/Icon/Sprite"
    };
getRow("Anchor/Offset/Static/Mask")->
    #festivalactivity_panelpathCfg {
    id = 3,
    path = "Base_Bg4_7",
    name = "Anchor/Offset/Static/Mask"
    };
getRow(_)->[].

getKeyList()->[
    {"Anchor/Offset/ChangeButton/Copy/Background"},
    {"Anchor/Offset/ChangeButton/Copy/HighSprite"},
    {"Anchor/Offset/ChangeButton/Exchange/Background"},
    {"Anchor/Offset/ChangeButton/Exchange/HighSprite"},
    {"Anchor/Offset/ChangeButton/Gift/Background"},
    {"Anchor/Offset/ChangeButton/Gift/HighSprite"},
    {"Anchor/Offset/Content/Copy/BossCopy/Btn"},
    {"Anchor/Offset/Content/Copy/BossCopy/Btn/Sprite"},
    {"Anchor/Offset/Content/Copy/BossCopy/Icon"},
    {"Anchor/Offset/Content/Copy/CommonCopy/Btn"},
    {"Anchor/Offset/Content/Copy/CommonCopy/Icon"},
    {"Anchor/Offset/Content/Exchange/Bg"},
    {"Anchor/Offset/Content/Exchange/Clone/Arrow"},
    {"Anchor/Offset/Content/Exchange/Clone/Bg"},
    {"Anchor/Offset/Content/Exchange/Clone/Btn"},
    {"Anchor/Offset/Content/Gift/Buy/Arrow/Clone"},
    {"Anchor/Offset/Content/Gift/Buy/Arrow/Clone/active"},
    {"Anchor/Offset/Content/Gift/Buy/Arrow/Left"},
    {"Anchor/Offset/Content/Gift/Buy/Arrow/Right"},
    {"Anchor/Offset/Content/Gift/Buy/Btn"},
    {"Anchor/Offset/Content/Gift/Buy/Expend/Icon"},
    {"Anchor/Offset/Content/Gift/Texture"},
    {"Anchor/Offset/Static/CloseButton"},
    {"Anchor/Offset/Static/Icon"},
    {"Anchor/Offset/Static/Icon/Sprite"},
    {"Anchor/Offset/Static/Mask"}
    ].

get1KeyList()->[
    "Anchor/Offset/ChangeButton/Copy/Background",
    "Anchor/Offset/ChangeButton/Copy/HighSprite",
    "Anchor/Offset/ChangeButton/Exchange/Background",
    "Anchor/Offset/ChangeButton/Exchange/HighSprite",
    "Anchor/Offset/ChangeButton/Gift/Background",
    "Anchor/Offset/ChangeButton/Gift/HighSprite",
    "Anchor/Offset/Content/Copy/BossCopy/Btn",
    "Anchor/Offset/Content/Copy/BossCopy/Btn/Sprite",
    "Anchor/Offset/Content/Copy/BossCopy/Icon",
    "Anchor/Offset/Content/Copy/CommonCopy/Btn",
    "Anchor/Offset/Content/Copy/CommonCopy/Icon",
    "Anchor/Offset/Content/Exchange/Bg",
    "Anchor/Offset/Content/Exchange/Clone/Arrow",
    "Anchor/Offset/Content/Exchange/Clone/Bg",
    "Anchor/Offset/Content/Exchange/Clone/Btn",
    "Anchor/Offset/Content/Gift/Buy/Arrow/Clone",
    "Anchor/Offset/Content/Gift/Buy/Arrow/Clone/active",
    "Anchor/Offset/Content/Gift/Buy/Arrow/Left",
    "Anchor/Offset/Content/Gift/Buy/Arrow/Right",
    "Anchor/Offset/Content/Gift/Buy/Btn",
    "Anchor/Offset/Content/Gift/Buy/Expend/Icon",
    "Anchor/Offset/Content/Gift/Texture",
    "Anchor/Offset/Static/CloseButton",
    "Anchor/Offset/Static/Icon",
    "Anchor/Offset/Static/Icon/Sprite",
    "Anchor/Offset/Static/Mask"
    ].

