require("T6.Zombie.SelectStartLocZombie")

CoD.SelectMapZombie = {}
CoD.SelectMapZombie.MapInfoHeightOffSet = -20
CoD.SelectMapZombie.MapInfoWidth = 24
CoD.SelectMapZombie.MapInfoHeight = 24
CoD.SelectMapZombie.MapInfoTitleHeight = 60
CoD.SelectMapZombie.SideNewIconsRadiusAddOn = 15
CoD.SelectMapZombie.SideNewIconsLeftOffSet = 40
CoD.SelectMapZombie.SideNewIconsLatitudeScale = 1
CoD.SelectMapZombie.MapInfoNewIconWidth = 64
CoD.SelectMapZombie.MapInfoNewIconHeight = 32
CoD.SelectMapZombie.MapInfoNewIconHiddenScale = 0.8
CoD.SelectMapZombie.NewIconOffsetDirectionTable = {
	top = {
		width = 19,
		height = -25
	},
	left = {
		width = -18,
		height = 0
	},
	bottom = {
		width = -19,
		height = 25
	},
	right = {
		width = 50,
		height = 0
	}
}
CoD.SelectMapZombie.NewIconZoomOffsetDirectionTable = {
	top = {
		width = 17,
		height = -50
	},
	left = {
		width = -40,
		height = 0
	},
	bottom = {
		width = -17,
		height = 50
	},
	right = {
		width = 75,
		height = 0
	}
}
CoD.SelectMapZombie.GlobeMapSelectionRotationTimeShort = 250
CoD.SelectMapZombie.GlobeMapSelectionRotationTimeMedium = 500
CoD.SelectMapZombie.GlobeMapSelectionRotationTimeLong = 750
CoD.SelectMapZombie.GlobeMapSelectionRotationTimeLongest = 1000
CoD.SelectMapZombie.MapRotationInput = {}
CoD.SelectMapZombie.MapInfoRotatingPathDeltaLongitude = math.pi / 8
CoD.SelectMapZombie.MapInfoRotatingLongitudeOrigin = -math.pi / 2
CoD.SelectMapZombie.MapInfoRotatingPathNodesCount = 17
CoD.SelectMapZombie.MapInfoRotatingPathNodes = {}
for f0_local0 = 1, CoD.SelectMapZombie.MapInfoRotatingPathNodesCount, 1 do
	CoD.SelectMapZombie.MapInfoRotatingPathNodes[f0_local0] = {
		longitude = CoD.GameGlobeZombie.ShaderVector2YMin + CoD.SelectMapZombie.MapInfoRotatingPathDeltaLongitude * (f0_local0 - 1)
	}
end
CoD.SelectMapZombie.MapNewIconMaterial = RegisterMaterial("menu_mp_lobby_new_small")
CoD.SelectMapZombie.DisableCycleRotation = true

LUI.createMenu.SelectMapZM = function (f1_arg0)
	local f1_local0 = CoD.Menu.New("SelectMapZM")
	f1_local0.m_ownerController = f1_arg0
	f1_local0:registerEventHandler("open_map_transit", CoD.SelectMapZombie.OpenMapTransit)
	f1_local0:registerEventHandler("open_map_bus_depot", CoD.SelectMapZombie.OpenMapBusDepot)
	f1_local0:registerEventHandler("open_map_diner", CoD.SelectMapZombie.OpenMapDiner)
	f1_local0:registerEventHandler("open_map_farm", CoD.SelectMapZombie.OpenMapFarm)
	f1_local0:registerEventHandler("open_map_power", CoD.SelectMapZombie.OpenMapPower)
	f1_local0:registerEventHandler("open_map_town", CoD.SelectMapZombie.OpenMapTown)
	f1_local0:registerEventHandler("open_map_nuked", CoD.SelectMapZombie.OpenMapNuked)
	f1_local0:registerEventHandler("open_map_highrise", CoD.SelectMapZombie.OpenMapHighrise)
	f1_local0:registerEventHandler("open_map_prison", CoD.SelectMapZombie.OpenMapPrison)
	f1_local0:registerEventHandler("open_map_buried", CoD.SelectMapZombie.OpenMapBuried)
	f1_local0:registerEventHandler("open_map_tomb", CoD.SelectMapZombie.OpenMapTomb)
	f1_local0:registerEventHandler("button_prompt_back", CoD.SelectMapZombie.BackButton)
	f1_local0:addBackButton()
	f1_local0:addSelectButton()
	if Engine.GameModeIsMode(CoD.GAMEMODE_LOCAL_SPLITSCREEN) == true or Engine.SessionModeIsMode(CoD.SESSIONMODE_SYSTEMLINK) == true or Engine.SessionModeIsMode(CoD.SESSIONMODE_OFFLINE) == true then
		f1_local0:setPreviousMenu("MainMenu")
	else
		f1_local0:setPreviousMenu("MainLobby")
	end
--todo	f1_local0:addTitle(Engine.Localize("MISSION SELECT"))
	if CoD.isZombie then
		local self = LUI.UIImage.new()
		self:setLeftRight(false, false, -430, 430)
		self:setTopBottom(false, false, -290, 290)
		self:setImage(RegisterMaterial("loadscreen_zm_factory"))
		self:setPriority(-1)
		f1_local0:addElement(self)
	end
	if CoD.isZombie then
		local self = LUI.UIText.new()
		self:setLeftRight(false, true, 0, 43)
		self:setTopBottom(true, false, 0, 29)
--		self:setRGB(CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b)
--		self:setAlpha(0.5)
--		self:setAlignment(LUI.Alignment.Center)
		self:setText(Engine.Localize("ZMUI_ZCLASSIC_CAPS"))
		self:setPriority(-1)
		f1_local0:addElement(self)
	end
--	if CoD.isZombie then
--		local f1_local1 = LUI.UIText.new({
--			leftAnchor = false,
--			rightAnchor = true,
--			left = 0,
--			right = 1,
--			topAnchor = true,
--			bottomAnchor = false,
--			top = -CoD.textSize.Default,
--			bottom = 0
--		})
--		f1_local1:setText(Engine.Localize("ZMUI_ZCLASSIC_CAPS"))
--		f1_local0:addElement(f1_local1)
--	end
	local f1_local1 = 16.5
	local f1_local2 = 50
	local f1_local3 = CoD.CoD9Button.Height * f1_local1
	local f1_local4 = CoD.ButtonList.DefaultWidth
	local f1_local5 = -f1_local3 - CoD.ButtonPrompt.Height
	f1_local0.buttonList = CoD.ButtonList.new({
		leftAnchor = true,
		rightAnchor = false,
		left = f1_local2,
		right = f1_local2 + f1_local4,
		topAnchor = false,
		bottomAnchor = true,
		top = f1_local5,
		bottom = -CoD.ButtonPrompt.Height,
		alpha = 1
	})
	f1_local0.buttonList:setPriority(10)
	f1_local0.buttonList:registerAnimationState("disabled", {
		alpha = 0.5
	})
	f1_local0:addElement(f1_local0.buttonList)
	f1_local0.MapSelectionButton = f1_local0.buttonList:addButton(Engine.Localize("ZMUI_ZCLASSIC_CAPS"), nil, 1)
	f1_local0.MapSelectionButton.hintText = Engine.Localize("ZMUI_CLASSIC_DESC_TRANSIT")
	f1_local0.MapSelectionButton.MapSelectionImage = RegisterMaterial( "menu_zm_transit_zclassic_transit" )
	f1_local0.MapSelectionButton:setActionEventName("open_map_transit")
	f1_local0.MapSelectionButton = f1_local0.buttonList:addButton(Engine.Localize("ZMUI_BUS_STOP_CAPS"), nil, 2)
	f1_local0.MapSelectionButton.hintText = Engine.Localize("ZMUI_STANDARD_DESC_TRANSIT")
	f1_local0.MapSelectionButton.MapSelectionImage = RegisterMaterial( "menu_zm_transit_zsurvival_transit" )
	f1_local0.MapSelectionButton:setActionEventName("open_map_bus_depot")
	f1_local0.MapSelectionButton = f1_local0.buttonList:addButton(Engine.Localize("ZMUI_DINER_CAPS"), nil, 3)
	f1_local0.MapSelectionButton.hintText = Engine.Localize("ZMUI_DINER_DESC")
	f1_local0.MapSelectionButton.MapSelectionImage = RegisterMaterial( "menu_zm_transit_zsurvival_diner" )
	f1_local0.MapSelectionButton:setActionEventName("open_map_diner")
	f1_local0.MapSelectionButton = f1_local0.buttonList:addButton(Engine.Localize("ZMUI_FARM_CAPS"), nil, 4)
	f1_local0.MapSelectionButton.hintText = Engine.Localize("ZMUI_STANDARD_DESC_FARM")
	f1_local0.MapSelectionButton.MapSelectionImage = RegisterMaterial( "menu_zm_transit_zsurvival_farm" )
	f1_local0.MapSelectionButton:setActionEventName("open_map_farm")
	f1_local0.MapSelectionButton = f1_local0.buttonList:addButton(Engine.Localize("ZMUI_POWER_CAPS"), nil, 5)
	f1_local0.MapSelectionButton.hintText = Engine.Localize("ZMUI_POWER_DESC")
	f1_local0.MapSelectionButton.MapSelectionImage = RegisterMaterial( "menu_zm_transit_zclassic_station" )
	f1_local0.MapSelectionButton:setActionEventName("open_map_station")
	f1_local0.MapSelectionButton = f1_local0.buttonList:addButton(Engine.Localize("ZMUI_TOWN_CAPS"), nil, 6)
	f1_local0.MapSelectionButton.hintText = Engine.Localize("ZMUI_STANDARD_DESC_TOWN")
	f1_local0.MapSelectionButton.MapSelectionImage = RegisterMaterial( "menu_zm_transit_zsurvival_town" )
	f1_local0.MapSelectionButton:setActionEventName("open_map_town")
	f1_local0.MapSelectionButton = f1_local0.buttonList:addButton(Engine.Localize("ZMUI_NUKED_LOC"), nil, 7)
	f1_local0.MapSelectionButton.hintText = Engine.Localize("ZMUI_STANDARD_DESC_NUKED")
	f1_local0.MapSelectionButton.MapSelectionImage = RegisterMaterial( "menu_zm_nuketown_select" )
	f1_local0.MapSelectionButton:setActionEventName("open_map_nuked")
	f1_local0.MapSelectionButton = f1_local0.buttonList:addButton(Engine.Localize("ZMUI_ZCLASSIC_ZM_HIGHRISE_CAPS"), nil, 8)
	f1_local0.MapSelectionButton.hintText = Engine.Localize("ZMUI_CLASSIC_DESC_ROOFTOP")
	f1_local0.MapSelectionButton.MapSelectionImage = RegisterMaterial( "menu_zm_highrise_zclassic_rooftop" )
	f1_local0.MapSelectionButton:setActionEventName("open_map_highrise")
	f1_local0.MapSelectionButton = f1_local0.buttonList:addButton(Engine.Localize("ZMUI_ZCLASSIC_ZM_PRISON_CAPS"), nil, 9)
	f1_local0.MapSelectionButton.hintText = Engine.Localize("ZMUI_CLASSIC_DESC_PRISON")
	f1_local0.MapSelectionButton.MapSelectionImage = RegisterMaterial( "menu_zm_prison_select_mob" )
	f1_local0.MapSelectionButton:setActionEventName("open_map_prison")
	f1_local0.MapSelectionButton = f1_local0.buttonList:addButton(Engine.Localize("ZMUI_ZCLASSIC_ZM_BURIED_CAPS"), nil, 10)
	f1_local0.MapSelectionButton.hintText = Engine.Localize("ZMUI_CLASSIC_DESC_PROCESSING")
	f1_local0.MapSelectionButton.MapSelectionImage = RegisterMaterial( "menu_zm_buried_zclassic_processing" )
	f1_local0.MapSelectionButton:setActionEventName("open_map_buried")
	f1_local0.MapSelectionButton = f1_local0.buttonList:addButton(Engine.Localize("ZMUI_ZCLASSIC_ZM_TOMB_CAPS"), nil, 11)
	f1_local0.MapSelectionButton.hintText = Engine.Localize("ZMUI_CLASSIC_DESC_TOMB")
	f1_local0.MapSelectionButton.MapSelectionImage = RegisterMaterial( "menu_zm_tomb_zclassic_tomb" )
	f1_local0.MapSelectionButton:setActionEventName("open_map_tomb")
	if CoD.isZombie then
		local self = LUI.UIImage.new()
		self:setLeftRight(false, false, -35, 395)
		self:setTopBottom(false, false, -145, 160)
		self:setImage(RegisterMaterial("menu_zm_transit_zclassic_transit"))
		self:setPriority(-1)
		f1_local0:addElement(self)
	end
	local self = LUI.UIElement.new()
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self.id = "mapinfocontainer"
	f1_local0:addElement( self )
	f1_local0.mapInfos = {}
	local f1_local2 = Engine.GameModeIsMode( CoD.GAMEMODE_PUBLIC_MATCH )
	if f1_local2 then
		f1_local0.totalSuperCategoryPlayerCount = 0
	end
	f1_local0.mapCount = 0
	local f1_local3 = CoD.SelectMapZombie.GetMaps( f1_local0, f1_arg0 )
	local f1_local4 = nil
	local f1_local5 = 1
	for f1_local26, f1_local27 in pairs( f1_local3 ) do
		if not f1_local2 or f1_local27.filter == CoD.PlaylistCategoryFilter then
			f1_local27.loadName, f1_local4 = string.gsub( f1_local27.loadName, "_solo", "", 1 )
			local f1_local9 = tonumber( UIExpression.TableLookup( f1_arg0, UIExpression.GetCurrentMapTableName(), 0, f1_local27.loadName, 16 ) ) * CoD.GameGlobeZombie.DegreesToRadiansScale
			local f1_local10 = tonumber( UIExpression.TableLookup( f1_arg0, UIExpression.GetCurrentMapTableName(), 0, f1_local27.loadName, 17 ) ) * CoD.GameGlobeZombie.DegreesToRadiansScale
			local f1_local11 = tonumber( UIExpression.TableLookup( f1_arg0, UIExpression.GetCurrentMapTableName(), 0, f1_local27.loadName, 18 ) ) * CoD.GameGlobeZombie.DegreesToRadiansScale
			local f1_local12, f1_local13, f1_local14, f1_local15 = CoD.SelectMapZombie:SphereToCartesian( CoD.GameGlobeZombie.CenterRadius, f1_local9, f1_local11 )
			local f1_local16 = LUI.UIElement.new()
			f1_local16:setLeftRight( false, false, f1_local12 - 0.5 * CoD.SelectMapZombie.MapInfoWidth, f1_local12 + 0.5 * CoD.SelectMapZombie.MapInfoWidth )
			f1_local16:setTopBottom( false, false, -f1_local13 - 0.5 * CoD.SelectMapZombie.MapInfoHeight + CoD.GameGlobeZombie.PlaceYOffSet, -f1_local13 + 0.5 * CoD.SelectMapZombie.MapInfoHeight + CoD.GameGlobeZombie.PlaceYOffSet )
			f1_local16:setAlpha( 0 )
			f1_local16.index = f1_local5
			f1_local5 = f1_local5 + 1
			f1_local16.iconContainer = LUI.UIElement.new()
			f1_local16.iconContainer:setLeftRight( true, true, 0, 0 )
			f1_local16.iconContainer:setTopBottom( true, true, 0, 0 )
			f1_local16.iconContainer:setScale( 0 )
			f1_local16:addElement( f1_local16.iconContainer )
			local f1_local17 = UIExpression.TableLookup( f1_arg0, UIExpression.GetCurrentMapTableName(), 0, f1_local27.loadName, 4 )
			f1_local16.icon = LUI.UIImage.new()
			f1_local16.icon:setLeftRight( true, true, 0, 0 )
			f1_local16.icon:setTopBottom( true, true, 0, 0 )
			f1_local16.icon:setImage( RegisterMaterial( f1_local17 ) )
			if true == Dvar.ui_showNewestLeaderboards:get() and CoD.Zombie.IsSideQuestMap( f1_local27.loadName ) then
				local f1_local18 = UIExpression.GetDStat( f1_arg0, "PlayerStatsList", "SQ_" .. UIExpression.ToUpper( nil, string.sub( f1_local27.loadName, 4 ) ) .. "_LAST_COMPLETED", "StatValue" )
				if f1_local18 > 0 then
					local f1_local19 = LUI.UIElement.new()
					f1_local19:setLeftRight( true, true, -2, 2 )
					f1_local19:setTopBottom( true, true, -2, 2 )
					f1_local16.iconContainer:addElement( f1_local19 )
					local f1_local20 = "menu_" .. f1_local27.loadName .. "_signpost_glow"
					local f1_local21 = LUI.UIImage.new()
					f1_local21:setLeftRight( true, true, 0, 0 )
					f1_local21:setTopBottom( true, true, 0, 0 )
					f1_local21:setImage( RegisterMaterial( f1_local20 ) )
					f1_local21:setRGB( CoD.Zombie.SideQuestStoryLine[f1_local18].color.r, CoD.Zombie.SideQuestStoryLine[f1_local18].color.g, CoD.Zombie.SideQuestStoryLine[f1_local18].color.b )
					f1_local19:addElement( f1_local21 )
					f1_local19:alternateStates( 0, CoD.SelectMapZombie.PulseBright, CoD.SelectMapZombie.PulseLow, 750, 750 )
					local f1_local22 = UIExpression.GetDStat( f1_arg0, "PlayerStatsList", "NAVCARD_APPLIED_" .. UIExpression.ToUpper( nil, f1_local27.loadName ), "StatValue" )
					if f1_local22 > 0 then
						local f1_local23 = LUI.UIImage.new()
						f1_local23:setLeftRight( true, true, -3, 3 )
						f1_local23:setTopBottom( true, true, -3, 3 )
						f1_local23:setImage( CoD.SelectMapZombie.NavCardRingImage )
						f1_local23:setRGB( CoD.Zombie.SideQuestStoryLine[f1_local18].color.r, CoD.Zombie.SideQuestStoryLine[f1_local18].color.g, CoD.Zombie.SideQuestStoryLine[f1_local18].color.b )
						f1_local23:setAlpha( 0.25 )
						f1_local16.iconContainer:addElement( f1_local23 )
						local f1_local24 = LUI.UIImage.new()
						f1_local24:setLeftRight( true, true, -3, 3 )
						f1_local24:setTopBottom( true, true, -3, 3 )
						f1_local24:setImage( CoD.SelectMapZombie.NavCardLightningImage )
						f1_local24:setRGB( CoD.Zombie.SideQuestStoryLine[f1_local18].color.r, CoD.Zombie.SideQuestStoryLine[f1_local18].color.g, CoD.Zombie.SideQuestStoryLine[f1_local18].color.b )
						f1_local24:setAlpha( 1 )
						f1_local16.iconContainer:addElement( f1_local24 )
						f1_local16.iconContainer.navCardInstalled = true
					end
					f1_local16.icon:alternateStates( 0, CoD.Zombie.SideQuestStoryLine[f1_local18].colorFunction, CoD.SelectMapZombie.ColorWhite, 750, 750 )
				end
			end
			f1_local16.iconContainer:addElement( f1_local16.icon )
			if not CoD.SelectStartLocZombie.SeenStartMap( f1_arg0, f1_local27.loadName ) then
				f1_local16.newIconPlacement = UIExpression.TableLookup( f1_arg0, CoD.mapsTable, 0, f1_local27.loadName, 19 )
				f1_local16.newIcon = LUI.UIImage.new()
				CoD.SelectMapZombie.MoveNewIconToNext( f1_local16, 0 )
				f1_local16.newIcon:setImage( CoD.SelectMapZombie.MapNewIconMaterial )
				f1_local16:addElement( f1_local16.newIcon )
				f1_local16.leftSideNewIcon = LUI.UIImage.new()
				f1_local16.leftSideNewIcon:setLeftRight( false, false, -CoD.SelectMapZombie.MapInfoNewIconWidth / 2, CoD.SelectMapZombie.MapInfoNewIconWidth / 2 )
				f1_local16.leftSideNewIcon:setTopBottom( false, false, -CoD.SelectMapZombie.MapInfoNewIconHeight / 2, CoD.SelectMapZombie.MapInfoNewIconHeight / 2 )
				f1_local16.leftSideNewIcon:setImage( CoD.SelectMapZombie.MapNewIconMaterial )
				f1_local16.leftSideNewIcon:setAlpha( 0 )
				self:addElement( f1_local16.leftSideNewIcon )
				f1_local16.rightSideNewIcon = LUI.UIImage.new()
				f1_local16.rightSideNewIcon:setLeftRight( false, false, -CoD.SelectMapZombie.MapInfoNewIconWidth / 2, CoD.SelectMapZombie.MapInfoNewIconWidth / 2 )
				f1_local16.rightSideNewIcon:setTopBottom( false, false, -CoD.SelectMapZombie.MapInfoNewIconHeight / 2, CoD.SelectMapZombie.MapInfoNewIconHeight / 2 )
				f1_local16.rightSideNewIcon:setImage( CoD.SelectMapZombie.MapNewIconMaterial )
				f1_local16.rightSideNewIcon:setAlpha( 0 )
				self:addElement( f1_local16.rightSideNewIcon )
			end
			if CoD.useMouse then
				local f1_local25 = LUI.UIButton.new( LUI.UIElement.ContainerState, "mouse_select" )
				f1_local25:setLeftRight( true, true, 0, 0 )
				f1_local25:setTopBottom( true, true, 0, 0 )
				f1_local25.mapInfo = f1_local16
				if f1_local15 == 0 then
					f1_local25:setHandleMouse( false )
				end
				f1_local16.mouseButton = f1_local25
				f1_local16:addElement( f1_local25 )
			end
			f1_local16.superCategoryIndex = f1_local27.index
			f1_local16.name = f1_local27.name
			f1_local16.loadName = f1_local27.loadName
			f1_local16.size = "MPUI_MAPSIZE_" .. UIExpression.TableLookup( f1_arg0, UIExpression.GetCurrentMapTableName(), 0, f1_local27.loadName, 8 )
			f1_local16.x = f1_local12
			f1_local16.y = f1_local13
			f1_local16.z = z
			f1_local16.originalLongitude = f1_local9
			f1_local16.originalLatitude = f1_local10
			f1_local16.longitude = f1_local9
			f1_local16.latitude = f1_local10
			f1_local16.mapInfoPlaceLatitude = f1_local11
			f1_local16:registerEventHandler( "transition_complete_move_to_next", CoD.SelectMapZombie.MapInfoMoveToNextFinish )
			self:addElement( f1_local16 )
			f1_local0.mapCount = f1_local0.mapCount + 1
			f1_local0.mapInfos[f1_local0.mapCount] = f1_local16
		end
		Engine.SetDvar( "ui_gametype", CoD.Zombie.GetDefaultGameTypeForMap() )
	end
	CoD.GameGlobeZombie.gameGlobe.currentMenu = f1_local0
	CoD.GameGlobeZombie.mapInfoContainer = self
	CoD.GameMapZombie.gameMap.currentMenu = f1_local0
	f1_local0:registerEventHandler( "gamepad_button", CoD.SelectMapZombie.GamepadButton )
	f1_local0:registerEventHandler( "open_menu", CoD.SelectMapZombie.OpenMenu )
	f1_local0.currentMapIndex = 1
	f1_local0.m_inputDisabled = true
	Engine.Exec( f1_arg0, "loadcommonff" )
	return f1_local0
end

CoD.SelectMapZombie.OpenMenu = function ( f4_arg0, f4_arg1 )
	if f4_arg1.menuName ~= nil and CoD.Zombie.OpenMenuEventMenuNames[f4_arg1.menuName] == 1 and not f4_arg0.skipOpenMenuEvent and not f4_arg0.m_inputDisabled then
		if f4_arg1.menuName == "MainLobby" then
			CoD.GameGlobeZombie.gameGlobe.skipOpenMenuWhenAnimFinishs = true
			CoD.SelectMapZombie.HideMapInfo( f4_arg0 )
			CoD.GameMoonZombie.Reset()
			CoD.GameGlobeZombie.MoveToCorner( f4_arg1.controller )
		end
		CoD.Lobby.OpenMenu( f4_arg0, f4_arg1 )
	end
	f4_arg0.skipOpenMenuEvent = nil
end

CoD.SelectMapZombie.GetMaps = function ( f5_arg0, f5_arg1 )
	local f5_local0, f5_local1 = nil
	if Engine.GameModeIsMode( CoD.GAMEMODE_PUBLIC_MATCH ) == true then
		f5_local1 = Engine.GetPlaylistSuperCategories()
	else
		f5_local0 = Engine.GetMaps()
		f5_local1 = {}
		for f5_local5, f5_local6 in pairs( f5_local0 ) do
			if f5_local6.loadName == CoD.Zombie.MAP_ZM_TRANSIT or string.find( f5_local6.loadName, CoD.Zombie.MAP_ZM_TRANSIT ) == nil then
				table.insert( f5_local1, f5_local6 )
			end
		end
	end
	table.sort( f5_local1, CoD.SelectMapZombie.SortMapsFunc )
	return f5_local1
end

CoD.SelectMapZombie.SortMapsFunc = function ( f6_arg0, f6_arg1 )
	local f6_local0 = nil
	f6_arg0.loadName, f6_local0 = string.gsub( f6_arg0.loadName, "_solo", "", 1 )
	f6_arg1.loadName, f6_local0 = string.gsub( f6_arg1.loadName, "_solo", "", 1 )
	return tonumber( UIExpression.TableLookup( nil, UIExpression.GetCurrentMapTableName(), 0, f6_arg0.loadName, 16 ) ) < tonumber( UIExpression.TableLookup( nil, UIExpression.GetCurrentMapTableName(), 0, f6_arg1.loadName, 16 ) )
end

CoD.SelectMapZombie.GetMapIndexFromPlaylistSuperCategoryID = function ( f7_arg0, f7_arg1 )
	local f7_local0 = 1
	for f7_local1 = 1, f7_arg0.mapCount, 1 do
		if f7_arg0.mapInfos[f7_local1].superCategoryIndex == f7_arg1 then
			f7_local0 = f7_local1
			break
		end
	end
	return f7_local0
end

CoD.SelectMapZombie.GetMapIndexFromMapLoadName = function ( f8_arg0, f8_arg1 )
	local f8_local0 = 1
	for f8_local1 = 1, f8_arg0.mapCount, 1 do
		if f8_arg0.mapInfos[f8_local1].loadName == f8_arg1 then
			f8_local0 = f8_local1
			break
		end
	end
	return f8_local0
end

CoD.SelectMapZombie.GetFirstMapIndex = function ( f9_arg0, f9_arg1, f9_arg2 )
	local f9_local0 = nil
	local f9_local1 = 1
	local f9_local2 = 0
	if Engine.GameModeIsMode( CoD.GAMEMODE_PUBLIC_MATCH ) == true then
		if f9_arg2 == true then
			f9_local2 = CoD.Zombie.PlayListCurrentSuperCategoryIndex
		else
			f9_local2 = Engine.GetPlaylistSuperCategoryID( UIExpression.ProfileInt( f9_arg1, "playlist_" .. CoD.PlaylistCategoryFilter ) )
		end
		f9_local1 = CoD.SelectMapZombie.GetMapIndexFromPlaylistSuperCategoryID( f9_arg0, f9_local2 )
	else
		f9_local0 = UIExpression.ProfileValueAsString( f9_arg1, CoD.profileKey_map )
		if f9_local0 == nil or f9_local0 == "" then
			f9_local0 = CoD.Zombie.MAP_ZM_TRANSIT
		end
		f9_local1 = CoD.SelectMapZombie.GetMapIndexFromMapLoadName( f9_arg0, f9_local0 )
	end
	return f9_local1
end

CoD.SelectMapZombie.GoToFirstMap = function ( f10_arg0, f10_arg1, f10_arg2 )
	local f10_local0 = CoD.SelectMapZombie.GetFirstMapIndex( f10_arg0.currentMenu, f10_arg1, f10_arg2 )
	f10_arg0.currentMenu.currentMapIndex = f10_local0
	f10_arg0.isGoToFirstMap = true
	CoD.SelectMapZombie.GoToFirstMap_Globe( f10_arg0.currentMenu, f10_local0, f10_arg2 )
	CoD.GameMoonZombie.MapMoveStart( f10_arg1 )
end

CoD.SelectMapZombie.GoToFirstMap_Globe = function ( f11_arg0, f11_arg1, f11_arg2 )
	local f11_local0 = f11_arg0.mapInfos[f11_arg1].originalLongitude
	local f11_local1 = f11_arg0.mapInfos[f11_arg1].originalLatitude
	local f11_local2 = 0
	local f11_local3 = 0
	local f11_local4 = 0
	local f11_local5 = 0
	local f11_local6 = 0
	local f11_local7 = false
	local f11_local8 = 0
	local f11_local9, f11_local10, f11_local11, f11_local12 = CoD.GameGlobeZombie.gameGlobe:getShaderVector2()
	if f11_local9 ~= nil and f11_local10 ~= nil and f11_local11 ~= nil and f11_local12 ~= nil then
		CoD.GameGlobeZombie.XRotCurrent = f11_local9
		CoD.GameGlobeZombie.YRotCurrent = CoD.SelectMapZombie.GetLongitudeWithinRange( f11_arg0, f11_local10 )
		CoD.GameGlobeZombie.ZRotCurrent = f11_local11
	end
	CoD.GameGlobeZombie.gameGlobe.YRotIncreasing = nil
	CoD.GameGlobeZombie.gameGlobe.nextMapInternLatitude = CoD.GameGlobeZombie.XRotCurrent
	f11_local4 = f11_local0 - CoD.GameGlobeZombie.YRotCurrent
	if f11_local4 < 0 then
		f11_local2 = math.abs( CoD.GameGlobeZombie.ShaderVector2YMax - CoD.GameGlobeZombie.YRotCurrent )
		f11_local4 = f11_local2 + math.abs( f11_local0 - CoD.GameGlobeZombie.ShaderVector2YMin )
		CoD.GameGlobeZombie.gameGlobe.YRotIncreasing = true
		f11_local7 = true
	end
	f11_local5 = CoD.SelectMapZombie.GetRotationTime( f11_arg0, math.abs( f11_local4 ) )
	if f11_arg2 then
		CoD.GameGlobeZombie.gameGlobe:beginAnimation( "next_map", 1 )
		CoD.GameGlobeZombie.gameGlobe:setAlpha( 1 )
		CoD.GameGlobeZombie.gameGlobe:setZoom( 0 )
		CoD.GameGlobeZombie.gameGlobe:setShaderVector( 2, f11_local1, f11_local0, CoD.GameGlobeZombie.ShaderVector2Z, 0 )
	elseif f11_local7 then
		f11_local6 = f11_local2 / f11_local4
		f11_local8 = CoD.GameGlobeZombie.ShaderVector2YMax
		CoD.GameGlobeZombie.gameGlobe.nextMapInternTimeLeft = f11_local5 * (1 - f11_local6)
		CoD.GameGlobeZombie.gameGlobe.nextMapInternLatitude = CoD.GameGlobeZombie.XRotCurrent + (f11_local1 - CoD.GameGlobeZombie.XRotCurrent) * f11_local6
		CoD.GameGlobeZombie.gameGlobe:beginAnimation( "next_map_intern", f11_local5 * f11_local6 )
		CoD.GameGlobeZombie.gameGlobe:setAlpha( 1 )
		CoD.GameGlobeZombie.gameGlobe:setZoom( 0 )
		CoD.GameGlobeZombie.gameGlobe:setShaderVector( 2, CoD.GameGlobeZombie.gameGlobe.nextMapInternLatitude, f11_local8, CoD.GameGlobeZombie.ShaderVector2Z, 0 )
		CoD.GameGlobeZombie.gameGlobe:registerAnimationState( "next_map", {
			alpha = 1,
			zoom = 0,
			shaderVector2 = {
				f11_local1,
				f11_local0,
				CoD.GameGlobeZombie.ShaderVector2Z,
				0
			}
		} )
	else
		CoD.GameGlobeZombie.gameGlobe:beginAnimation( "next_map", f11_local5 )
		CoD.GameGlobeZombie.gameGlobe:setAlpha( 1 )
		CoD.GameGlobeZombie.gameGlobe:setZoom( 0 )
		CoD.GameGlobeZombie.gameGlobe:setShaderVector( 2, f11_local1, f11_local0, CoD.GameGlobeZombie.ShaderVector2Z, 0 )
	end
end

CoD.SelectMapZombie.GoToFirstMap_MapInfo = function ( f12_arg0, f12_arg1 )
	local f12_local0 = CoD.SelectMapZombie.MapInfoRotatingLongitudeOrigin - f12_arg0.mapInfos[f12_arg1].originalLongitude
	local f12_local1, f12_local2, f12_local3, f12_local4, f12_local5 = nil
	CoD.SelectMapZombie.UpdateMapInfoPlacingLatitude( f12_arg0, f12_arg1 )
	for f12_local6 = 1, f12_arg0.mapCount, 1 do
		f12_local1 = f12_arg0.mapInfos[f12_local6]
		f12_local1.longitude = CoD.SelectMapZombie.GetLongitudeWithinRange( f12_arg0, f12_local1.longitude + f12_local0 )
		f12_local2, f12_local3, f12_local4, f12_local5 = CoD.SelectMapZombie.SphereToCartesian( f12_arg0, CoD.GameGlobeZombie.CenterRadius, f12_local1.longitude, f12_local1.mapInfoPlaceLatitude )
		if CoD.useMouse then
			if f12_local5 == 0 then
				f12_local1.mouseButton:setHandleMouse( false )
			else
				f12_local1.mouseButton:setHandleMouse( true )
			end
		end
		local f12_local9 = f12_local2 - 0.5 * CoD.SelectMapZombie.MapInfoWidth
		local f12_local10 = f12_local2 + 0.5 * CoD.SelectMapZombie.MapInfoWidth
		local f12_local11 = -f12_local3 - 0.5 * CoD.SelectMapZombie.MapInfoHeight + CoD.GameGlobeZombie.PlaceYOffSet
		local f12_local12 = -f12_local3 + 0.5 * CoD.SelectMapZombie.MapInfoHeight + CoD.GameGlobeZombie.PlaceYOffSet
		f12_local1:setLeftRight( false, false, f12_local9, f12_local10 )
		f12_local1:setTopBottom( false, false, f12_local11, f12_local12 )
		f12_local1:setAlpha( 0 )
		f12_local1.iconContainer:setScale( 0 )
		if f12_local1.newIcon then
			if f12_local4 == 0 or f12_local5 == 0 then
				f12_local1.hidden = true
			else
				f12_local1.hidden = false
			end
			CoD.SelectMapZombie.UpdateSideNewIcon( f12_local1, f12_local1.mapInfoPlaceLatitude, 0 )
		end
		if f12_local6 == f12_arg1 then
			f12_local1:beginAnimation( "gain_focus", 100 )
			f12_local1.iconContainer:beginAnimation( "gain_focus", 100 )
			f12_local1.iconContainer:setScale( 3 )
			f12_local1:setAlpha( f12_local4 )
			if f12_local1.iconContainer.navCardInstalled == true then
				Engine.PlaySound( "zmb_ui_sq_complete" )
			end
			if f12_local1.newIcon then
				CoD.SelectMapZombie.MoveNewIconToNext( f12_local1, time, true )
			end
		end
		f12_local1:beginAnimation( "first_show", 100 )
		f12_local1.iconContainer:beginAnimation( "first_show", 100 )
		f12_local1.iconContainer:setScale( f12_local5 )
		f12_local1:setAlpha( f12_local4 )
	end
end

CoD.SelectMapZombie.NextMapInternFinish = function ( f13_arg0, f13_arg1 )
	if CoD.GameGlobeZombie.gameGlobe.YRotIncreasing ~= nil then
		if CoD.GameGlobeZombie.gameGlobe.YRotIncreasing == true then
			CoD.GameGlobeZombie.gameGlobe:setAlpha( 1 )
			CoD.GameGlobeZombie.gameGlobe:setZoom( 0 )
			CoD.GameGlobeZombie.gameGlobe:setShaderVector( 2, CoD.GameGlobeZombie.gameGlobe.nextMapInternLatitude, CoD.GameGlobeZombie.ShaderVector2YMin, CoD.GameGlobeZombie.ShaderVector2Z, 0 )
		else
			CoD.GameGlobeZombie.gameGlobe:setAlpha( 1 )
			CoD.GameGlobeZombie.gameGlobe:setZoom( 0 )
			CoD.GameGlobeZombie.gameGlobe:setShaderVector( 2, CoD.GameGlobeZombie.gameGlobe.nextMapInternLatitude, CoD.GameGlobeZombie.ShaderVector2YMax, CoD.GameGlobeZombie.ShaderVector2Z, 0 )
		end
	end
	CoD.GameGlobeZombie.gameGlobe:animateToState( "next_map", CoD.GameGlobeZombie.gameGlobe.nextMapInternTimeLeft )
end

CoD.SelectMapZombie.GoToMap = function ( f14_arg0, f14_arg1, f14_arg2, f14_arg3 )
	Engine.PlaySound( "zmb_ui_globe_spin_start" )
	CoD.GameGlobeZombie.gameGlobe.currentMenu.m_inputDisabled = true
	CoD.SelectMapZombie.GoToMap_Globe( f14_arg0, f14_arg1, f14_arg2, f14_arg3 )
	CoD.SelectMapZombie.GoToMap_MapInfo( f14_arg0, f14_arg1, f14_arg2, f14_arg3 )
end

CoD.SelectMapZombie.GetRotationTime = function ( f15_arg0, f15_arg1 )
	local f15_local0 = CoD.SelectMapZombie.GlobeMapSelectionRotationTimeMedium
	if f15_arg1 < math.pi / 3 then
		f15_local0 = CoD.SelectMapZombie.GlobeMapSelectionRotationTimeShort
	elseif f15_arg1 < math.pi then
		f15_local0 = CoD.SelectMapZombie.GlobeMapSelectionRotationTimeMedium
	elseif f15_arg1 < math.pi * 1.5 then
		f15_local0 = CoD.SelectMapZombie.GlobeMapSelectionRotationTimeLong
	else
		f15_local0 = CoD.SelectMapZombie.GlobeMapSelectionRotationTimeLongest
	end
	return f15_local0
end

CoD.SelectMapZombie.GoToMap_Globe = function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3 )
	local f16_local0 = f16_arg0.mapInfos[f16_arg2].originalLongitude
	local f16_local1 = f16_arg0.mapInfos[f16_arg2].originalLatitude
	local f16_local2 = 0
	local f16_local3 = 0
	local f16_local4 = 0
	local f16_local5 = 0
	local f16_local6 = 0
	local f16_local7 = false
	local f16_local8 = false
	local f16_local9 = 0
	local f16_local10, f16_local11, f16_local12, f16_local13 = CoD.GameGlobeZombie.gameGlobe:getShaderVector2()
	if f16_local10 ~= nil and f16_local11 ~= nil and f16_local12 ~= nil and f16_local13 ~= nil then
		CoD.GameGlobeZombie.XRotCurrent = f16_local10
		CoD.GameGlobeZombie.YRotCurrent = f16_local11
		CoD.GameGlobeZombie.ZRotCurrent = f16_local12
	end
	CoD.GameGlobeZombie.gameGlobe.YRotIncreasing = nil
	CoD.GameGlobeZombie.gameGlobe.nextMapInternLatitude = CoD.GameGlobeZombie.XRotCurrent
	if f16_arg1 == 0 then
		f16_local4 = CoD.GameGlobeZombie.YRotCurrent - f16_local0
	elseif f16_arg1 == 1 and f16_arg2 == f16_arg0.mapCount and f16_arg3 == true then
		f16_local2 = math.abs( CoD.GameGlobeZombie.YRotCurrent - CoD.GameGlobeZombie.ShaderVector2YMin )
		f16_local4 = f16_local2 + math.abs( CoD.GameGlobeZombie.ShaderVector2YMax - f16_local0 )
		CoD.GameGlobeZombie.gameGlobe.YRotIncreasing = false
		f16_local7 = true
	elseif f16_arg1 == f16_arg0.mapCount and f16_arg2 == 1 and f16_arg3 == false then
		f16_local2 = math.abs( CoD.GameGlobeZombie.ShaderVector2YMax - CoD.GameGlobeZombie.YRotCurrent )
		f16_local4 = f16_local2 + math.abs( f16_local0 - CoD.GameGlobeZombie.ShaderVector2YMin )
		CoD.GameGlobeZombie.gameGlobe.YRotIncreasing = true
		f16_local7 = true
		f16_local8 = true
	else
		f16_local4 = math.abs( f16_local0 - CoD.GameGlobeZombie.YRotCurrent )
	end
	f16_local5 = CoD.SelectMapZombie.GetRotationTime( f16_arg0, math.abs( f16_local4 ) )
	if f16_local7 then
		f16_local6 = f16_local2 / f16_local4
		if f16_local8 then
			f16_local9 = CoD.GameGlobeZombie.ShaderVector2YMax
		else
			f16_local9 = CoD.GameGlobeZombie.ShaderVector2YMin
		end
		CoD.GameGlobeZombie.gameGlobe.nextMapInternTimeLeft = f16_local5 * (1 - f16_local6)
		CoD.GameGlobeZombie.gameGlobe.nextMapInternLatitude = CoD.GameGlobeZombie.XRotCurrent + (f16_local1 - CoD.GameGlobeZombie.XRotCurrent) * f16_local6
		CoD.GameGlobeZombie.gameGlobe:beginAnimation( "next_map_intern", f16_local5 * f16_local6 )
		CoD.GameGlobeZombie.gameGlobe:setAlpha( 1 )
		CoD.GameGlobeZombie.gameGlobe:setZoom( 0 )
		CoD.GameGlobeZombie.gameGlobe:setShaderVector( 2, CoD.GameGlobeZombie.gameGlobe.nextMapInternLatitude, f16_local9, CoD.GameGlobeZombie.ShaderVector2Z, 0 )
		CoD.GameGlobeZombie.gameGlobe:registerAnimationState( "next_map", {
			alpha = 1,
			zoom = 0,
			shaderVector2 = {
				f16_local1,
				f16_local0,
				CoD.GameGlobeZombie.ShaderVector2Z,
				0
			}
		} )
	else
		CoD.GameGlobeZombie.gameGlobe:beginAnimation( "next_map", f16_local5 )
		CoD.GameGlobeZombie.gameGlobe:setAlpha( 1 )
		CoD.GameGlobeZombie.gameGlobe:setZoom( 0 )
		CoD.GameGlobeZombie.gameGlobe:setShaderVector( 2, f16_local1, f16_local0, CoD.GameGlobeZombie.ShaderVector2Z, 0 )
	end
end

CoD.SelectMapZombie.GoToMap_MapInfo = function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3 )
	local f17_local0 = f17_arg0.mapInfos[f17_arg2].originalLongitude
	local f17_local1 = f17_arg0.mapInfos[f17_arg2].originalLatitude
	local f17_local2 = 0
	local f17_local3 = 0
	local f17_local4 = 0
	local f17_local5 = 0
	local f17_local6 = 0
	local f17_local7 = 0
	local f17_local8 = 0
	local f17_local9, f17_local10, f17_local11, f17_local12, f17_local13, f17_local14, f17_local15, f17_local16, f17_local17 = nil
	if f17_arg1 == 0 then
		f17_local5 = CoD.SelectMapZombie.MapInfoRotatingLongitudeOrigin - f17_local0
	else
		f17_local7 = f17_arg0.mapInfos[f17_arg1].originalLongitude
		if f17_arg1 == 1 and f17_arg2 == f17_arg0.mapCount and f17_arg3 == true then
			f17_local5 = f17_local7 - CoD.GameGlobeZombie.ShaderVector2YMin + CoD.GameGlobeZombie.ShaderVector2YMax - f17_local0
		elseif f17_arg1 == f17_arg0.mapCount and f17_arg2 == 1 and f17_arg3 == false then
			f17_local5 = -(CoD.GameGlobeZombie.ShaderVector2YMax - f17_local7 + f17_local0 - CoD.GameGlobeZombie.ShaderVector2YMin)
		else
			f17_local5 = f17_local7 - f17_local0
		end
	end
	f17_local6 = f17_arg0.mapInfos[f17_arg1].originalLatitude - f17_local1
	f17_local2 = CoD.SelectMapZombie.GetRotationTime( f17_arg0, math.abs( f17_local5 ) )
	for f17_local18 = 1, f17_arg0.mapCount, 1 do
		f17_local9 = f17_arg0.mapInfos[f17_local18]
		f17_local9.isYRotIncreasing = f17_arg3
		f17_local9.currLongitude = f17_local9.longitude
		f17_local9.deltaLongitude = f17_local5
		f17_local9.longitude = CoD.SelectMapZombie.GetLongitudeWithinRange( f17_arg0, f17_local9.currLongitude + f17_local9.deltaLongitude )
		f17_local9.currLatitude = f17_local9.latitude
		f17_local9.deltaLatitude = f17_local6
		f17_local9.latitude = CoD.SelectMapZombie.GetLatitudeWithinRange( f17_arg0, f17_local9.currLatitude + f17_local9.deltaLatitude )
		f17_local9.deltaToEnd = math.abs( f17_local9.deltaLongitude )
		f17_local9.rotateTotalTime = f17_local2
		f17_local9.rotateAccumulatedTime = 0
		CoD.SelectMapZombie.MapInfoMoveToNextStart( f17_arg0, f17_local9, f17_arg3 )
	end
end

CoD.SelectMapZombie.MapInfoMoveToNextStart = function ( f18_arg0, f18_arg1, f18_arg2 )
	local f18_local0 = 0
	f18_arg1.startPathNodeIndex = CoD.SelectMapZombie.GetMapInfoPathNodeIndex( f18_arg0, f18_arg1.currLongitude, f18_arg1.isYRotIncreasing, true )
	f18_arg1.endPathNodeIndex = CoD.SelectMapZombie.GetMapInfoPathNodeIndex( f18_arg0, f18_arg1.longitude, f18_arg1.isYRotIncreasing )
	local f18_local1 = true
	if math.abs( f18_arg1.deltaLongitude ) < CoD.SelectMapZombie.MapInfoRotatingPathDeltaLongitude or f18_arg1.startPathNodeIndex == 0 or f18_arg1.endPathNodeIndex == 0 then
		f18_local1 = false
	end
	if f18_local1 == true then
		f18_arg1.currPathNodeIndex = f18_arg1.startPathNodeIndex
		f18_local0 = f18_arg1.rotateTotalTime * (CoD.SelectMapZombie.MapInfoRotatingPathNodes[f18_arg1.currPathNodeIndex].longitude - f18_arg1.currLongitude) / f18_arg1.deltaLongitude
		f18_arg1.deltaToEnd = f18_arg1.deltaToEnd - math.abs( CoD.SelectMapZombie.MapInfoRotatingPathNodes[f18_arg1.currPathNodeIndex].longitude - f18_arg1.currLongitude )
		CoD.SelectMapZombie.MapInfoMoveToNext( f18_arg0, f18_arg1, f18_local0 )
	else
		f18_arg1.currPathNodeIndex = nil
		CoD.SelectMapZombie.MapInfoMoveToNext( f18_arg0, f18_arg1, f18_arg1.rotateTotalTime )
	end
end

CoD.SelectMapZombie.MapInfoMoveToNext = function ( f19_arg0, f19_arg1, f19_arg2 )
	local f19_local0 = 0
	local f19_local1 = 0
	if f19_arg1.currPathNodeIndex ~= nil then
		f19_arg1.rotateAccumulatedTime = f19_arg1.rotateAccumulatedTime + f19_arg2
		f19_local0 = CoD.SelectMapZombie.MapInfoRotatingPathNodes[f19_arg1.currPathNodeIndex].longitude
		f19_local1 = f19_arg1.currLatitude + f19_arg1.deltaLatitude * f19_arg1.rotateAccumulatedTime / f19_arg1.rotateTotalTime
	else
		f19_local0 = f19_arg1.longitude
		f19_local1 = f19_arg1.latitude
	end
	local f19_local2, f19_local3, f19_local4, f19_local5 = CoD.SelectMapZombie.SphereToCartesian( f19_arg0, CoD.GameGlobeZombie.CenterRadius, f19_local0, f19_local1 )
	if CoD.useMouse then
		if f19_local5 == 0 then
			f19_arg1.mouseButton:setHandleMouse( false )
		else
			f19_arg1.mouseButton:setHandleMouse( true )
		end
	end
	local f19_local6 = f19_local2
	local f19_local7 = -f19_local3 + CoD.GameGlobeZombie.PlaceYOffSet
	local f19_local8 = f19_local2 - 0.5 * CoD.SelectMapZombie.MapInfoWidth
	local f19_local9 = f19_local2 + 0.5 * CoD.SelectMapZombie.MapInfoWidth
	local f19_local10 = -f19_local3 - 0.5 * CoD.SelectMapZombie.MapInfoHeight + CoD.GameGlobeZombie.PlaceYOffSet
	local f19_local11 = -f19_local3 + 0.5 * CoD.SelectMapZombie.MapInfoHeight + CoD.GameGlobeZombie.PlaceYOffSet
	f19_arg1:beginAnimation( "move_to_next", f19_arg2 )
	f19_arg1:setLeftRight( false, false, f19_local8, f19_local9 )
	f19_arg1:setTopBottom( false, false, f19_local10, f19_local11 )
	f19_arg1:setAlpha( f19_local4 )
	f19_arg1.iconContainer:beginAnimation( "move_to_next", f19_arg2 )
	f19_arg1.iconContainer:setScale( f19_local5 )
	if f19_arg1.newIcon then
		CoD.SelectMapZombie.MoveNewIconToNext( f19_arg1, f19_arg2 )
		if f19_local4 == 0 then
			f19_arg1.newIcon:setAlpha( 0 )
			f19_arg1.hidden = true
		else
			f19_arg1.newIcon:setAlpha( f19_local4 )
			f19_arg1.hidden = false
		end
		CoD.SelectMapZombie.UpdateSideNewIcon( f19_arg1, f19_local1, f19_arg2 )
	end
end

CoD.SelectMapZombie.UpdateSideNewIcon = function ( f20_arg0, f20_arg1, f20_arg2 )
	local f20_local0, f20_local1, f20_local2, f20_local3 = nil
	local f20_local4 = 0
	local f20_local5 = 0
	local f20_local6 = 0
	local f20_local7 = 0
	local f20_local8 = 0
	local f20_local9 = CoD.GameGlobeZombie.CenterRadius + CoD.SelectMapZombie.SideNewIconsRadiusAddOn
	local f20_local10 = f20_arg0:getParent()
	f20_local10 = f20_local10:getParent()
	local f20_local11 = f20_local10.currentMapIndex
	local f20_local12 = 0
	f20_local0, f20_local1, f20_local2, f20_local3 = CoD.SelectMapZombie.SphereToCartesian( self, f20_local9, f20_local8, f20_arg1 * CoD.SelectMapZombie.SideNewIconsLatitudeScale )
	f20_local4 = f20_local0 - 0.5 * CoD.SelectMapZombie.MapInfoNewIconWidth + f20_local12
	f20_local5 = f20_local0 + 0.5 * CoD.SelectMapZombie.MapInfoNewIconWidth + f20_local12
	f20_local6 = -f20_local1 - 0.5 * CoD.SelectMapZombie.MapInfoNewIconHeight + CoD.GameGlobeZombie.PlaceYOffSet
	f20_local7 = -f20_local1 + 0.5 * CoD.SelectMapZombie.MapInfoNewIconHeight + CoD.GameGlobeZombie.PlaceYOffSet
	f20_arg0.leftSideNewIcon:beginAnimation( "move", f20_arg2 )
	f20_arg0.leftSideNewIcon:setLeftRight( false, false, f20_local4, f20_local5 )
	f20_arg0.leftSideNewIcon:setTopBottom( false, false, f20_local6, f20_local7 )
	if f20_local11 < f20_arg0.index and f20_arg0.hidden then
		f20_arg0.leftSideNewIcon:setScale( 1 )
		f20_arg0.leftSideNewIcon:setAlpha( 1 )
	else
		f20_arg0.leftSideNewIcon:setScale( 0.5 )
		f20_arg0.leftSideNewIcon:setAlpha( 0 )
	end
	f20_local8 = CoD.GameGlobeZombie.ShaderVector2YMax
	f20_local12 = f20_local12 + CoD.SelectMapZombie.SideNewIconsLeftOffSet
	f20_local0, f20_local1, f20_local2, f20_local3 = CoD.SelectMapZombie.SphereToCartesian( self, f20_local9, f20_local8, f20_arg1 * CoD.SelectMapZombie.SideNewIconsLatitudeScale )
	f20_local4 = f20_local0 - 0.5 * CoD.SelectMapZombie.MapInfoNewIconWidth + f20_local12
	f20_local5 = f20_local0 + 0.5 * CoD.SelectMapZombie.MapInfoNewIconWidth + f20_local12
	f20_local6 = -f20_local1 - 0.5 * CoD.SelectMapZombie.MapInfoNewIconHeight + CoD.GameGlobeZombie.PlaceYOffSet
	f20_local7 = -f20_local1 + 0.5 * CoD.SelectMapZombie.MapInfoNewIconHeight + CoD.GameGlobeZombie.PlaceYOffSet
	f20_arg0.rightSideNewIcon:beginAnimation( "move", f20_arg2 )
	f20_arg0.rightSideNewIcon:setLeftRight( false, false, f20_local4, f20_local5 )
	f20_arg0.rightSideNewIcon:setTopBottom( false, false, f20_local6, f20_local7 )
	if f20_arg0.index < f20_local11 and f20_arg0.hidden then
		f20_arg0.rightSideNewIcon:setScale( 1 )
		f20_arg0.rightSideNewIcon:setAlpha( 1 )
	else
		f20_arg0.rightSideNewIcon:setScale( 0.5 )
		f20_arg0.rightSideNewIcon:setAlpha( 0 )
	end
end

CoD.SelectMapZombie.GetMapInfoPathNodeIndex = function ( f21_arg0, f21_arg1, f21_arg2, f21_arg3 )
	for f21_local0 = 1, CoD.SelectMapZombie.MapInfoRotatingPathNodesCount, 1 do
		if f21_arg1 <= CoD.SelectMapZombie.MapInfoRotatingPathNodes[f21_local0].longitude then
			if f21_arg2 == true then
				if f21_arg3 == true then
					return f21_local0
				end
				return f21_local0 - 1
			elseif f21_arg3 == true then
				return f21_local0 - 1
			end
			return f21_local0
		end
	end
end

CoD.SelectMapZombie.MapInfoMoveToNextFinish = function ( f22_arg0, f22_arg1 )
	if f22_arg1.interrupted ~= true then
		local f22_local0 = 0
		local f22_local1 = 0
		local f22_local2 = 0
		local f22_local3 = f22_arg0:getParent()
		f22_local3 = f22_local3:getParent()
		if f22_arg0.currPathNodeIndex == nil then
			if f22_arg0 == CoD.GameGlobeZombie.gameGlobe.currentMenu.mapInfos[CoD.GameGlobeZombie.gameGlobe.currentMenu.currentMapIndex] then
				f22_arg0:beginAnimation( "gain_focus", 100 )
				f22_arg0.iconContainer:beginAnimation( "gain_focus", 100 )
				f22_arg0.iconContainer:setScale( 3 )
				if f22_arg0.iconContainer.navCardInstalled == true then
					Engine.PlaySound( "zmb_ui_sq_complete" )
				end
				if f22_arg0.newIcon then
					CoD.SelectMapZombie.MoveNewIconToNext( f22_arg0, 100, true )
				end
			end
		elseif f22_arg0.deltaToEnd < math.pi * 2 and (f22_arg0.currPathNodeIndex == f22_arg0.endPathNodeIndex or f22_arg0.currPathNodeIndex == CoD.SelectMapZombie.MapInfoRotatingPathNodesCount and f22_arg0.endPathNodeIndex == 1) then
			if f22_arg0.currPathNodeIndex == CoD.SelectMapZombie.MapInfoRotatingPathNodesCount and f22_arg0.endPathNodeIndex == 1 then
				f22_local1 = CoD.SelectMapZombie.MapInfoRotatingPathNodes[1].longitude
			else
				f22_local1 = CoD.SelectMapZombie.MapInfoRotatingPathNodes[f22_arg0.currPathNodeIndex].longitude
			end
			f22_local0 = CoD.SelectMapZombie.GetRotationTime( self, math.abs( f22_arg0.deltaLongitude ) ) * (f22_arg0.longitude - f22_local1) / f22_arg0.deltaLongitude
			f22_arg0.currPathNodeIndex = nil
			CoD.SelectMapZombie.MapInfoMoveToNext( self, f22_arg0, f22_local0 )
		else
			f22_local1 = CoD.SelectMapZombie.MapInfoRotatingPathNodes[f22_arg0.currPathNodeIndex].longitude
			if f22_arg0.isYRotIncreasing == true then
				f22_arg0.currPathNodeIndex = f22_arg0.currPathNodeIndex + 1
				if f22_arg0.currPathNodeIndex > CoD.SelectMapZombie.MapInfoRotatingPathNodesCount then
					f22_arg0.currPathNodeIndex = 2
					f22_local1 = CoD.SelectMapZombie.MapInfoRotatingPathNodes[1].longitude
				end
			else
				f22_arg0.currPathNodeIndex = f22_arg0.currPathNodeIndex - 1
				if f22_arg0.currPathNodeIndex < 1 then
					f22_arg0.currPathNodeIndex = CoD.SelectMapZombie.MapInfoRotatingPathNodesCount - 1
					f22_local1 = CoD.SelectMapZombie.MapInfoRotatingPathNodes[CoD.SelectMapZombie.MapInfoRotatingPathNodesCount].longitude
				end
			end
			f22_local2 = CoD.SelectMapZombie.MapInfoRotatingPathNodes[f22_arg0.currPathNodeIndex].longitude
			f22_local0 = CoD.SelectMapZombie.GetRotationTime( self, math.abs( f22_arg0.deltaLongitude ) ) * (f22_local2 - f22_local1) / f22_arg0.deltaLongitude
			f22_arg0.deltaToEnd = f22_arg0.deltaToEnd - math.abs( f22_local2 - f22_local1 )
			CoD.SelectMapZombie.MapInfoMoveToNext( self, f22_arg0, f22_local0 )
		end
	end
end

CoD.SelectMapZombie.UpdateMapInfoPlacingLatitude = function ( f23_arg0, f23_arg1 )
	local f23_local0 = f23_arg0.mapInfos[f23_arg1]
	local f23_local1 = nil
	for f23_local2 = 1, f23_arg0.mapCount, 1 do
		f23_local1 = f23_arg0.mapInfos[f23_local2]
		f23_local1.mapInfoPlaceLatitude = f23_local1.originalLatitude - f23_local0.originalLatitude
		f23_local1.latitude = f23_local1.mapInfoPlaceLatitude
	end
end

CoD.SelectMapZombie.GamepadButton = function ( f24_arg0, f24_arg1 )
	local f24_local0 = 3
	if f24_arg0.m_inputDisabled or f24_arg0.m_ownerController ~= f24_arg1.controller then
		return 
	elseif CoD.GameGlobeZombie.gameGlobe.isGoToFirstMap == true then
		return 
	elseif f24_local0 <= #CoD.SelectMapZombie.MapRotationInput then
		return 
	elseif f24_arg1.down == true then
		local f24_local1 = f24_arg0.currentMapIndex
		local f24_local2 = f24_arg0.mapInfos[f24_arg0.currentMapIndex]
		local f24_local3 = #CoD.SelectMapZombie.MapRotationInput
		local f24_local4, f24_local5 = false
		if f24_arg1.button == "left" then
			if CoD.SelectMapZombie.DisableCycleRotation == false then
				f24_arg0.currentMapIndex = f24_arg0.currentMapIndex % f24_arg0.mapCount + 1
			else
				f24_arg0.currentMapIndex = f24_arg0.currentMapIndex + 1
				if f24_arg0.mapCount < f24_arg0.currentMapIndex then
					f24_arg0.currentMapIndex = f24_arg0.mapCount
				end
			end
			f24_local4 = true
			f24_local5 = false
		elseif f24_arg1.button == "right" then
			if CoD.SelectMapZombie.DisableCycleRotation == false then
				f24_arg0.currentMapIndex = f24_arg0.currentMapIndex - 1
				if f24_arg0.currentMapIndex == 0 then
					f24_arg0.currentMapIndex = f24_arg0.mapCount
				end
			else
				f24_arg0.currentMapIndex = f24_arg0.currentMapIndex - 1
				if f24_arg0.currentMapIndex == 0 then
					f24_arg0.currentMapIndex = 1
				end
			end
			f24_local4 = true
			f24_local5 = true
		elseif f24_arg1.button == "primary" and f24_local3 == 0 then
			CoD.GameMoonZombie.Reset()
			CoD.GameGlobeZombie.MoveUp( f24_arg1.controller )
			Engine.SetDvar( "ui_mapname", f24_local2.loadName )
			Engine.SetDvar( "ui_zm_mapstartlocation", CoD.Zombie.GetDefaultStartLocationForMap() )
			Engine.SetDvar( "ui_zm_gamemodegroup", CoD.Zombie.GetDefaultGameTypeGroupForMap() )
			Engine.SetDvar( "ui_gametype", CoD.Zombie.GetDefaultGameTypeForMap() )
			Engine.Exec( f24_arg1.controller, "xupdatepartystate" )
			if Engine.GameModeIsMode( CoD.GAMEMODE_PUBLIC_MATCH ) == true then
				CoD.Zombie.PlayListCurrentSuperCategoryIndex = f24_local2.superCategoryIndex
			else
				Engine.SetProfileVar( controller, CoD.profileKey_map, f24_local2.loadName )
			end
			f24_arg0:openMenu( "SelectStartLocZM", f24_arg1.controller )
			f24_arg0:close()
		end
		if f24_local4 and f24_local1 ~= f24_arg0.currentMapIndex then
			CoD.SelectMapZombie.MapRotationInput[f24_local3 + 1] = {
				currentMapIndex = f24_local1,
				nextMapIndex = f24_arg0.currentMapIndex,
				yRotInc = f24_local5
			}
			if f24_local3 == 0 then
				CoD.SelectMapZombie.GoToMap( f24_arg0, f24_local1, f24_arg0.currentMapIndex, f24_local5 )
			end
		end
	end
	return f24_arg0:dispatchEventToChildren( f24_arg1 )
end

CoD.SelectMapZombie.MoveNewIconToNext = function ( f25_arg0, f25_arg1, f25_arg2 )
	local f25_local0 = CoD.SelectMapZombie.MapInfoNewIconWidth
	local f25_local1 = CoD.SelectMapZombie.MapInfoNewIconHeight
	local f25_local2, f25_local3 = nil
	local f25_local4 = "top"
	if CoD.SelectMapZombie.NewIconOffsetDirectionTable[f25_arg0.newIconPlacement] then
		f25_local4 = f25_arg0.newIconPlacement
	end
	if f25_arg2 == true then
		f25_local2 = CoD.SelectMapZombie.NewIconZoomOffsetDirectionTable[f25_local4].width
		f25_local3 = CoD.SelectMapZombie.NewIconZoomOffsetDirectionTable[f25_local4].height
	else
		f25_local2 = CoD.SelectMapZombie.NewIconOffsetDirectionTable[f25_local4].width
		f25_local3 = CoD.SelectMapZombie.NewIconOffsetDirectionTable[f25_local4].height
	end
	f25_arg0.newIcon:beginAnimation( "move_new_icon_to_next", f25_arg1 )
	f25_arg0.newIcon:setLeftRight( false, false, f25_local2 - f25_local0 / 2, f25_local2 + f25_local0 / 2 )
	f25_arg0.newIcon:setTopBottom( false, false, f25_local3 - f25_local1 / 2, f25_local3 + f25_local1 / 2 )
end

CoD.SelectMapZombie.MouseSelect = function ( f26_arg0, f26_arg1 )
	if #CoD.SelectMapZombie.MapRotationInput > 0 or f26_arg0.m_inputDisabled then
		return 
	end
	local f26_local0 = f26_arg1.button.mapInfo
	local f26_local1 = f26_arg0.currentMapIndex
	local f26_local2 = f26_local0.index
	local f26_local3 = table.getn( f26_arg0.mapInfos )
	if f26_local1 == f26_local2 then
		f26_arg0:processEvent( {
			name = "gamepad_button",
			controller = f26_arg1.controller,
			button = "primary",
			down = true
		} )
	else
		local f26_local4, f26_local5 = nil
		if f26_local1 < f26_local2 then
			f26_local4 = f26_local2 - f26_local1
			f26_local5 = f26_local3 - f26_local2 + f26_local1
		else
			f26_local4 = f26_local2 + f26_local3 - f26_local1
			f26_local5 = f26_local1 - f26_local2
		end
		if f26_local4 < f26_local5 or CoD.SelectMapZombie.DisableCycleRotation and f26_local1 < f26_local2 then
			for f26_local6 = 1, f26_local4, 1 do
				local f26_local9 = f26_local6
				f26_arg0:processEvent( {
					name = "gamepad_button",
					controller = f26_arg1.controller,
					button = "left",
					down = true
				} )
			end
		else
			for f26_local6 = 1, f26_local5, 1 do
				local f26_local9 = f26_local6
				f26_arg0:processEvent( {
					name = "gamepad_button",
					controller = f26_arg1.controller,
					button = "right",
					down = true
				} )
			end
		end
	end
end

CoD.SelectMapZombie.MouseDrag = function ( f27_arg0, f27_arg1 )
	if f27_arg0.m_inputDisabled then
		return 
	elseif f27_arg1.direction == "left" then
		f27_arg0:processEvent( {
			name = "gamepad_button",
			controller = f27_arg1.controller,
			button = "right",
			down = true
		} )
	elseif f27_arg1.direction == "right" then
		f27_arg0:processEvent( {
			name = "gamepad_button",
			controller = f27_arg1.controller,
			button = "left",
			down = true
		} )
	end
end

CoD.SelectMapZombie.MouseUp = function ( f28_arg0, f28_arg1 )
	f28_arg0:dispatchEventToChildren( f28_arg1 )
end

CoD.SelectMapZombie.LeavePlayerMatchLobby = function ( f29_arg0, f29_arg1 )
	CoD.SelectMapZombie.HideMapInfo( f29_arg0 )
	CoD.GameMoonZombie.Reset()
	CoD.GameGlobeZombie.MoveToCorner( f29_arg1.controller )
	CoD.resetGameModes()
	if CoD.isPartyHost() then
		CoD.SwitchToMainLobby( f29_arg1.controller )
	else
		Engine.PartyHostClearUIState()
		CoD.StartMainLobby( f29_arg1.controller )
	end
	f29_arg0:setPreviousMenu( "MainLobby" )
end

CoD.SelectMapZombie.LeavePrivateGameLobby = function ( f30_arg0, f30_arg1 )
	CoD.SelectMapZombie.HideMapInfo( f30_arg0 )
	CoD.GameMoonZombie.Reset()
	CoD.GameGlobeZombie.MoveToCorner( f30_arg1.controller )
	Engine.SetDvar( "invite_visible", 1 )
	if Engine.SessionModeIsMode( CoD.SESSIONMODE_SYSTEMLINK ) == true or Engine.SessionModeIsMode( CoD.SESSIONMODE_OFFLINE ) == true then
		Engine.ExecNow( f30_arg1.controller, "xstopparty" )
		Engine.ExecNow( f30_arg1.controller, "xstopprivateparty" )
		CoD.resetGameModes()
	elseif Engine.IsSignedInToDemonware( f30_arg1.controller ) == true and Engine.HasMPPrivileges( f30_arg1.controller ) == true then
		Engine.ExecNow( f30_arg1.controller, "xstoppartykeeptogether" )
		CoD.StartMainLobby( f30_arg1.controller )
	else
		Engine.ExecNow( f30_arg1.controller, "xstopprivateparty" )
		CoD.resetGameModes()
	end
	Engine.SessionModeSetPrivate( false )
	f30_arg0:processEvent( {
		name = "lose_host"
	} )
	Engine.Exec( f30_arg1.controller, "party_updateActiveMenu" )
end

CoD.SelectMapZombie.BackButton = function ( f31_arg0, f31_arg1 )
	if CoD.GameGlobeZombie.gameGlobe.isAnimating then
		return true
	elseif f31_arg0.m_ownerController ~= f31_arg1.controller then
		return true
	elseif f31_arg0.newIconLeft then
		f31_arg0.newIconLeft:close()
	end
	if f31_arg0.newIconRight then
		f31_arg0.newIconRight:close()
	end
	if Engine.GameModeIsMode( CoD.GAMEMODE_PUBLIC_MATCH ) == false and UIExpression.IsPrimaryLocalClient( f31_arg1.controller ) == 0 then
		f31_arg0:openPopup( "NoLeave", controller, leaveHandlerTextTable )
		return true
	elseif not f31_arg0.m_inputDisabled then
		f31_arg0.skipOpenMenuEvent = true
		if Engine.GameModeIsMode( CoD.GAMEMODE_PUBLIC_MATCH ) == true then
			CoD.SelectMapZombie.LeavePlayerMatchLobby( f31_arg0, f31_arg1 )
		else
			CoD.Lobby.ConfirmLeaveGameLobby( f31_arg0, {
				controller = f31_arg1.controller,
				leaveLobbyHandler = CoD.SelectMapZombie.LeavePrivateGameLobby
			} )
		end
	end
end

CoD.SelectMapZombie.HideMapInfo = function ( f32_arg0 )
	for f32_local0 = 1, f32_arg0.mapCount, 1 do
		f32_arg0.mapInfos[f32_local0]:beginAnimation( "hide", 50 )
		f32_arg0.mapInfos[f32_local0]:setAlpha( 0 )
	end
end

CoD.SelectMapZombie.MapRotatingFinish = function ( f33_arg0, f33_arg1 )
	if f33_arg1.interrupted ~= true then
		table.remove( CoD.SelectMapZombie.MapRotationInput, 1 )
		local f33_local0 = #CoD.SelectMapZombie.MapRotationInput
		local f33_local1 = CoD.SelectMapZombie.MapRotationInput[1]
		if f33_local0 == 0 then
			Engine.PlaySound( "zmb_ui_globe_spin_stop" )
			local f33_local2 = f33_arg0.currentMenu.mapInfos[f33_arg0.currentMenu.currentMapIndex]
			if f33_arg0.isGoToFirstMap == true then
				CoD.SelectMapZombie.GoToFirstMap_MapInfo( f33_arg0.currentMenu, f33_arg0.currentMenu.currentMapIndex )
				f33_arg0.isGoToFirstMap = nil
			end
			if CoD.GameGlobeZombie.gameGlobe.currentMenu ~= nil and CoD.GameGlobeZombie.gameGlobe.currentMenu.occludedBy == nil then
				CoD.GameGlobeZombie.gameGlobe.currentMenu.m_inputDisabled = false
			end
		else
			CoD.SelectMapZombie.GoToMap( f33_arg0.currentMenu, f33_local1.currentMapIndex, f33_local1.nextMapIndex, f33_local1.yRotInc )
		end
	else
		if CoD.GameGlobeZombie.gameGlobe.currentMenu ~= nil and CoD.GameGlobeZombie.gameGlobe.currentMenu.occludedBy == nil then
			CoD.GameGlobeZombie.gameGlobe.currentMenu.m_inputDisabled = false
		end
		CoD.SelectMapZombie.MapRotationInput = {}
	end
end

CoD.SelectMapZombie.SphereToCartesian = function ( f34_arg0, f34_arg1, f34_arg2, f34_arg3 )
	local f34_local0 = f34_arg1 * math.cos( f34_arg3 ) * math.cos( f34_arg2 + math.pi )
	local f34_local1 = f34_arg1 * math.sin( f34_arg3 )
	local f34_local2 = math.max( math.min( 4 * (f34_arg1 - math.abs( f34_local0 )) / f34_arg1, 1 ), 0 )
	local f34_local3 = 1
	if math.sin( f34_arg2 ) > 0 then
		f34_local3 = 0
		f34_local2 = 0
	end
	return f34_local0, f34_local1, f34_local3, f34_local2
end

CoD.SelectMapZombie.GetLongitudeWithinRange = function ( f35_arg0, f35_arg1 )
	local f35_local0 = f35_arg1
	while CoD.GameGlobeZombie.ShaderVector2YMax < f35_local0 do
		f35_local0 = f35_local0 - 2 * CoD.GameGlobeZombie.ShaderVector2YMax
	end
	while f35_local0 < CoD.GameGlobeZombie.ShaderVector2YMin do
		f35_local0 = f35_local0 - 2 * CoD.GameGlobeZombie.ShaderVector2YMin
	end
	return f35_local0
end

CoD.SelectMapZombie.GetLatitudeWithinRange = function ( f36_arg0, f36_arg1 )
	local f36_local0 = f36_arg1
	if CoD.GameGlobeZombie.ShaderVector2XMax < f36_local0 then
		f36_local0 = 2 * CoD.GameGlobeZombie.ShaderVector2XMax - f36_local0
	end
	if f36_local0 < CoD.GameGlobeZombie.ShaderVector2XMin then
		f36_local0 = 2 * CoD.GameGlobeZombie.ShaderVector2XMin - f36_local0
	end
	return f36_local0
end

CoD.SelectMapZombie.PulseBright = function ( f37_arg0, f37_arg1 )
	f37_arg0:beginAnimation( "pulse_bright", f37_arg1 )
	f37_arg0:setAlpha( 0.5 )
end

CoD.SelectMapZombie.PulseLow = function ( f38_arg0, f38_arg1 )
	f38_arg0:beginAnimation( "pulse_low", f38_arg1 )
	f38_arg0:setAlpha( 0.1 )
end

CoD.SelectMapZombie.ColorWhite = function ( f39_arg0, f39_arg1 )
	f39_arg0:beginAnimation( "color_white", f39_arg1 )
	f39_arg0:setRGB( 1, 1, 1 )
end

CoD.SelectMapZombie.UpdateMapInfoPosition = function ( f40_arg0, f40_arg1, f40_arg2 )
	f40_arg0.m_xPos = f40_arg1
	f40_arg0.m_yPos = f40_arg2
end

CoD.SelectMapZombie.AnimateMapInfo = function ( f41_arg0, f41_arg1, f41_arg2, f41_arg3, f41_arg4 )
	if not f41_arg0.m_xPos or not f41_arg0.m_yPos then
		return 
	else
		local f41_local0 = f41_arg0.m_halfWidth * f41_arg3
		local f41_local1 = f41_arg0.m_halfHeight * f41_arg3
		f41_arg0:beginAnimation( f41_arg1, f41_arg2 )
		f41_arg0:setLeftRight( false, false, f41_arg0.m_xPos - f41_local0, f41_arg0.m_xPos + f41_local0 )
		f41_arg0:setTopBottom( false, false, f41_arg0.m_yPos - f41_local1, f41_arg0.m_yPos + f41_local1 )
		f41_arg0:setAlpha( f41_arg4 )
	end
end

CoD.MainMenu.OpenMapTransit = function ( f42_arg0, f42_arg1 )
	Engine.PlaySound( "cac_grid_equip" )
	Engine.SetDvar( "ui_gametype", zclassic )
	Engine.SetDvar( "ui_zm_gamemodegroup", zclassic )
	Engine.SetDvar( "ui_zm_mapstartlocation", transit )
--	Engine.SetDvar( "map zm_transit" )
    Engine.Exec( f42_arg1.controller, "startTransit" )
end

CoD.MainMenu.OpenMapBusDepot = function ( f43_arg0, f43_arg1 )
	Engine.PlaySound( "cac_grid_equip" )
	Engine.SetDvar( "ui_gametype", zsurvival )
	Engine.SetDvar( "ui_zm_gamemodegroup", zsurvival )
	Engine.SetDvar( "ui_zm_mapstartlocation", transit )
--	Engine.SetDvar( "map zm_transit" )
--    Engine.Exec( f43_arg1.controller, "startBusDepot" )
end

CoD.MainMenu.OpenMapDiner = function ( f44_arg0, f44_arg1 )
	Engine.PlaySound( "cac_grid_equip" )
	Engine.SetDvar( "ui_gametype", zcleansed )
	Engine.SetDvar( "ui_zm_gamemodegroup", zcleansed )
	Engine.SetDvar( "ui_zm_mapstartlocation", transit_dr )
--	Engine.SetDvar( "map zm_transit_dr" )
--	Engine.Exec( f44_arg1.controller, "StartDiner" )
end

CoD.MainMenu.OpenMapFarm = function ( f45_arg0, f45_arg1 )
	Engine.PlaySound( "cac_grid_equip" )
	Engine.SetDvar( "ui_gametype", zsurvival )
	Engine.SetDvar( "ui_zm_gamemodegroup", zsurvival )
	Engine.SetDvar( "ui_zm_mapstartlocation", farm )
--	Engine.SetDvar( "map zm_farm" )
    Engine.Exec( f45_arg1.controller, "startFarm" )
end

CoD.MainMenu.OpenMapPower = function ( f46_arg0, f46_arg1 )
	Engine.PlaySound( "cac_grid_equip" )
	Engine.SetDvar( "ui_gametype", zsurvival )
	Engine.SetDvar( "ui_zm_gamemodegroup", zsurvival )
	Engine.SetDvar( "ui_zm_mapstartlocation", power )
--	Engine.SetDvar( "map zm_power" )
    Engine.Exec( f46_arg1.controller, "startPower" )
end

CoD.MainMenu.OpenMapTown = function ( f47_arg0, f47_arg1 )
	Engine.PlaySound( "cac_grid_equip" )
	Engine.SetDvar( "ui_gametype", zsurvival )
	Engine.SetDvar( "ui_zm_gamemodegroup", zsurvival )
	Engine.SetDvar( "ui_zm_mapstartlocation", town )
--	Engine.SetDvar( "map zm_town" )
    Engine.Exec( f47_arg1.controller, "startTown" )
end

CoD.MainMenu.OpenMapNuked = function ( f48_arg0, f48_arg1 )
	Engine.PlaySound( "cac_grid_equip" )
	Engine.SetDvar( "ui_gametype", zsurvival )
	Engine.SetDvar( "ui_zm_gamemodegroup", zsurvival )
	Engine.SetDvar( "ui_zm_mapstartlocation", nuked )
--	Engine.SetDvar( "map zm_nuked" )
    Engine.Exec( f48_arg1.controller, "startNuked" )
end

CoD.MainMenu.OpenMapHighrise = function ( f49_arg0, f49_arg1 )
	Engine.PlaySound( "cac_grid_equip" )
	Engine.SetDvar( "ui_gametype", zclassic )
	Engine.SetDvar( "ui_zm_gamemodegroup", zclassic )
	Engine.SetDvar( "ui_zm_mapstartlocation", rooftop )
--	Engine.SetDvar( "map zm_highrise" )
    Engine.Exec( f49_arg1.controller, "startHighrise" )
end

CoD.MainMenu.OpenMapPrison = function ( f50_arg0, f50_arg1 )
	Engine.PlaySound( "cac_grid_equip" )
	Engine.SetDvar( "ui_gametype", zclassic )
	Engine.SetDvar( "ui_zm_gamemodegroup", zclassic )
	Engine.SetDvar( "ui_zm_mapstartlocation", prison )
--	Engine.SetDvar( "map zm_prison" )
    Engine.Exec( f50_arg1.controller, "startPrison" )
end

CoD.MainMenu.OpenMapBuried = function ( f51_arg0, f51_arg1 )
	Engine.PlaySound( "cac_grid_equip" )
	Engine.SetDvar( "ui_gametype", zclassic )
	Engine.SetDvar( "ui_zm_gamemodegroup", zclassic )
	Engine.SetDvar( "ui_zm_mapstartlocation", processing )
--	Engine.SetDvar( "map zm_buried" )
    Engine.Exec( f51_arg1.controller, "startBuried" )
end

CoD.MainMenu.OpenMapTomb = function ( f52_arg0, f52_arg1 )
	Engine.PlaySound( "cac_grid_equip" )
	Engine.SetDvar( "ui_gametype", zclassic )
	Engine.SetDvar( "ui_zm_gamemodegroup", zclassic )
	Engine.SetDvar( "ui_zm_mapstartlocation", tomb )
--	Engine.SetDvar( "map zm_tomb" )
    Engine.Exec( f52_arg1.controller, "startTomb" )
end