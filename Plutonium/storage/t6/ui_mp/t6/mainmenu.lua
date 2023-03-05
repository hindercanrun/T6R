require("T6.MainLobby")
require("T6.Menus.MOTD")

CoD.MainMenu = {}

CoD.MainMenu.ShowStoreButtonEvent = function (f1_arg0, f1_arg1)
	if CoD.MainMenu.ShowStoreButton(f1_arg1.controller) == true and f1_arg0.ingameStoreButton == nil then
		CoD.MainMenu.AddStoreButton(f1_arg0)
	end
end

CoD.MainMenu.AddStoreButton = function (f2_arg0)
	f2_arg0.ingameStoreButton = f2_arg0.buttonList:addButton(Engine.Localize("MENU_INGAMESTORE"), nil, 5)
	f2_arg0.ingameStoreButton:setActionEventName("open_store")
end

CoD.MainMenu.ShowStoreButton = function (f3_arg0)
	if not CoD.isPC and not CoD.isWIIU and UIExpression.IsFFOTDFetched(f3_arg0) == 1 and Dvar.ui_inGameStoreVisible:get() == true and (CoD.isPS3 ~= true or CoD.isZombie ~= true) then
		return true
	else
		return false
	end
end

LUI.createMenu.MainMenu = function (f4_arg0)
	local f4_local0 = CoD.Menu.New("MainMenu")
	f4_local0.anyControllerAllowed = true
	f4_local0:registerEventHandler("open_main_lobby_requested", CoD.MainMenu.OpenMainLobbyRequested)
	f4_local0:registerEventHandler("open_local_match_lobby", CoD.MainMenu.OpenLocalMatchLobby)
	f4_local0:registerEventHandler("open_options_menu", CoD.MainMenu.OpenOptionsMenu)
	f4_local0:registerEventHandler("button_prompt_back", CoD.MainMenu.Back)
	f4_local0:registerEventHandler("start_sp", CoD.MainMenu.StartSP)
	f4_local0:registerEventHandler("start_mp", CoD.MainMenu.StartMP)
	f4_local0:registerEventHandler("open_menu", CoD.Lobby.OpenMenu)
	f4_local0:registerEventHandler("open_store", CoD.MainLobby.OpenStore)
	f4_local0:registerEventHandler("showstorebutton", CoD.MainMenu.ShowStoreButtonEvent)
	if CoD.isPC then
		f4_local0:registerEventHandler("open_quit_popup", CoD.MainMenu.OpenQuitPopup)
		f4_local0:registerEventHandler("open_sp_switch_popup", CoD.MainMenu.OpenConfirmSwitchToSP)
		f4_local0:registerEventHandler("open_mp_switch_popup", CoD.MainMenu.OpenConfirmSwitchToMP)
	end
	f4_local0:addSelectButton()
	if CoD.isZombie then
		local f4_local1 = 192
		local f4_local2 = f4_local1 * 2
		local f4_local3 = 30
		local f4_local4 = LUI.UIImage.new()
		f4_local4:setLeftRight(true, false, 0, f4_local2)
		f4_local4:setTopBottom(true, false, f4_local3 - f4_local1 / 2, f4_local3 + f4_local1 / 2)
		f4_local4:setImage(RegisterMaterial("menu_zm_title_screen"))
		f4_local0:addElement(f4_local4)
		CoD.GameGlobeZombie.gameGlobe.currentMenu = f4_local0
	end
	local f4_local1 = 18.5
	local f4_local2 = 70
	local f4_local3 = CoD.CoD9Button.Height * f4_local1
	local f4_local4 = CoD.ButtonList.DefaultWidth
	local f4_local5 = -f4_local3 - CoD.ButtonPrompt.Height
	f4_local0.buttonList = CoD.ButtonList.new({
		leftAnchor = true,
		rightAnchor = false,
		left = f4_local2,
		right = f4_local2 + f4_local4,
		topAnchor = false,
		bottomAnchor = true,
		top = f4_local5,
		bottom = -CoD.ButtonPrompt.Height,
		alpha = 1
	})
	f4_local0.buttonList:setPriority(10)
	f4_local0.buttonList:registerAnimationState("disabled", {
		alpha = 0.5
	})
	f4_local0:addElement(f4_local0.buttonList)
	f4_local0.mainLobbyButton = f4_local0.buttonList:addButton(Engine.Localize("PLAY ONLINE"), nil, 1)
	f4_local0.mainLobbyButton:setActionEventName("open_main_lobby_requested")
	f4_local0.localButton = f4_local0.buttonList:addButton(Engine.Localize("MENU_LOCAL_CAPS"), nil, 2)
	f4_local0.localButton:setActionEventName("open_local_match_lobby")
	f4_local0.optionsButton = f4_local0.buttonList:addButton(Engine.Localize("MENU_OPTIONS_CAPS"), nil, 3)
	f4_local0.optionsButton:setActionEventName("open_options_menu")
	f4_local0.mainMenuButton = f4_local0.buttonList:addButton(Engine.Localize("MENU_MAIN_MENU_CAPS"), nil, 4)
	f4_local0.mainMenuButton:setActionEventName("open_sp_switch_popup")
	f4_local0.buttonList:addSpacer(CoD.CoD9Button.Height / 2, 4)
	f4_local0.buttonList:addSpacer(CoD.CoD9Button.Height / 2, 4)
	f4_local0.buttonList:addSpacer(CoD.CoD9Button.Height / 2, 4)
	f4_local0.backButton = f4_local0.buttonList:addButton(Engine.Localize("MENU_BACK_CAPS"), nil, 5)
	f4_local0.backButton:setActionEventName("open_mp_switch_popup")
	if CoD.MainMenu.ShowStoreButton(f4_arg0) == true and f4_local0.ingameStoreButton == nil then
		CoD.MainMenu.AddStoreButton(f4_local0)
	end
	if CoD.isPC then
		f4_local0:addLeftButtonPrompt(CoD.ButtonPrompt.new("secondary", "", f4_local0, "open_quit_popup", true))
		f4_local0.buttonList:setLeftRight(true, false, f4_local2, f4_local2 + 120)
	end
	if not f4_local0.buttonList:restoreState() then
		f4_local0.buttonList:processEvent({
			name = "gain_focus"
		})
	end
	HideGlobe()

	return f4_local0
end

CoD.MainMenu.Popup_Closed = function (f9_arg0, f9_arg1)
	CoD.MainMenu.OpenMainLobbyRequested(f9_arg0, f9_arg1)
end

CoD.MainMenu.IsGuestRestricted = function (f10_arg0, f10_arg1)
	if not (not CoD.isPS3 or f10_arg1.controller == 0) or CoD.isXBOX and UIExpression.IsGuest(f10_arg1.controller) == 1 then
		local f10_local0 = f10_arg0:openPopup("popup_guest_contentrestricted", f10_arg1.controller)
		f10_local0.anyControllerAllowed = true
		return true
	else
		return false
	end
end

CoD.MainMenu.OpenMainLobbyRequested = function (f15_arg0, f15_arg1)
	if CoD.isZombie then
		if Engine.IsFeatureBanned(CoD.FEATURE_BAN_LIVE_ZOMBIE) then
			Engine.ExecNow(f15_arg1.controller, "banCheck " .. CoD.FEATURE_BAN_LIVE_ZOMBIE)
			return 
		end
	elseif Engine.IsFeatureBanned(CoD.FEATURE_BAN_LIVE_MP) then
		Engine.ExecNow(f15_arg1.controller, "banCheck " .. CoD.FEATURE_BAN_LIVE_MP)
		return 
	end
	if CoD.MainMenu.IsGuestRestricted(f15_arg0, f15_arg1) == true then
		return 
	elseif Engine.CheckNetConnection() == false then
		local f15_local0 = f15_arg0:openPopup("popup_net_connection", f15_arg1.controller)
		f15_local0.callingMenu = f15_arg0
		return 
	elseif CoD.isZombie == false then
		if CoD.MainLobby.OnlinePlayAvailable(f15_arg0, f15_arg1) == 1 then
			Engine.Exec(f15_arg1.controller, "setclientbeingusedandprimary")
			if CoD.MainMenu.ShowDLC0Popup(f15_arg1.controller) == true then
				local f15_local0 = Engine.GetDLC0PublisherOfferId(f15_arg1.controller)
				if f15_local0 ~= nil then
					CoD.perController[f15_arg1.controller].ContentPublisherOfferID = f15_local0
					CoD.perController[f15_arg1.controller].ContentType = "0"
					local f15_local1 = f15_arg0:openPopup("DLCPopup", f15_arg1.controller)
					f15_local1.callingMenu = f15_arg0
				end
			elseif Engine.ShouldShowMOTD(f15_arg1.controller) ~= nil and Engine.ShouldShowMOTD(f15_arg1.controller) == true then
				local f15_local0 = f15_arg0:openPopup("MOTD", f15_arg1.controller)
				f15_local0.callingMenu = f15_arg0
			elseif CoD.MainMenu.ShowSPReminderPopup(f15_arg1.controller) then
				local f15_local0 = f15_arg0:openPopup("SPReminderPopup", f15_arg1.controller)
				f15_local0.callingMenu = f15_arg0
			elseif CoD.MainMenu.ShowDSPPromotionPopup(f15_arg1.controller) then
				local f15_local0 = f15_arg0:openPopup("DSPPromotionPopup", f15_arg1.controller)
				f15_local0.callingMenu = f15_arg0
			elseif Engine.ShouldShowVoting(f15_arg1.controller) == true then
				local f15_local0 = f15_arg0:openPopup("VotingPopup", f15_arg1.controller)
				f15_local0.callingMenu = f15_arg0
			elseif Engine.ERegPopup_ShouldShow(f15_arg1.controller) == 1 then
				CoD.MainMenu.OpenPopup_EliteRegistration(f15_arg0, f15_arg1)
			elseif Engine.EWelcomePopup_ShouldShow(f15_arg1.controller) == 1 then
				CoD.MainMenu.OpenPopup_EliteWelcome(f15_arg0, f15_arg1)
			elseif Engine.EMarketingOptInPopup_ShouldShow(f15_arg1.controller) == true then
				f15_arg0:openPopup("EliteMarketingOptInPopup", f15_arg1.controller)
			elseif CoD.isPS3 and Engine.IsChatRestricted(f15_arg1.controller) then
				local f15_local0 = f15_arg0:openPopup("popup_chatrestricted", f15_arg1.controller)
				f15_local0.callingMenu = f15_arg0
			else
				CoD.perController[f15_arg1.controller].IsDLCPopupViewed = nil
				CoD.MainMenu.OpenMainLobby(f15_arg0, f15_arg1)
			end
		end
	elseif CoD.MainLobby.OnlinePlayAvailable(f15_arg0, f15_arg1) == 1 then
		Engine.Exec(f15_arg1.controller, "setclientbeingusedandprimary")
		if Engine.ShouldShowMOTD(f15_arg1.controller) then
			local f15_local0 = f15_arg0:openPopup("MOTD", f15_arg1.controller)
			f15_local0.callingMenu = f15_arg0
		elseif CoD.isPS3 and Engine.IsChatRestricted(f15_arg1.controller) then
			local f15_local0 = f15_arg0:openPopup("popup_chatrestricted", f15_arg1.controller)
			f15_local0.callingMenu = f15_arg0
		else
			CoD.MainMenu.OpenMainLobby(f15_arg0, f15_arg1)
		end
	end
end

CoD.MainMenu.OpenMainLobby = function (f16_arg0, f16_arg1)
	if CoD.MainLobby.OnlinePlayAvailable(f16_arg0, f16_arg1) == 1 then
		if CoD.isZombie then
			if Engine.IsFeatureBanned(CoD.FEATURE_BAN_LIVE_ZOMBIE) then
				Engine.ExecNow(f16_arg1.controller, "banCheck " .. CoD.FEATURE_BAN_LIVE_ZOMBIE)
				return 
			end
		elseif Engine.IsFeatureBanned(CoD.FEATURE_BAN_LIVE_MP) then
			Engine.ExecNow(f16_arg1.controller, "banCheck " .. CoD.FEATURE_BAN_LIVE_MP)
			return 
		end
		f16_arg0.buttonList:saveState()
		Engine.SessionModeSetOnlineGame(true)
		Engine.Exec(f16_arg1.controller, "xstartprivateparty")
		Engine.Exec(f16_arg1.controller, "party_statechanged")
		CoD.MainMenu.InitializeLocalPlayers(f16_arg1.controller)
		local f16_local0 = f16_arg0:openMenu("MainLobby", f16_arg1.controller)
		Engine.Exec(f16_arg1.controller, "session_rejoinsession " .. CoD.SESSION_REJOIN_CHECK_FOR_SESSION)
		if CoD.isZombie then
			CoD.GameGlobeZombie.gameGlobe.currentMenu = f16_local0
		end
		f16_arg0:close()
	end
end

CoD.MainMenu.OpenControlsMenu = function (f17_arg0, f17_arg1)
	if CoD.MainMenu.OfflinePlayAvailable(f17_arg0, f17_arg1) == 0 then
		return 
	else
		CoD.MainMenu.InitializeLocalPlayers(f17_arg1.controller)
		f17_arg0:openPopup("WiiUControllerSettings", f17_arg1.controller, true)
		Engine.PlaySound("cac_screen_fade")
	end
end

CoD.MainMenu.OpenOptionsMenu = function (f18_arg0, f18_arg1)
	if CoD.MainMenu.OfflinePlayAvailable(f18_arg0, f18_arg1) == 0 then
		return 
	else
		CoD.MainMenu.InitializeLocalPlayers(f18_arg1.controller)
		f18_arg0:openPopup("OptionsMenu", f18_arg1.controller)
		Engine.PlaySound("cac_screen_fade")
	end
end

CoD.MainMenu.OpenLocalMatchLobby = function (f19_arg0, f19_arg1)
	if CoD.MainMenu.IsGuestRestricted(f19_arg0, f19_arg1) == true then
		return 
	elseif CoD.MainMenu.OfflinePlayAvailable(f19_arg0, f19_arg1) == 0 then
		return 
	end
	f19_arg0.buttonList:saveState()
	CoD.MainMenu.InitializeLocalPlayers(f19_arg1.controller)
	CoD.SwitchToLocalLobby(f19_arg1.controller)
	if CoD.isZombie == true then
		f19_arg0:openMenu("SelectMapZM", f19_arg1.controller)
		ShowGlobe()
	else
		f19_arg0:openMenu("SplitscreenGameLobby", f19_arg1.controller)
	end
	f19_arg0:close()
end

CoD.MainMenu.OfflinePlayAvailable = function (f20_arg0, f20_arg1, f20_arg2)
	local f20_local0 = f20_arg1.controller
	if UIExpression.IsSignedIn(f20_local0) == 0 then
		if f20_arg2 ~= nil and f20_arg2 == true then
			return 0
		elseif CoD.isPS3 then
			if UIExpression.IsPrimaryLocalClient(f20_local0) == 1 then
				Engine.Exec(f20_local0, "xsigninlive")
			else
				Engine.Exec(f20_local0, "signclientin")
			end
		else
			Engine.Exec(f20_local0, "xsignin")
			if CoD.isPC then
				return 1
			end
		end
		return 0
	else
		return 1
	end
end

CoD.MainMenu.StartSP = function (f23_arg0, f23_arg1)
	Engine.Exec(f23_arg1.controller, "startSingleplayer")
end

CoD.MainMenu.StartMP = function (f23_arg0, f23_arg1)
	Engine.Exec(f23_arg1.controller, "startMultiplayer")
end

CoD.MainMenu.OpenQuitPopup = function (f24_arg0, f24_arg1)
	f24_arg0:openPopup("QuitPopup", f24_arg1.controller)
end

CoD.MainMenu.OpenConfirmSwitchToSP = function (f25_arg0, f25_arg1)
	f25_arg0:openPopup("SwitchToSPPopup", f25_arg1.controller)
end

CoD.MainMenu.OpenConfirmSwitchToMP = function (f25_arg0, f25_arg1)
	f25_arg0:openPopup("SwitchToMPPopup", f25_arg1.controller)
end

CoD.MainMenu.Leave = function (f34_arg0, f34_arg1)
	Dvar.ui_changed_exe:set(1)
	Engine.Exec(f34_arg1.controller, "wait;wait;wait")
	Engine.Exec(f34_arg1.controller, "startSingleplayer")
end

CoD.MainMenu.Back = function (f35_arg0, f35_arg1)
	local f35_local0 = {
		params = {},
		titleText = Engine.Localize("MENU_MAIN_MENU_CAPS")
	}
	if not CoD.isZombie then
		table.insert(f35_local0.params, {
			leaveHandler = CoD.MainMenu.StartSP,
			leaveEvent = "start_sp",
			leaveText = Engine.Localize("MENU_CAMPAIGN")
		})
		table.insert(f35_local0.params, {
			leaveHandler = CoD.MainMenu.StartMP,
			leaveEvent = "start_mp",
			leaveText = Engine.Localize("MENU_MULTIPLAYER")
		})
	end
	local f35_local1 = f35_arg0:openPopup("ConfirmLeave", f35_arg1.controller, f35_local0)
	f35_local1.anyControllerAllowed = true
end

CoD.MainMenu.InitializeLocalPlayers = function (f39_arg0)
	Engine.ExecNow(f39_arg0, "disableallclients")
	Engine.ExecNow(f39_arg0, "setclientbeingusedandprimary")
end

LUI.createMenu.VCS = function (f40_arg0)
	local f40_local0 = CoD.Menu.New("VCS")
	f40_local0.anyControllerAllowed = true
	f40_local0:addElement(LUI.UIImage.new({
		left = 0,
		top = 0,
		right = 1080,
		bottom = 600,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		red = 1,
		green = 1,
		blue = 1,
		alpha = 1,
		material = RegisterMaterial("vcs_0")
	}))
	return f40_local0
end