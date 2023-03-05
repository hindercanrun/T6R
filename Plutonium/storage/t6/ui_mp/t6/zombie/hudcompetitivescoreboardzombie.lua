CoD.CompetitiveScoreboard = {}
CoD.CompetitiveScoreboard.RowWidth = 150
CoD.CompetitiveScoreboard.RowHeight = 30
CoD.CompetitiveScoreboard.FloatingLosePointsColor = {
	r = 0.21,
	g = 0,
	b = 0
}
CoD.CompetitiveScoreboard.IsDLC2Map = CoD.Zombie.IsDLCMap( CoD.Zombie.DLC2Maps )
CoD.CompetitiveScoreboard.IsDLC3Map = CoD.Zombie.IsDLCMap( CoD.Zombie.DLC3Maps )
CoD.CompetitiveScoreboard.IsDLC4Map = CoD.Zombie.IsDLCMap( CoD.Zombie.DLC4Maps )
CoD.CompetitiveScoreboard.LeftOffset = 0
if CoD.CompetitiveScoreboard.IsDLC2Map == true then
	CoD.CompetitiveScoreboard.Bottom = -145
elseif CoD.CompetitiveScoreboard.IsDLC3Map == true then
	CoD.CompetitiveScoreboard.Bottom = -145
	CoD.CompetitiveScoreboard.FloatingLosePointsColor = CoD.red
elseif CoD.CompetitiveScoreboard.IsDLC4Map == true then
	CoD.CompetitiveScoreboard.Bottom = -105
	CoD.CompetitiveScoreboard.LeftOffset = CoD.CompetitiveScoreboard.RowHeight
else
	CoD.CompetitiveScoreboard.Bottom = -90
end
if CoD.Zombie.GAMETYPE_ZGRIEF == Dvar.ui_gametype:get() then
	CoD.CompetitiveScoreboard.TeamPlayerCount = 8
else
	CoD.CompetitiveScoreboard.TeamPlayerCount = 4
end
CoD.CompetitiveScoreboard.CHARACTER_NAME_ONSCREEN_DURATION = 15000
CoD.CompetitiveScoreboard.CHARACTER_NAME_FADE_OUT_DURATION = 1000
CoD.CompetitiveScoreboard.ClientFieldMaxValue = 20
CoD.CompetitiveScoreboard.ClientFieldCount = 7
CoD.CompetitiveScoreboard.ClientFields = {}
CoD.CompetitiveScoreboard.ClientFields.score_cf_damage = {
	min = 0,
	max = 7,
	scoreScale = 10
}
CoD.CompetitiveScoreboard.ClientFields.score_cf_death_normal = {
	min = 0,
	max = 3,
	scoreScale = 50
}
CoD.CompetitiveScoreboard.ClientFields.score_cf_death_torso = {
	min = 0,
	max = 3,
	scoreScale = 60
}
CoD.CompetitiveScoreboard.ClientFields.score_cf_death_neck = {
	min = 0,
	max = 3,
	scoreScale = 70
}
CoD.CompetitiveScoreboard.ClientFields.score_cf_death_head = {
	min = 0,
	max = 3,
	scoreScale = 100
}
CoD.CompetitiveScoreboard.ClientFields.score_cf_death_melee = {
	min = 0,
	max = 3,
	scoreScale = 130
}
CoD.CompetitiveScoreboard.ClientFields.score_cf_double_points_active = {
	min = 0,
	max = 1,
	scoreScale = 2
}
CoD.CompetitiveScoreboard.DoublePointsActive_ClientFieldName = "score_cf_double_points_active"
CoD.CompetitiveScoreboard.FlyingDurationMin = 800
CoD.CompetitiveScoreboard.FlyingDurationMax = 1000
CoD.CompetitiveScoreboard.FlyingLeftOffSetMin = 100
CoD.CompetitiveScoreboard.FlyingLeftOffSetMax = 120
CoD.CompetitiveScoreboard.FlyingTopOffSetMin = 0
CoD.CompetitiveScoreboard.FlyingTopOffSetMax = 100
CoD.CompetitiveScoreboard.NavCard_ClientFieldName = "navcard_held"
CoD.CompetitiveScoreboard.NavCardsCount = 3
CoD.CompetitiveScoreboard.NavCards = {}
CoD.CompetitiveScoreboard.NavCards[1] = RegisterMaterial( "zm_hud_icon_sq_keycard " )
CoD.CompetitiveScoreboard.NavCards[2] = RegisterMaterial( "zm_hud_icon_sq_keycard_2 " )
CoD.CompetitiveScoreboard.NavCards[3] = RegisterMaterial( "zm_hud_icon_sq_keycard_buried " )
CoD.CompetitiveScoreboard.NEED_SHOVEL = 0
CoD.CompetitiveScoreboard.HAVE_SHOVEL = 1
CoD.CompetitiveScoreboard.HAVE_UG_SHOVEL = 2
CoD.CompetitiveScoreboard.NEED_HELMET = 0
CoD.CompetitiveScoreboard.HAVE_HELMET = 1
if CoD.CompetitiveScoreboard.IsDLC2Map == true then
	CoD.CompetitiveScoreboard.CharacterNames = {}
	CoD.CompetitiveScoreboard.CharacterNames[1] = {
		name = "Finn",
		modelName = "c_zom_player_oleary_fb"
	}
	CoD.CompetitiveScoreboard.CharacterNames[2] = {
		name = "Sal",
		modelName = "c_zom_player_deluca_fb"
	}
	CoD.CompetitiveScoreboard.CharacterNames[3] = {
		name = "Billy",
		modelName = "c_zom_player_handsome_fb"
	}
	CoD.CompetitiveScoreboard.CharacterNames[4] = {
		name = "Weasel",
		modelName = "c_zom_player_arlington_fb"
	}
elseif CoD.CompetitiveScoreboard.IsDLC3Map == true then
	CoD.CompetitiveScoreboard.CharacterNames = {}
	CoD.CompetitiveScoreboard.CharacterNames[1] = {
		name = "Misty",
		modelName = "c_zom_player_farmgirl_fb"
	}
	CoD.CompetitiveScoreboard.CharacterNames[2] = {
		name = "Marlton",
		modelName = "c_zom_player_engineer_fb"
	}
	CoD.CompetitiveScoreboard.CharacterNames[3] = {
		name = "Stuhlinger",
		modelName = "c_zom_player_reporter_dam_fb"
	}
	CoD.CompetitiveScoreboard.CharacterNames[4] = {
		name = "Russman",
		modelName = "c_zom_player_oldman_fb"
	}
elseif CoD.CompetitiveScoreboard.IsDLC4Map == true then
	CoD.CompetitiveScoreboard.CharacterNames = {}
	CoD.CompetitiveScoreboard.CharacterNames[1] = {
		name = "Richtofen",
		modelName = "c_zom_tomb_richtofen_fb"
	}
	CoD.CompetitiveScoreboard.CharacterNames[2] = {
		name = "Takeo",
		modelName = "c_zom_tomb_takeo_fb"
	}
	CoD.CompetitiveScoreboard.CharacterNames[3] = {
		name = "Nikolai",
		modelName = "c_zom_tomb_nikolai_fb"
	}
	CoD.CompetitiveScoreboard.CharacterNames[4] = {
		name = "Dempsey",
		modelName = "c_zom_tomb_dempsey_fb"
	}
end
LUI.createMenu.CompetitiveScoreboard = function ( f1_arg0 )
	local f1_local0 = CoD.Menu.NewSafeAreaFromState( "CompetitiveScoreboard", f1_arg0 )
	f1_local0:setOwner( f1_arg0 )
	f1_local0.scaleContainer = CoD.SplitscreenScaler.new( nil, CoD.Zombie.SplitscreenMultiplier )
	f1_local0.scaleContainer:setLeftRight( false, true, 0, 0 )
	f1_local0.scaleContainer:setTopBottom( false, true, 0, 0 )
	f1_local0:addElement( f1_local0.scaleContainer )
	if CoD.CompetitiveScoreboard.BackGroundMaterial == nil then
		CoD.CompetitiveScoreboard.BackGroundMaterial = RegisterMaterial( "scorebar_zom_1 " )
	end
	local f1_local1 = "Default"
	local f1_local2 = CoD.textSize[f1_local1]
	f1_local0.Scores = {}
	for f1_local3 = 1, CoD.CompetitiveScoreboard.TeamPlayerCount, 1 do
		local f1_local6 = CoD.CompetitiveScoreboard.Bottom - CoD.CompetitiveScoreboard.RowHeight * f1_local3
		local self = LUI.UIElement.new()
		self:setLeftRight( false, true, -CoD.CompetitiveScoreboard.RowWidth, 0 )
		self:setTopBottom( false, true, f1_local6 - CoD.CompetitiveScoreboard.RowHeight, f1_local6 )
		self:setAlpha( 0 )
		self.scoreBg = LUI.UIImage.new()
		self.scoreBg:setLeftRight( true, true, 0, 0 )
		self.scoreBg:setTopBottom( true, true, 0, 0 )
		self.scoreBg:setRGB( 0.21, 0, 0 )
		self.scoreBg:setImage( CoD.CompetitiveScoreboard.BackGroundMaterial )
		self:addElement( self.scoreBg )
		if CoD.Zombie.IsCharacterNameDisplayMap() == true then
			self.characterName = LUI.UIText.new()
			self.characterName:setLeftRight( false, true, -CoD.CompetitiveScoreboard.RowWidth * 2, -CoD.CompetitiveScoreboard.RowWidth - 10 )
			self.characterName:setTopBottom( false, false, -f1_local2 / 2, f1_local2 / 2 )
			self.characterName:setFont( CoD.fonts[f1_local1] )
			self.characterName:setAlignment( LUI.Alignment.Right )
			if CoD.CompetitiveScoreboard.IsDLC3Map == true then
				self.characterName:registerEventHandler( "character_name_fade_out", CoD.CompetitiveScoreboard.FadeoutCharacterName )
			end
			self:addElement( self.characterName )
		end
		self.scoreText = LUI.UIText.new()
		self.scoreText:setLeftRight( true, false, 10, CoD.CompetitiveScoreboard.RowWidth )
		self.scoreText:setTopBottom( true, true, 0, 0 )
		self:addElement( self.scoreText )
		self.floatingScoreTexts = {}
		for f1_local8 = 1, CoD.CompetitiveScoreboard.ClientFieldMaxValue, 1 do
			local f1_local11 = LUI.UIText.new()
			f1_local11:setLeftRight( true, false, -30, -30 + CoD.CompetitiveScoreboard.RowWidth )
			f1_local11:setTopBottom( true, false, 0, CoD.CompetitiveScoreboard.RowHeight )
			f1_local11:setAlpha( 0 )
			f1_local11.isUsed = false
			f1_local11:registerEventHandler( "transition_complete_flying_out", CoD.CompetitiveScoreboard.FloatingTextFlyingFinish )
			self:addElement( f1_local11 )
			self.floatingScoreTexts[f1_local8] = f1_local11
		end
		if CoD.CompetitiveScoreboard.IsDLC4Map == true then
			CoD.CompetitiveScoreboard.ShovelStates = {
				0,
				0,
				0,
				0
			}
			CoD.CompetitiveScoreboard.HelmetStates = {
				0,
				0,
				0,
				0
			}
			local f1_local8 = CoD.CompetitiveScoreboard.RowHeight
			self.shovelIcon = LUI.UIImage.new()
			self.shovelIcon:setLeftRight( false, true, -f1_local8, 0 )
			self.shovelIcon:setTopBottom( false, false, -CoD.CompetitiveScoreboard.RowHeight * 0.5, CoD.CompetitiveScoreboard.RowHeight * 0.5 )
			self.shovelIcon:setAlpha( 0 )
			self:addElement( self.shovelIcon )
			self.shovelIcon.itemState = CoD.CompetitiveScoreboard.NEED_SHOVEL
			self.helmetIcon = LUI.UIImage.new()
			self.helmetIcon:setLeftRight( false, true, 0, f1_local8 )
			self.helmetIcon:setTopBottom( false, false, -CoD.CompetitiveScoreboard.RowHeight * 0.5, CoD.CompetitiveScoreboard.RowHeight * 0.5 )
			self.helmetIcon:setAlpha( 0 )
			self:addElement( self.helmetIcon )
			self.helmetIcon.itemState = CoD.CompetitiveScoreboard.NEED_HELMET
		end
		self.navCardIcons = {}
		for f1_local8 = 1, CoD.CompetitiveScoreboard.NavCardsCount, 1 do
			local f1_local11 = LUI.UIImage.new()
			f1_local11:setLeftRight( false, true, -CoD.CompetitiveScoreboard.RowHeight, 0 )
			f1_local11:setTopBottom( false, false, -CoD.CompetitiveScoreboard.RowHeight * 0.5, CoD.CompetitiveScoreboard.RowHeight * 0.5 )
			f1_local11:setAlpha( 0 )
			self:addElement( f1_local11 )
			self.navCardIcons[f1_local8] = f1_local11
		end
		self.preScore = 0
		self.currentScore = 0
		self.doublePointsActive = 1
		self.currentClientFieldScore = 0
		self.currentUsedFloatingScoreTextNum = 0
		f1_local0.Scores[f1_local3] = self
		f1_local0.scaleContainer:addElement( self )
	end
	for f1_local12, f1_local6 in pairs( CoD.CompetitiveScoreboard.ClientFields ) do
		f1_local0:registerEventHandler( f1_local12, CoD.CompetitiveScoreboard.Update_ClientFields_FlyingScore )
	end
	if CoD.CompetitiveScoreboard.IsDLC4Map == true then
		CoD.CompetitiveScoreboard.ShovelMaterial = RegisterMaterial( "zom_hud_craftable_tank_shovel " )
		CoD.CompetitiveScoreboard.ShovelGoldMaterial = RegisterMaterial( "zom_hud_shovel_gold " )
		CoD.CompetitiveScoreboard.HardHatMaterial = RegisterMaterial( "zom_hud_helmet_gold " )
		for f1_local3 = 1, 4, 1 do
			f1_local0:registerEventHandler( "shovel_player" .. f1_local3, CoD.CompetitiveScoreboard.Update_ClientField_Shovel )
			f1_local0:registerEventHandler( "helmet_player" .. f1_local3, CoD.CompetitiveScoreboard.Update_ClientField_Helmet )
		end
	else
		f1_local0:registerEventHandler( CoD.CompetitiveScoreboard.NavCard_ClientFieldName, CoD.CompetitiveScoreboard.Update_ClientField_NavCards )
	end
	f1_local0:registerEventHandler( "hud_update_competitive_scoreboard", CoD.CompetitiveScoreboard.Update )
	f1_local0:registerEventHandler( "hud_update_refresh", CoD.CompetitiveScoreboard.UpdateVisibility )
	f1_local0:registerEventHandler( "hud_update_bit_" .. CoD.BIT_HUD_VISIBLE, CoD.CompetitiveScoreboard.UpdateVisibility )
	f1_local0:registerEventHandler( "hud_update_bit_" .. CoD.BIT_IS_PLAYER_IN_AFTERLIFE, CoD.CompetitiveScoreboard.UpdateVisibility )
	f1_local0:registerEventHandler( "hud_update_bit_" .. CoD.BIT_EMP_ACTIVE, CoD.CompetitiveScoreboard.UpdateVisibility )
	f1_local0:registerEventHandler( "hud_update_bit_" .. CoD.BIT_DEMO_CAMERA_MODE_MOVIECAM, CoD.CompetitiveScoreboard.UpdateVisibility )
	f1_local0:registerEventHandler( "hud_update_bit_" .. CoD.BIT_DEMO_ALL_GAME_HUD_HIDDEN, CoD.CompetitiveScoreboard.UpdateVisibility )
	f1_local0:registerEventHandler( "hud_update_bit_" .. CoD.BIT_IN_VEHICLE, CoD.CompetitiveScoreboard.UpdateVisibility )
	f1_local0:registerEventHandler( "hud_update_bit_" .. CoD.BIT_IN_GUIDED_MISSILE, CoD.CompetitiveScoreboard.UpdateVisibility )
	f1_local0:registerEventHandler( "hud_update_bit_" .. CoD.BIT_IN_REMOTE_KILLSTREAK_STATIC, CoD.CompetitiveScoreboard.UpdateVisibility )
	f1_local0:registerEventHandler( "hud_update_bit_" .. CoD.BIT_AMMO_COUNTER_HIDE, CoD.CompetitiveScoreboard.UpdateVisibility )
	f1_local0:registerEventHandler( "hud_update_bit_" .. CoD.BIT_IS_FLASH_BANGED, CoD.CompetitiveScoreboard.UpdateVisibility )
	f1_local0:registerEventHandler( "hud_update_bit_" .. CoD.BIT_UI_ACTIVE, CoD.CompetitiveScoreboard.UpdateVisibility )
	f1_local0:registerEventHandler( "hud_update_bit_" .. CoD.BIT_SPECTATING_CLIENT, CoD.CompetitiveScoreboard.UpdateVisibility )
	f1_local0:registerEventHandler( "hud_update_bit_" .. CoD.BIT_SCOREBOARD_OPEN, CoD.CompetitiveScoreboard.UpdateVisibility )
	f1_local0:registerEventHandler( "hud_update_bit_" .. CoD.BIT_PLAYER_DEAD, CoD.CompetitiveScoreboard.UpdateVisibility )
	f1_local0:registerEventHandler( "hud_update_bit_" .. CoD.BIT_IS_SCOPED, CoD.CompetitiveScoreboard.UpdateVisibility )
	f1_local0:registerEventHandler( "hud_update_team_change", CoD.CompetitiveScoreboard.UpdateTeamChange )
	f1_local0.visible = true
	return f1_local0
end

CoD.CompetitiveScoreboard.CompetitiveScoreShow = function ( f2_arg0, f2_arg1, f2_arg2 )
	if not f2_arg2 then
		f2_arg2 = 0
	end
	local f2_local0 = CoD.CompetitiveScoreboard.Bottom - CoD.CompetitiveScoreboard.RowHeight * f2_arg1
	local f2_local1 = CoD.CompetitiveScoreboard.LeftOffset
	f2_arg0:beginAnimation( "show", f2_arg2 )
	f2_arg0:setLeftRight( false, true, -CoD.CompetitiveScoreboard.RowWidth - f2_local1, -f2_local1 )
	f2_arg0:setTopBottom( false, true, f2_local0 - CoD.CompetitiveScoreboard.RowHeight + 3, f2_local0 - 3 )
	f2_arg0:setAlpha( 1 )
end

CoD.CompetitiveScoreboard.CompetitiveScoreShowSelf = function ( f3_arg0, f3_arg1, f3_arg2 )
	if not f3_arg2 then
		f3_arg2 = 0
	end
	local f3_local0 = CoD.CompetitiveScoreboard.Bottom - CoD.CompetitiveScoreboard.RowHeight * f3_arg1
	local f3_local1 = CoD.CompetitiveScoreboard.LeftOffset
	f3_arg0:beginAnimation( "showself", f3_arg2 )
	f3_arg0:setLeftRight( false, true, -CoD.CompetitiveScoreboard.RowWidth - f3_local1 - 8, -f3_local1 )
	f3_arg0:setTopBottom( false, true, f3_local0 - CoD.CompetitiveScoreboard.RowHeight - 5, f3_local0 + 5 )
	f3_arg0:setAlpha( 1 )
end

CoD.CompetitiveScoreboard.CompetitiveScoreHide = function ( f4_arg0, f4_arg1 )
	if not f4_arg1 then
		f4_arg1 = 0
	end
	f4_arg0:beginAnimation( "hide", f4_arg1 )
	f4_arg0:setAlpha( 0 )
end

CoD.CompetitiveScoreboard.CompetitiveScoreTextShowPlayerColor = function ( f5_arg0, f5_arg1, f5_arg2 )
	if not f5_arg2 then
		f5_arg2 = 0
	end
	f5_arg0:beginAnimation( "showplayercolor", f5_arg2 )
	f5_arg0:setRGB( CoD.Zombie.PlayerColors[f5_arg1].r, CoD.Zombie.PlayerColors[f5_arg1].g, CoD.Zombie.PlayerColors[f5_arg1].b )
end

CoD.CompetitiveScoreboard.UpdateVisibility = function ( f6_arg0, f6_arg1 )
	local f6_local0 = f6_arg1.controller
	if UIExpression.IsVisibilityBitSet( f6_local0, CoD.BIT_HUD_VISIBLE ) == 1 and UIExpression.IsVisibilityBitSet( f6_local0, CoD.BIT_IS_PLAYER_IN_AFTERLIFE ) == 0 and UIExpression.IsVisibilityBitSet( f6_local0, CoD.BIT_EMP_ACTIVE ) == 0 and UIExpression.IsVisibilityBitSet( f6_local0, CoD.BIT_DEMO_CAMERA_MODE_MOVIECAM ) == 0 and UIExpression.IsVisibilityBitSet( f6_local0, CoD.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) == 0 and UIExpression.IsVisibilityBitSet( f6_local0, CoD.BIT_IN_VEHICLE ) == 0 and UIExpression.IsVisibilityBitSet( f6_local0, CoD.BIT_IN_GUIDED_MISSILE ) == 0 and UIExpression.IsVisibilityBitSet( f6_local0, CoD.BIT_IN_REMOTE_KILLSTREAK_STATIC ) == 0 and UIExpression.IsVisibilityBitSet( f6_local0, CoD.BIT_AMMO_COUNTER_HIDE ) == 0 and UIExpression.IsVisibilityBitSet( f6_local0, CoD.BIT_IS_FLASH_BANGED ) == 0 and UIExpression.IsVisibilityBitSet( f6_local0, CoD.BIT_UI_ACTIVE ) == 0 and UIExpression.IsVisibilityBitSet( f6_local0, CoD.BIT_SCOREBOARD_OPEN ) == 0 and UIExpression.IsVisibilityBitSet( f6_local0, CoD.BIT_IS_SCOPED ) == 0 and (not CoD.IsShoutcaster( f6_local0 ) or CoD.IsShoutcasterProfileVariableTrue( f6_local0, "shoutcaster_scorestreaks" ) and Engine.IsSpectatingActiveClient( f6_local0 )) and CoD.FSM_VISIBILITY( f6_local0 ) == 0 then
		if f6_arg0.visible ~= true then
			f6_arg0:setAlpha( 1 )
			f6_arg0.m_inputDisabled = nil
			f6_arg0.visible = true
		end
	elseif f6_arg0.visible == true then
		f6_arg0:setAlpha( 0 )
		f6_arg0.m_inputDisabled = true
		f6_arg0.visible = nil
	end
	f6_arg0:dispatchEventToChildren( f6_arg1 )
end

CoD.CompetitiveScoreboard.UpdateTeamChange = function ( f7_arg0, f7_arg1 )
	if Dvar.ui_gametype:get() == CoD.Zombie.GAMETYPE_ZCLEANSED then
		if f7_arg1.team == CoD.TEAM_AXIS then
			if f7_arg0.visible == true then
				f7_arg0:setAlpha( 0 )
				f7_arg0.m_inputDisabled = true
				f7_arg0.visible = false
			end
		elseif f7_arg0.visible ~= true then
			f7_arg0:setAlpha( 1 )
			f7_arg0.m_inputDisabled = nil
			f7_arg0.visible = true
		end
	end
end

CoD.CompetitiveScoreboard.CopyPreNavCardAndShow = function ( f8_arg0, f8_arg1, f8_arg2 )
	local f8_local0 = nil
	local f8_local1 = false
	for f8_local2 = 1, CoD.CompetitiveScoreboard.TeamPlayerCount, 1 do
		f8_local0 = f8_arg0.Scores[f8_local2]
		if f8_local0.clientNum == f8_arg2 then
			f8_local1 = true
			for f8_local5 = 1, CoD.CompetitiveScoreboard.NavCardsCount, 1 do
				if f8_local0.navCardIcons[f8_local5].material ~= nil then
					f8_arg1.navCardIcons[f8_local5].material = f8_local0.navCardIcons[f8_local5].material
					f8_arg1.navCardIcons[f8_local5]:setImage( f8_local0.navCardIcons[f8_local5].material )
					f8_arg1.navCardIcons[f8_local5]:setAlpha( 1 )
				else
					f8_arg1.navCardIcons[f8_local5]:setAlpha( 0 )
				end
			end
		end
	end
end

CoD.CompetitiveScoreboard.UpdateItemDisplay = function ( f9_arg0, f9_arg1, f9_arg2 )
	if f9_arg1.clientNum then
		local f9_local0 = f9_arg1.clientNum + 1
		local f9_local1 = CoD.CompetitiveScoreboard.ShovelStates[f9_local0]
		local f9_local2 = CoD.CompetitiveScoreboard.HelmetStates[f9_local0]
		if f9_arg1.shovelIcon then
			if f9_local1 == CoD.CompetitiveScoreboard.HAVE_SHOVEL then
				f9_arg1.shovelIcon:setImage( CoD.CompetitiveScoreboard.ShovelMaterial )
				f9_arg1.shovelIcon:setAlpha( 1 )
				f9_arg1.shovelIcon.material = CoD.CompetitiveScoreboard.ShovelMaterial
			elseif f9_local1 == CoD.CompetitiveScoreboard.HAVE_UG_SHOVEL then
				f9_arg1.shovelIcon:setImage( CoD.CompetitiveScoreboard.ShovelGoldMaterial )
				f9_arg1.shovelIcon:setAlpha( 1 )
				f9_arg1.shovelIcon.material = CoD.CompetitiveScoreboard.ShovelGoldMaterial
			else
				f9_arg1.shovelIcon:setAlpha( 0 )
				f9_arg1.shovelIcon.material = nil
			end
		end
		if f9_arg1.helmetIcon then
			if f9_local2 == CoD.CompetitiveScoreboard.HAVE_HELMET then
				f9_arg1.helmetIcon:setImage( CoD.CompetitiveScoreboard.HardHatMaterial )
				f9_arg1.helmetIcon:setAlpha( 1 )
				f9_arg1.helmetIcon.material = CoD.CompetitiveScoreboard.HardHatMaterial
			else
				f9_arg1.helmetIcon:setAlpha( 0 )
				f9_arg1.helmetIcon.material = nil
			end
		end
	end
end

CoD.CompetitiveScoreboard.Update = function ( f10_arg0, f10_arg1 )
	local f10_local0 = f10_arg1.competitivescores
	local f10_local1 = #f10_local0
	local f10_local2 = 1
	local f10_local3 = nil
	if f10_local1 <= #f10_arg0.Scores then
		for f10_local9, f10_local10 in pairs( f10_local0 ) do
			f10_local2 = f10_local1 - f10_local9 + 1
			f10_local3 = f10_arg0.Scores[f10_local2]
			f10_local3.scoreText:setText( f10_local10.score )
			if CoD.CompetitiveScoreboard.IsDLC4Map ~= true then
				CoD.CompetitiveScoreboard.CopyPreNavCardAndShow( f10_arg0, f10_local3, f10_local10.clientNum )
			end
			local f10_local7 = f10_local3.clientNum ~= f10_local10.clientNum
			f10_local3.preScore = f10_arg0.Scores[f10_local2].currentScore
			f10_local3.currentScore = f10_local10.score
			f10_local3.clientNum = f10_local10.clientNum
			local f10_local8 = f10_local3.currentScore - f10_local3.preScore - f10_local3.currentClientFieldScore
			if f10_local8 ~= 0 and f10_arg1.bWasDemoJump == false and f10_local7 == false then
				CoD.CompetitiveScoreboard.FloatingScoreStart( f10_local3, f10_local8 )
			end
			f10_local3.currentClientFieldScore = 0
			if CoD.CompetitiveScoreboard.IsDLC4Map == true then
				CoD.CompetitiveScoreboard.UpdateItemDisplay( f10_arg0, f10_arg0.Scores[f10_local2], f10_local9 )
			end
			if f10_local9 == f10_arg1.selfindex then
				CoD.CompetitiveScoreboard.CompetitiveScoreShowSelf( f10_arg0.Scores[f10_local2], f10_local2, 0 )
				f10_arg0.Scores[f10_local2].scoreBg:setAlpha( 1 )
				if CoD.Zombie.IsCharacterNameDisplayMap() == true then
					CoD.CompetitiveScoreboard.UpdateCharacterName( f10_arg0, f10_arg1.modelName, f10_arg0.Scores[f10_local2], f10_local9 )
					CoD.CompetitiveScoreboard.CompetitiveScoreTextShowPlayerColor( f10_arg0.Scores[f10_local2].characterName, f10_local9, 0 )
				end
			else
				CoD.CompetitiveScoreboard.CompetitiveScoreShow( f10_arg0.Scores[f10_local2], f10_local2, 0 )
				f10_arg0.Scores[f10_local2].scoreBg:setAlpha( 0 )
				if CoD.Zombie.IsCharacterNameDisplayMap() == true then
					CoD.CompetitiveScoreboard.ClearCharacterName( f10_arg0.Scores[f10_local2] )
				end
			end
			CoD.CompetitiveScoreboard.CompetitiveScoreTextShowPlayerColor( f10_arg0.Scores[f10_local2].scoreText, f10_local9, 0 )
		end
		if f10_arg0.currentCompetitiveScoreNum ~= nil and f10_local1 < f10_arg0.currentCompetitiveScoreNum then
			for f10_local4 = f10_local1 + 1, f10_arg0.currentCompetitiveScoreNum, 1 do
				CoD.CompetitiveScoreboard.CompetitiveScoreHide( f10_arg0.Scores[f10_local4], 0 )
				f10_arg0.Scores[f10_local4].preScore = 0
				f10_arg0.Scores[f10_local4].currentScore = 0
				f10_arg0.Scores[f10_local4].clientNum = nil
				for f10_local10 = 1, CoD.CompetitiveScoreboard.NavCardsCount, 1 do
					f10_arg0.Scores[f10_local4].navCardIcons[f10_local10].material = nil
					f10_arg0.Scores[f10_local4].navCardIcons[f10_local10]:setAlpha( 0 )
				end
				if f10_arg0.Scores[f10_local4].shovelIcon then
					f10_arg0.Scores[f10_local4].shovelIcon.material = nil
					f10_arg0.Scores[f10_local4].shovelIcon:setAlpha( 0 )
					f10_arg0.Scores[f10_local4].shovelIcon.itemState = CoD.CompetitiveScoreboard.NEED_SHOVEL
				end
				if f10_arg0.Scores[f10_local4].helmetIcon then
					f10_arg0.Scores[f10_local4].helmetIcon.material = nil
					f10_arg0.Scores[f10_local4].helmetIcon:setAlpha( 0 )
					f10_arg0.Scores[f10_local4].helmetIcon.itemState = CoD.CompetitiveScoreboard.NEED_HELMET
				end
			end
		end
		f10_arg0.currentCompetitiveScoreNum = f10_local1
	end
end

CoD.CompetitiveScoreboard.Update_ClientFields_FlyingScore = function ( f11_arg0, f11_arg1 )
	local f11_local0 = nil
	for f11_local1 = 1, CoD.CompetitiveScoreboard.TeamPlayerCount, 1 do
		if f11_arg0.Scores[f11_local1].clientNum == f11_arg1.entNum then
			f11_local0 = f11_arg0.Scores[f11_local1]
			break
		end
	end
	if not f11_local0 then
		return 
	elseif f11_arg1.name == CoD.CompetitiveScoreboard.DoublePointsActive_ClientFieldName then
		f11_local0.doublePointsActive = f11_arg1.newValue + 1
	else
		if f11_arg1.initialSnap == true or f11_arg1.newEnt == true or f11_arg1.wasDemoJump == true then
			return 
		end
		local f11_local1 = nil
		if f11_arg1.oldValue < f11_arg1.newValue then
			f11_local1 = f11_arg1.newValue - f11_arg1.oldValue
		else
			f11_local1 = f11_arg1.newValue - f11_arg1.oldValue + CoD.CompetitiveScoreboard.ClientFields[f11_arg1.name].max + 1
		end
		local f11_local2 = CoD.CompetitiveScoreboard.GetScore( f11_arg0, f11_arg1.entNum )
		if f11_local2 ~= nil then
			local f11_local3 = CoD.CompetitiveScoreboard.ClientFields[f11_arg1.name].scoreScale * f11_local2.doublePointsActive
			for f11_local4 = 1, f11_local1, 1 do
				local f11_local7 = f11_local4
				CoD.CompetitiveScoreboard.FloatingScoreStart( f11_local2, f11_local3 )
			end
			f11_local2.currentClientFieldScore = f11_local2.currentClientFieldScore + f11_local3 * f11_local1
		end
	end
end

CoD.CompetitiveScoreboard.FloatingScoreStart = function ( f12_arg0, f12_arg1 )
	local f12_local0 = CoD.CompetitiveScoreboard.GetFloatingScoreText( f12_arg0 )
	if f12_local0 ~= nil then
		f12_local0:setAlpha( 1 )
		local f12_local1 = nil
		if f12_arg1 > 0 then
			f12_local1 = "+" .. f12_arg1
			f12_local0:setRGB( 0.9, 0.9, 0 )
		else
			f12_local1 = f12_arg1
			f12_local0:setRGB( CoD.CompetitiveScoreboard.FloatingLosePointsColor.r, CoD.CompetitiveScoreboard.FloatingLosePointsColor.g, CoD.CompetitiveScoreboard.FloatingLosePointsColor.b )
		end
		f12_local0:setText( f12_local1 )
		f12_local0.isUsed = true
		local f12_local2 = math.random( CoD.CompetitiveScoreboard.FlyingLeftOffSetMin, CoD.CompetitiveScoreboard.FlyingLeftOffSetMax )
		local f12_local3 = math.random( CoD.CompetitiveScoreboard.FlyingTopOffSetMin, CoD.CompetitiveScoreboard.FlyingTopOffSetMax ) - (CoD.CompetitiveScoreboard.FlyingTopOffSetMin + CoD.CompetitiveScoreboard.FlyingTopOffSetMax) * 0.5
		f12_local0:beginAnimation( "flying_out", math.random( CoD.CompetitiveScoreboard.FlyingDurationMin, CoD.CompetitiveScoreboard.FlyingDurationMax ) )
		f12_local0:setAlpha( 0 )
		f12_local0:setLeftRight( true, false, -f12_local2, -f12_local2 + CoD.CompetitiveScoreboard.RowWidth )
		f12_local0:setTopBottom( true, false, f12_local3, f12_local3 + CoD.CompetitiveScoreboard.RowHeight )
	end
end

CoD.CompetitiveScoreboard.GetScore = function ( f13_arg0, f13_arg1 )
	for f13_local0 = 1, CoD.CompetitiveScoreboard.TeamPlayerCount, 1 do
		if f13_arg0.Scores[f13_local0].clientNum == f13_arg1 then
			return f13_arg0.Scores[f13_local0]
		end
	end
	return nil
end

CoD.CompetitiveScoreboard.GetFloatingScoreText = function ( f14_arg0 )
	for f14_local0 = 1, CoD.CompetitiveScoreboard.ClientFieldMaxValue, 1 do
		if f14_arg0.floatingScoreTexts[f14_local0].isUsed == false then
			return f14_arg0.floatingScoreTexts[f14_local0]
		end
	end
	return nil
end

CoD.CompetitiveScoreboard.FloatingTextFlyingFinish = function ( f15_arg0, f15_arg1 )
	if f15_arg1.interrupted ~= true then
		f15_arg0.isUsed = false
		f15_arg0:setLeftRight( true, false, -30, -30 + CoD.CompetitiveScoreboard.RowWidth )
		f15_arg0:setTopBottom( true, false, 0, CoD.CompetitiveScoreboard.RowHeight )
	end
end

CoD.CompetitiveScoreboard.Update_ClientField_NavCards = function ( f16_arg0, f16_arg1 )
	local f16_local0, f16_local1 = false
	local f16_local2 = CoD.CompetitiveScoreboard.GetScore( f16_arg0, f16_arg1.entNum )
	for f16_local3 = 1, CoD.CompetitiveScoreboard.NavCardsCount, 1 do
		if CoD.CompetitiveScoreboard.HasBit( f16_arg1.newValue, CoD.CompetitiveScoreboard.Bit( f16_local3 ) ) == true then
			if f16_local2 ~= nil then
				f16_local2.navCardIcons[f16_local3]:setImage( CoD.CompetitiveScoreboard.NavCards[f16_local3] )
				f16_local2.navCardIcons[f16_local3]:setAlpha( 1 )
				f16_local2.navCardIcons[f16_local3].material = CoD.CompetitiveScoreboard.NavCards[f16_local3]
			end
		end
		if f16_local2 ~= nil then
			f16_local2.navCardIcons[f16_local3]:setAlpha( 0 )
			f16_local2.navCardIcons[f16_local3].material = nil
		end
	end
end

CoD.CompetitiveScoreboard.Update_ClientField_Shovel = function ( f17_arg0, f17_arg1 )
	local f17_local0 = f17_arg1.newValue
	local f17_local1 = tonumber( string.sub( f17_arg1.name, string.len( f17_arg1.name ) ) ) - 1
	local f17_local2 = CoD.CompetitiveScoreboard.GetScore( f17_arg0, f17_local1 )
	CoD.CompetitiveScoreboard.ShovelStates[f17_local1 + 1] = f17_local0
	if not f17_local2 then
		return 
	elseif f17_local2.shovelIcon then
		if f17_local0 == CoD.CompetitiveScoreboard.HAVE_SHOVEL then
			f17_local2.shovelIcon:setImage( CoD.CompetitiveScoreboard.ShovelMaterial )
			f17_local2.shovelIcon:setAlpha( 1 )
			f17_local2.shovelIcon.material = CoD.CompetitiveScoreboard.ShovelMaterial
			f17_local2.shovelIcon.itemState = CoD.CompetitiveScoreboard.HAVE_SHOVEL
		elseif f17_local0 == CoD.CompetitiveScoreboard.HAVE_UG_SHOVEL then
			f17_local2.shovelIcon:setImage( CoD.CompetitiveScoreboard.ShovelGoldMaterial )
			f17_local2.shovelIcon:setAlpha( 1 )
			f17_local2.shovelIcon.material = CoD.CompetitiveScoreboard.ShovelGoldMaterial
			f17_local2.shovelIcon.itemState = CoD.CompetitiveScoreboard.HAVE_UG_SHOVEL
		else
			f17_local2.shovelIcon.material = nil
			f17_local2.shovelIcon:setAlpha( 0 )
			f17_local2.shovelIcon.itemState = CoD.CompetitiveScoreboard.NEED_SHOVEL
		end
	end
end

CoD.CompetitiveScoreboard.Update_ClientField_Helmet = function ( f18_arg0, f18_arg1 )
	local f18_local0 = f18_arg1.newValue
	local f18_local1 = tonumber( string.sub( f18_arg1.name, string.len( f18_arg1.name ) ) ) - 1
	local f18_local2 = CoD.CompetitiveScoreboard.GetScore( f18_arg0, f18_local1 )
	CoD.CompetitiveScoreboard.HelmetStates[f18_local1 + 1] = f18_local0
	if not f18_local2 then
		return 
	elseif f18_local2.helmetIcon then
		if f18_local0 == CoD.CompetitiveScoreboard.HAVE_HELMET then
			f18_local2.helmetIcon:setImage( CoD.CompetitiveScoreboard.HardHatMaterial )
			f18_local2.helmetIcon:setAlpha( 1 )
			f18_local2.helmetIcon.material = CoD.CompetitiveScoreboard.HardHatMaterial
			f18_local2.helmetIcon.itemState = CoD.CompetitiveScoreboard.HAVE_HELMET
		else
			f18_local2.helmetIcon.material = nil
			f18_local2.helmetIcon:setAlpha( 0 )
			f18_local2.helmetIcon.itemState = CoD.CompetitiveScoreboard.NEED_HELMET
		end
	end
end

CoD.CompetitiveScoreboard.Bit = function ( f19_arg0 )
	return 2 ^ (f19_arg0 - 1)
end

CoD.CompetitiveScoreboard.HasBit = function ( f20_arg0, f20_arg1 )
	return f20_arg1 <= f20_arg0 % (f20_arg1 + f20_arg1)
end

CoD.CompetitiveScoreboard.UpdateCharacterName = function ( f21_arg0, f21_arg1, f21_arg2, f21_arg3 )
	if not f21_arg1 and f21_arg2.characterName then
		f21_arg2.characterName:setText( "" )
		return 
	elseif UIExpression.IsVisibilityBitSet( controller, CoD.BIT_SPECTATING_CLIENT ) == 1 then
		return 
	elseif f21_arg2.playerModelName ~= f21_arg1 then
		local f21_local0 = 0
		for f21_local1 = 1, #CoD.CompetitiveScoreboard.CharacterNames, 1 do
			if f21_arg1 == CoD.CompetitiveScoreboard.CharacterNames[f21_local1].modelName then
				f21_local0 = f21_local1
				break
			end
		end
		if f21_local0 > 0 and f21_arg2.characterName then
			f21_arg2.characterName:setText( CoD.CompetitiveScoreboard.CharacterNames[f21_local0].name )
			f21_arg2.playerModelName = f21_arg1
			if CoD.CompetitiveScoreboard.IsDLC3Map == true then
				f21_arg2.characterName.fadeOutTimer = LUI.UITimer.new( CoD.CompetitiveScoreboard.CHARACTER_NAME_ONSCREEN_DURATION, "character_name_fade_out", true, f21_arg0 )
				f21_arg2.characterName:addElement( f21_arg2.characterName.fadeOutTimer )
			end
		end
	end
end

CoD.CompetitiveScoreboard.FadeoutCharacterName = function ( f22_arg0, f22_arg1 )
	f22_arg0:beginAnimation( "fade_out", CoD.CompetitiveScoreboard.CHARACTER_NAME_FADE_OUT_DURATION )
	f22_arg0:setAlpha( 0 )
end

CoD.CompetitiveScoreboard.ClearCharacterName = function ( f23_arg0 )
	if f23_arg0.playerModelName then
		f23_arg0.playerModelName = nil
		f23_arg0.characterName:setText( "" )
	end
end