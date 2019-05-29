gg_trg___________________________u = nil
gg_rct_Portal_First_OUT = nil
gg_rct_Portal_Second_OUT = nil
gg_trg_From_First_to_Second = nil
gg_trg_From_Second_to_First = nil
gg_rct_Portal_First_IN = nil
gg_rct_Portal_Second_IN = nil
gg_rct_Start_zone = nil
gg_rct_New_Game = nil
gg_trg_New_Game = nil
gg_rct_Playground1 = nil
gg_rct_Playground1IN = nil
gg_rct_Playground2IN = nil
gg_rct_Playground3IN = nil
function InitGlobals()
end

function CreateUnitsForPlayer0()
    local p = Player(0)
    local u
    local unitID
    local t
    local life
    u = CreateUnit(p, FourCC("h000"), -28586.1, 27880.4, 15.986)
    SetUnitColor(u, ConvertPlayerColor(24))
end

function CreateNeutralPassiveBuildings()
    local p = Player(PLAYER_NEUTRAL_PASSIVE)
    local u
    local unitID
    local t
    local life
    u = CreateUnit(p, FourCC("n000"), -28416.0, 28416.0, 270.000)
    u = CreateUnit(p, FourCC("n000"), -28416.0, 27904.0, 270.000)
    u = CreateUnit(p, FourCC("n000"), -28416.0, 28928.0, 270.000)
    u = CreateUnit(p, FourCC("n000"), -27904.0, 27840.0, 270.000)
end

function CreatePlayerBuildings()
end

function CreatePlayerUnits()
    CreateUnitsForPlayer0()
end

function CreateAllUnits()
    CreateNeutralPassiveBuildings()
    CreatePlayerBuildings()
    CreatePlayerUnits()
end

function CreateRegions()
    local we
    gg_rct_Portal_First_IN = Rect(-28480.0, 28352.0, -28416.0, 28480.0)
    gg_rct_Portal_First_OUT = Rect(-28416.0, 28352.0, -28352.0, 28480.0)
    gg_rct_Portal_Second_OUT = Rect(-28416.0, 28864.0, -28352.0, 28992.0)
    gg_rct_Portal_Second_IN = Rect(-28480.0, 28864.0, -28416.0, 28992.0)
    gg_rct_Start_zone = Rect(-30016.0, 27552.0, -28096.0, 29728.0)
    gg_rct_New_Game = Rect(-28480.0, 27840.0, -28352.0, 27968.0)
    gg_rct_Playground1IN = Rect(-29184.0, 27776.0, -29056.0, 27904.0)
    gg_rct_Playground1 = Rect(-28160.0, 27552.0, -26048.0, 29728.0)
    gg_rct_Playground2IN = Rect(-29184.0, 27904.0, -29056.0, 28032.0)
    gg_rct_Playground3IN = Rect(-29184.0, 28032.0, -29056.0, 28160.0)
end

function Trig_New_Game_Actions()
    math.randomseed(os.time(os.date("!*t")))
    local temp = "gg_rct_Playground" .. math.random(0, 3) .. "IN"

    DisplayTimedTextToForce(
        GetPlayersByMapControl(GetPlayerController(GetOwningPlayer(GetTriggerUnit()))),
        30,
        "TRIGSTR_020"
    )
    SetUnitPositionLoc(GetTriggerUnit(), GetRectCenter(referenceByString(temp)))
end

function InitTrig_New_Game()
    gg_trg_New_Game = CreateTrigger()
    TriggerRegisterEnterRectSimple(gg_trg_New_Game, gg_rct_New_Game)
    TriggerAddAction(gg_trg_New_Game, Trig_New_Game_Actions)
end

function Trig_From_First_to_Second_Actions()
    SetUnitPositionLoc(GetTriggerUnit(), GetRandomLocInRect(gg_rct_Portal_Second_IN))
end

function InitTrig_From_First_to_Second()
    gg_trg_From_First_to_Second = CreateTrigger()
    TriggerRegisterEnterRectSimple(gg_trg_From_First_to_Second, gg_rct_Portal_First_OUT)
    TriggerAddAction(gg_trg_From_First_to_Second, Trig_From_First_to_Second_Actions)
end

function Trig_From_Second_to_First_Actions()
    SetUnitPositionLoc(GetTriggerUnit(), GetRandomLocInRect(gg_rct_Portal_First_IN))
end

function InitTrig_From_Second_to_First()
    gg_trg_From_Second_to_First = CreateTrigger()
    TriggerRegisterEnterRectSimple(gg_trg_From_Second_to_First, gg_rct_Portal_Second_OUT)
    TriggerAddAction(gg_trg_From_Second_to_First, Trig_From_Second_to_First_Actions)
end

function Trig___________________________u_Actions()
    CreateTextTagLocBJ("TRIGSTR_018", GetRectCenter(gg_rct_New_Game), 0, 15.00, 100, 100, 100, 0)
    CreateFogModifierRectBJ(true, Player(0), FOG_OF_WAR_VISIBLE, GetEntireMapRect())
    SetTimeOfDay(12)
    SetTimeOfDayScalePercentBJ(0.00)
end

function InitTrig___________________________u()
    gg_trg___________________________u = CreateTrigger()
    TriggerAddAction(gg_trg___________________________u, Trig___________________________u_Actions)
end

function InitCustomTriggers()
    InitTrig_New_Game()
    InitTrig_From_First_to_Second()
    InitTrig_From_Second_to_First()
    InitTrig___________________________u()
end

function RunInitializationTriggers()
    ConditionalTriggerExecute(gg_trg___________________________u)
end

function InitCustomPlayerSlots()
    SetPlayerStartLocation(Player(0), 0)
    ForcePlayerStartLocation(Player(0), 0)
    SetPlayerColor(Player(0), ConvertPlayerColor(0))
    SetPlayerRacePreference(Player(0), RACE_PREF_RANDOM)
    SetPlayerRaceSelectable(Player(0), true)
    SetPlayerController(Player(0), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(1), 1)
    ForcePlayerStartLocation(Player(1), 1)
    SetPlayerColor(Player(1), ConvertPlayerColor(1))
    SetPlayerRacePreference(Player(1), RACE_PREF_RANDOM)
    SetPlayerRaceSelectable(Player(1), true)
    SetPlayerController(Player(1), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(2), 2)
    ForcePlayerStartLocation(Player(2), 2)
    SetPlayerColor(Player(2), ConvertPlayerColor(2))
    SetPlayerRacePreference(Player(2), RACE_PREF_RANDOM)
    SetPlayerRaceSelectable(Player(2), true)
    SetPlayerController(Player(2), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(3), 3)
    ForcePlayerStartLocation(Player(3), 3)
    SetPlayerColor(Player(3), ConvertPlayerColor(3))
    SetPlayerRacePreference(Player(3), RACE_PREF_RANDOM)
    SetPlayerRaceSelectable(Player(3), true)
    SetPlayerController(Player(3), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(4), 4)
    ForcePlayerStartLocation(Player(4), 4)
    SetPlayerColor(Player(4), ConvertPlayerColor(4))
    SetPlayerRacePreference(Player(4), RACE_PREF_RANDOM)
    SetPlayerRaceSelectable(Player(4), true)
    SetPlayerController(Player(4), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(5), 5)
    ForcePlayerStartLocation(Player(5), 5)
    SetPlayerColor(Player(5), ConvertPlayerColor(5))
    SetPlayerRacePreference(Player(5), RACE_PREF_RANDOM)
    SetPlayerRaceSelectable(Player(5), true)
    SetPlayerController(Player(5), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(6), 6)
    ForcePlayerStartLocation(Player(6), 6)
    SetPlayerColor(Player(6), ConvertPlayerColor(6))
    SetPlayerRacePreference(Player(6), RACE_PREF_RANDOM)
    SetPlayerRaceSelectable(Player(6), true)
    SetPlayerController(Player(6), MAP_CONTROL_USER)
    SetPlayerStartLocation(Player(7), 7)
    ForcePlayerStartLocation(Player(7), 7)
    SetPlayerColor(Player(7), ConvertPlayerColor(7))
    SetPlayerRacePreference(Player(7), RACE_PREF_RANDOM)
    SetPlayerRaceSelectable(Player(7), true)
    SetPlayerController(Player(7), MAP_CONTROL_USER)
end

function InitCustomTeams()
    SetPlayerTeam(Player(0), 0)
    SetPlayerTeam(Player(1), 0)
    SetPlayerTeam(Player(2), 0)
    SetPlayerTeam(Player(3), 0)
    SetPlayerTeam(Player(4), 0)
    SetPlayerTeam(Player(5), 0)
    SetPlayerTeam(Player(6), 0)
    SetPlayerTeam(Player(7), 0)
end

function InitAllyPriorities()
    SetStartLocPrioCount(0, 7)
    SetStartLocPrio(0, 0, 1, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(0, 1, 2, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(0, 2, 3, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(0, 3, 4, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(0, 4, 5, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(0, 5, 6, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(0, 6, 7, MAP_LOC_PRIO_HIGH)
    SetStartLocPrioCount(1, 7)
    SetStartLocPrio(1, 0, 0, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(1, 1, 2, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(1, 2, 3, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(1, 3, 4, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(1, 4, 5, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(1, 5, 6, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(1, 6, 7, MAP_LOC_PRIO_HIGH)
    SetStartLocPrioCount(2, 7)
    SetStartLocPrio(2, 0, 0, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(2, 1, 1, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(2, 2, 3, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(2, 3, 4, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(2, 4, 5, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(2, 5, 6, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(2, 6, 7, MAP_LOC_PRIO_HIGH)
    SetStartLocPrioCount(3, 7)
    SetStartLocPrio(3, 0, 0, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(3, 1, 1, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(3, 2, 2, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(3, 3, 4, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(3, 4, 5, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(3, 5, 6, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(3, 6, 7, MAP_LOC_PRIO_HIGH)
    SetStartLocPrioCount(4, 7)
    SetStartLocPrio(4, 0, 0, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(4, 1, 1, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(4, 2, 2, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(4, 3, 3, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(4, 4, 5, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(4, 5, 6, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(4, 6, 7, MAP_LOC_PRIO_HIGH)
    SetStartLocPrioCount(5, 7)
    SetStartLocPrio(5, 0, 0, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(5, 1, 1, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(5, 2, 2, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(5, 3, 3, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(5, 4, 4, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(5, 5, 6, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(5, 6, 7, MAP_LOC_PRIO_HIGH)
    SetStartLocPrioCount(6, 7)
    SetStartLocPrio(6, 0, 0, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(6, 1, 1, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(6, 2, 2, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(6, 3, 3, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(6, 4, 4, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(6, 5, 5, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(6, 6, 7, MAP_LOC_PRIO_HIGH)
    SetStartLocPrioCount(7, 7)
    SetStartLocPrio(7, 0, 0, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(7, 1, 1, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(7, 2, 2, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(7, 3, 3, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(7, 4, 4, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(7, 5, 5, MAP_LOC_PRIO_HIGH)
    SetStartLocPrio(7, 6, 6, MAP_LOC_PRIO_HIGH)
end

function main()
    SetCameraBounds(
        -29952.0 + GetCameraMargin(CAMERA_MARGIN_LEFT),
        -30208.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM),
        29952.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT),
        29696.0 - GetCameraMargin(CAMERA_MARGIN_TOP),
        -29952.0 + GetCameraMargin(CAMERA_MARGIN_LEFT),
        29696.0 - GetCameraMargin(CAMERA_MARGIN_TOP),
        29952.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT),
        -30208.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM)
    )
    SetDayNightModels(
        "Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl",
        "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl"
    )
    NewSoundEnvironment("Default")
    SetAmbientDaySound("LordaeronSummerDay")
    SetAmbientNightSound("LordaeronSummerNight")
    SetMapMusic("Music", true, 0)
    CreateRegions()
    CreateAllUnits()
    InitBlizzard()
    InitGlobals()
    InitCustomTriggers()
    RunInitializationTriggers()
end

function config()
    SetMapName("TRIGSTR_001")
    SetMapDescription("TRIGSTR_003")
    SetPlayers(8)
    SetTeams(8)
    SetGamePlacement(MAP_PLACEMENT_TEAMS_TOGETHER)
    DefineStartLocation(0, -29696.0, 29440.0)
    DefineStartLocation(1, -29696.0, 29440.0)
    DefineStartLocation(2, -29696.0, 29440.0)
    DefineStartLocation(3, -29696.0, 29440.0)
    DefineStartLocation(4, -29696.0, 29440.0)
    DefineStartLocation(5, -29696.0, 29440.0)
    DefineStartLocation(6, -29696.0, 29440.0)
    DefineStartLocation(7, -29696.0, 29440.0)
    InitCustomPlayerSlots()
    SetPlayerSlotAvailable(Player(0), MAP_CONTROL_USER)
    SetPlayerSlotAvailable(Player(1), MAP_CONTROL_USER)
    SetPlayerSlotAvailable(Player(2), MAP_CONTROL_USER)
    SetPlayerSlotAvailable(Player(3), MAP_CONTROL_USER)
    SetPlayerSlotAvailable(Player(4), MAP_CONTROL_USER)
    SetPlayerSlotAvailable(Player(5), MAP_CONTROL_USER)
    SetPlayerSlotAvailable(Player(6), MAP_CONTROL_USER)
    SetPlayerSlotAvailable(Player(7), MAP_CONTROL_USER)
    InitGenericPlayerSlots()
    InitAllyPriorities()
end
