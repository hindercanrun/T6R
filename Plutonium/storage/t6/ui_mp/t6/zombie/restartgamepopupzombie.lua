require( "T6.HUD.InGameMenus" )

CoD.RestartGamePopup = {}
CoD.RestartGamePopup.AddButton = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
	local f1_local0 = f1_arg0.buttonList:addButton( f1_arg1 )
	f1_local0:setActionEventName( f1_arg2 )
	if f1_arg3 == true then
		f1_local0:disable()
	end
	return f1_local0
end

CoD.RestartGamePopup.Close = function ( f2_arg0, f2_arg1 )
	Engine.BlurWorld( f2_arg0:getOwner(), 0 )
	Engine.LockInput( f2_arg0:getOwner(), false )
	Engine.SetUIActive( f2_arg0:getOwner(), false )
	f2_arg0:processEvent( {
		name = "close_all_ingame_menus",
		controller = f2_arg0.controller
	} )
end

CoD.RestartGamePopup.RestartLevel = function ( f5_arg0, f5_arg1 )
	CoD.RestartGamePopup.Close( f5_arg0, f5_arg1 )
	Engine.SetDvar( "cl_paused", 0 )
	Dvar.ui_busyBlockIngameMenu:set( 1 )
	Engine.Exec( f5_arg0.controller, "stopControllerRumble" )
	Engine.Exec( f5_arg0.controller, "fade 0 0 0 255 0 0 1" )
	Engine.Exec( f5_arg0.controller, "silence" )
	if (Engine.SessionModeIsMode( CoD.SESSIONMODE_SYSTEMLINK ) == true) or Engine.SessionModeIsMode( CoD.Zombie.PLAYLIST_CATEGORY_FILTER_SOLOMATCH ) == true then
		Engine.Exec( f5_arg1.controller, "fast_restart" )
	else
		Engine.SendMenuResponse( f5_arg0.controller, "restartgamepopup", "restart_level_zm" )
	end
end

CoD.RestartGamePopup.YesButtonPressed = function ( f6_arg0, f6_arg1 )
	Engine.ExecNow( f6_arg1.controller, "demo_stop" )
	f6_arg0.controller = f6_arg1.controller
	if (Engine.SessionModeIsMode( CoD.SESSIONMODE_SYSTEMLINK ) == true) or Engine.SessionModeIsMode( CoD.Zombie.PLAYLIST_CATEGORY_FILTER_SOLOMATCH ) == true then
		CoD.RestartGamePopup.RestartLevel( f6_arg0, f6_arg1 )
	end
end

CoD.RestartGamePopup.NoButtonPressed = function ( f7_arg0, f7_arg1 )
	f7_arg0:goBack( f7_arg1.controller )
end

LUI.createMenu.RestartGamePopup = function ( f8_arg0 )
	local f8_local0 = CoD.Menu.NewSmallPopup( "RestartGamePopup" )
	f8_local0:setOwner( f8_arg0 )
	f8_local0:registerEventHandler( "close_all_ingame_menus", CoD.InGameMenu.CloseAllInGameMenus )
	f8_local0:registerEventHandler( "restartGamePopup_YesButtonPressed", CoD.RestartGamePopup.YesButtonPressed )
	f8_local0:registerEventHandler( "restartGamePopup_NoButtonPressed", CoD.RestartGamePopup.NoButtonPressed )
	f8_local0:addSelectButton()
	f8_local0:addBackButton()
	local f8_local1 = 5
	local self = LUI.UIText.new()
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, false, f8_local1, f8_local1 + CoD.textSize.Condensed )
	self:setFont( CoD.fonts.Condensed )
	self:setAlignment( LUI.Alignment.Left )
	self:setText( Engine.Localize( "MENU_CONTINUE_RESTART" ) )
	f8_local0.title = self
	f8_local0:addElement( self )
	f8_local1 = f8_local1 + CoD.textSize.Condensed + 10
	local f8_local3 = LUI.UIText.new()
	f8_local3:setLeftRight( true, true, 0, 0 )
	f8_local3:setTopBottom( true, false, f8_local1, f8_local1 + CoD.textSize.Condensed )
	f8_local3:setFont( CoD.fonts.Condensed )
	f8_local3:setAlignment( LUI.Alignment.Left )
	f8_local3:setText( Engine.Localize( "MENU_RESTART_LEVEL_TEXT" ) )
	f8_local3:registerAnimationState( "fade_in", {
		alpha = 1
	} )
	f8_local0.subTitle = f8_local3
	f8_local0:addElement( f8_local3 )
	f8_local0.buttonList = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = false,
		bottomAnchor = true,
		top = -CoD.ButtonPrompt.Height - CoD.CoD9Button.Height * 3 + 10,
		bottom = 0
	} )
	f8_local0:addElement( f8_local0.buttonList )
	local f8_local4 = CoD.RestartGamePopup.AddButton( f8_local0, Engine.Localize( "MENU_YES" ), "restartGamePopup_YesButtonPressed" )
	local f8_local5 = CoD.RestartGamePopup.AddButton( f8_local0, Engine.Localize( "MENU_NO" ), "restartGamePopup_NoButtonPressed" )
	f8_local5:processEvent( {
		name = "gain_focus"
	} )
	return f8_local0
end