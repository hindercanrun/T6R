CoD.Perks = {}
if CoD.Zombie.IsDLCMap( CoD.Zombie.DLC3Maps ) then
	CoD.Perks.TopStart = -180
elseif CoD.Zombie.IsDLCMap( CoD.Zombie.DLC4Maps ) then
	CoD.Perks.TopStart = -185
else
	CoD.Perks.TopStart = -140
end
CoD.Perks.IconSize = 36
CoD.Perks.Spacing = 8
CoD.Perks.STATE_NOTOWNED = 0
CoD.Perks.STATE_OWNED = 1
CoD.Perks.STATE_PAUSED = 2
CoD.Perks.STATE_TBD = 3
CoD.Perks.ClientFieldNames = {}
CoD.Perks.ClientFieldNames[1] = {
	clientFieldName = "perk_additional_primary_weapon",
	material = RegisterMaterial( "specialty_additionalprimaryweapon_zombies " )
}
CoD.Perks.ClientFieldNames[2] = {
	clientFieldName = "perk_dead_shot",
	material = RegisterMaterial( "specialty_ads_zombies " )
}
CoD.Perks.ClientFieldNames[3] = {
	clientFieldName = "perk_dive_to_nuke",
	material = RegisterMaterial( "specialty_divetonuke_zombies " )
}
CoD.Perks.ClientFieldNames[4] = {
	clientFieldName = "perk_double_tap",
	material = RegisterMaterial( "specialty_doubletap_zombies " )
}
CoD.Perks.ClientFieldNames[5] = {
	clientFieldName = "perk_juggernaut",
	material = RegisterMaterial( "specialty_juggernaut_zombies " )
}
CoD.Perks.ClientFieldNames[6] = {
	clientFieldName = "perk_marathon",
	material = RegisterMaterial( "specialty_marathon_zombies " )
}
CoD.Perks.ClientFieldNames[7] = {
	clientFieldName = "perk_quick_revive",
	material = RegisterMaterial( "specialty_quickrevive_zombies " )
}
CoD.Perks.ClientFieldNames[8] = {
	clientFieldName = "perk_sleight_of_hand",
	material = RegisterMaterial( "specialty_fastreload_zombies " )
}
CoD.Perks.ClientFieldNames[9] = {
	clientFieldName = "perk_tombstone",
	material = RegisterMaterial( "specialty_tombstone_zombies " )
}
CoD.Perks.ClientFieldNames[10] = {
	clientFieldName = "perk_chugabud",
	material = RegisterMaterial( "specialty_chugabud_zombies " )
}
CoD.Perks.ClientFieldNames[11] = {
	clientFieldName = "perk_electric_cherry",
	material = RegisterMaterial( "specialty_electric_cherry_zombie " )
}
CoD.Perks.ClientFieldNames[12] = {
	clientFieldName = "perk_vulture",
	material = RegisterMaterial( "specialty_vulture_zombies " ),
	glowMaterial = RegisterMaterial( "zm_hud_stink_perk_glow " )
}
CoD.Perks.PulseDuration = 200
CoD.Perks.PulseScale = 1.3
CoD.Perks.PausedAlpha = 0.3
LUI.createMenu.PerksArea = function ( f1_arg0 )
	local f1_local0 = CoD.Menu.NewSafeAreaFromState( "PerksArea", f1_arg0 )
	f1_local0:setOwner( f1_arg0 )
	f1_local0.scaleContainer = CoD.SplitscreenScaler.new( nil, CoD.Zombie.SplitscreenMultiplier )
	f1_local0.scaleContainer:setLeftRight( true, false, 10, 0 )
	f1_local0.scaleContainer:setTopBottom( false, true, 0, 0 )
	f1_local0:addElement( f1_local0.scaleContainer )
	CoD.Perks.MeterBlackMaterial = RegisterMaterial( "zm_hud_stink_ani_black " )
	CoD.Perks.MeterGreenMaterial = RegisterMaterial( "zm_hud_stink_ani_green " )
	local f1_local1, f1_local2 = nil
	local f1_local3 = CoD.Perks.TopStart
	local f1_local4 = f1_local3 + CoD.Perks.IconSize
	f1_local0.perks = {}
	for f1_local5 = 1, #CoD.Perks.ClientFieldNames, 1 do
		f1_local1 = (CoD.Perks.IconSize + CoD.Perks.Spacing) * (f1_local5 - 1)
		f1_local2 = f1_local1 + CoD.Perks.IconSize
		local self = LUI.UIElement.new()
		self:setLeftRight( true, false, f1_local1, f1_local2 )
		self:setTopBottom( false, true, f1_local3, f1_local4 )
		self:setScale( 1 )
		self.perkId = nil
		
		local perkIcon = LUI.UIImage.new()
		perkIcon:setLeftRight( true, true, 0, 0 )
		perkIcon:setTopBottom( true, true, 0, 0 )
		perkIcon:setAlpha( 0 )
		self:addElement( perkIcon )
		self.perkIcon = perkIcon
		
		self:registerEventHandler( "transition_complete_pulse", CoD.Perks.IconPulseFinish )
		f1_local0.scaleContainer:addElement( self )
		f1_local0.perks[f1_local5] = self
		f1_local0:registerEventHandler( CoD.Perks.ClientFieldNames[f1_local5].clientFieldName, CoD.Perks.Update )
	end
	f1_local0:registerEventHandler( "hud_update_refresh", CoD.Perks.UpdateVisibility )
	f1_local0:registerEventHandler( "hud_update_bit_" .. CoD.BIT_HUD_VISIBLE, CoD.Perks.UpdateVisibility )
	f1_local0:registerEventHandler( "hud_update_bit_" .. CoD.BIT_IS_PLAYER_IN_AFTERLIFE, CoD.Perks.UpdateVisibility )
	f1_local0:registerEventHandler( "hud_update_bit_" .. CoD.BIT_EMP_ACTIVE, CoD.Perks.UpdateVisibility )
	f1_local0:registerEventHandler( "hud_update_bit_" .. CoD.BIT_DEMO_CAMERA_MODE_MOVIECAM, CoD.Perks.UpdateVisibility )
	f1_local0:registerEventHandler( "hud_update_bit_" .. CoD.BIT_DEMO_ALL_GAME_HUD_HIDDEN, CoD.Perks.UpdateVisibility )
	f1_local0:registerEventHandler( "hud_update_bit_" .. CoD.BIT_IN_VEHICLE, CoD.Perks.UpdateVisibility )
	f1_local0:registerEventHandler( "hud_update_bit_" .. CoD.BIT_IN_GUIDED_MISSILE, CoD.Perks.UpdateVisibility )
	f1_local0:registerEventHandler( "hud_update_bit_" .. CoD.BIT_IN_REMOTE_KILLSTREAK_STATIC, CoD.Perks.UpdateVisibility )
	f1_local0:registerEventHandler( "hud_update_bit_" .. CoD.BIT_AMMO_COUNTER_HIDE, CoD.Perks.UpdateVisibility )
	f1_local0:registerEventHandler( "hud_update_bit_" .. CoD.BIT_IS_FLASH_BANGED, CoD.Perks.UpdateVisibility )
	f1_local0:registerEventHandler( "hud_update_bit_" .. CoD.BIT_UI_ACTIVE, CoD.Perks.UpdateVisibility )
	f1_local0:registerEventHandler( "hud_update_bit_" .. CoD.BIT_SPECTATING_CLIENT, CoD.Perks.UpdateVisibility )
	f1_local0:registerEventHandler( "hud_update_bit_" .. CoD.BIT_SCOREBOARD_OPEN, CoD.Perks.UpdateVisibility )
	f1_local0:registerEventHandler( "hud_update_bit_" .. CoD.BIT_PLAYER_DEAD, CoD.Perks.UpdateVisibility )
	f1_local0:registerEventHandler( "hud_update_bit_" .. CoD.BIT_IS_SCOPED, CoD.Perks.UpdateVisibility )
	f1_local0.visible = true
	return f1_local0
end

CoD.Perks.UpdateVisibility = function ( f2_arg0, f2_arg1 )
	local f2_local0 = f2_arg1.controller
	if UIExpression.IsVisibilityBitSet( f2_local0, CoD.BIT_HUD_VISIBLE ) == 1 and UIExpression.IsVisibilityBitSet( f2_local0, CoD.BIT_IS_PLAYER_IN_AFTERLIFE ) == 0 and UIExpression.IsVisibilityBitSet( f2_local0, CoD.BIT_EMP_ACTIVE ) == 0 and UIExpression.IsVisibilityBitSet( f2_local0, CoD.BIT_DEMO_CAMERA_MODE_MOVIECAM ) == 0 and UIExpression.IsVisibilityBitSet( f2_local0, CoD.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) == 0 and UIExpression.IsVisibilityBitSet( f2_local0, CoD.BIT_IN_VEHICLE ) == 0 and UIExpression.IsVisibilityBitSet( f2_local0, CoD.BIT_IN_GUIDED_MISSILE ) == 0 and UIExpression.IsVisibilityBitSet( f2_local0, CoD.BIT_IN_REMOTE_KILLSTREAK_STATIC ) == 0 and UIExpression.IsVisibilityBitSet( f2_local0, CoD.BIT_AMMO_COUNTER_HIDE ) == 0 and UIExpression.IsVisibilityBitSet( f2_local0, CoD.BIT_IS_FLASH_BANGED ) == 0 and UIExpression.IsVisibilityBitSet( f2_local0, CoD.BIT_UI_ACTIVE ) == 0 and UIExpression.IsVisibilityBitSet( f2_local0, CoD.BIT_SCOREBOARD_OPEN ) == 0 and UIExpression.IsVisibilityBitSet( f2_local0, CoD.BIT_IS_SCOPED ) == 0 and (not CoD.IsShoutcaster( f2_local0 ) or CoD.ExeProfileVarBool( f2_local0, "shoutcaster_scorestreaks" ) and Engine.IsSpectatingActiveClient( f2_local0 )) and CoD.FSM_VISIBILITY( f2_local0 ) == 0 then
		if f2_arg0.visible ~= true then
			f2_arg0:setAlpha( 1 )
			f2_arg0.m_inputDisabled = nil
			f2_arg0.visible = true
		end
	elseif f2_arg0.visible == true then
		f2_arg0:setAlpha( 0 )
		f2_arg0.m_inputDisabled = true
		f2_arg0.visible = nil
	end
	f2_arg0:dispatchEventToChildren( f2_arg1 )
end

CoD.Perks.GetMaterial = function ( f3_arg0, f3_arg1 )
	local f3_local0 = nil
	for f3_local1 = 1, #CoD.Perks.ClientFieldNames, 1 do
		if CoD.Perks.ClientFieldNames[f3_local1].clientFieldName == f3_arg1 then
			f3_local0 = CoD.Perks.ClientFieldNames[f3_local1].material
			break
		end
	end
	return f3_local0
end

CoD.Perks.GetGlowMaterial = function ( f4_arg0, f4_arg1 )
	local f4_local0 = nil
	for f4_local1 = 1, #CoD.Perks.ClientFieldNames, 1 do
		if CoD.Perks.ClientFieldNames[f4_local1].clientFieldName == f4_arg1 then
			if CoD.Perks.ClientFieldNames[f4_local1].glowMaterial then
				f4_local0 = CoD.Perks.ClientFieldNames[f4_local1].glowMaterial
				break
			end
		end
	end
	return f4_local0
end

CoD.Perks.RemovePerkIcon = function ( f5_arg0, f5_arg1 )
	local f5_local0, f5_local1 = nil
	for f5_local2 = f5_arg1, #CoD.Perks.ClientFieldNames, 1 do
		f5_local0 = f5_arg0.perks[f5_local2]
		if not f5_local0.perkId then
			break
		elseif f5_local2 ~= #CoD.Perks.ClientFieldNames then
			f5_local1 = f5_arg0.perks[f5_local2 + 1]
		end
		if not f5_local1 then
			f5_local0.perkIcon:setAlpha( 0 )
			if f5_local0.perkGlowIcon then
			
			else
				f5_local0.perkId = nil
				break
			end
			f5_local0.perkGlowIcon:setAlpha( 0 )
		elseif not f5_local1.perkId then
			f5_local0.perkIcon:setAlpha( 0 )
			if f5_local0.perkGlowIcon then
				f5_local0.perkGlowIcon:close()
				f5_local0.perkGlowIcon = nil
			end
			if f5_local0.meterContainer then
			
			else
				f5_local0.perkId = nil
				break
			end
			f5_local0.meterContainer:close()
			f5_local0.meterContainer = nil
		else
			f5_local0.perkIcon:setImage( CoD.Perks.GetMaterial( f5_arg0, f5_local1.perkId ) )
			local f5_local5 = CoD.Perks.GetGlowMaterial( f5_arg0, f5_local1.perkId )
			if f5_local5 and f5_local0.perkGlowIcon then
				f5_local0.perkGlowIcon:setImage( f5_local5 )
			end
		end
		f5_local0.perkId = f5_local1.perkId
	end
end

CoD.Perks.Update = function ( f6_arg0, f6_arg1 )
	local f6_local0 = nil
	for f6_local1 = 1, #CoD.Perks.ClientFieldNames, 1 do
		f6_local0 = f6_arg0.perks[f6_local1]
		if f6_arg1.newValue == CoD.Perks.STATE_OWNED then
			if not f6_local0.perkId then
				f6_local0.perkId = f6_arg1.name
				f6_local0.perkIcon:setImage( CoD.Perks.GetMaterial( f6_arg0, f6_arg1.name ) )
				f6_local0.perkIcon:setAlpha( 1 )
				if f6_local0.perkId == "perk_vulture" then
				
				else
					local f6_local4 = CoD.Perks.GetGlowMaterial( f6_arg0, f6_arg1.name )
					if f6_local4 and f6_local0.perkGlowIcon then
						f6_local0.perkGlowIcon:setImage( f6_local4 )
						break
					end
				end
				CoD.Perks.AddGlowIcon( f6_arg0, f6_local0 )
				CoD.Perks.AddVultureMeter( f6_arg0, f6_local0 )
			elseif f6_local0.perkId == f6_arg1.name then
				f6_local0:beginAnimation( "pulse", CoD.Perks.PulseDuration )
				f6_local0:setScale( CoD.Perks.PulseScale )
				f6_local0.perkIcon:beginAnimation( "pulse", CoD.Perks.PulseDuration )
				f6_local0.perkIcon:setAlpha( 1 )
				if f6_local0.perkGlowIcon then
					f6_local0.perkGlowIcon:beginAnimation( "pulse", CoD.Perks.PulseDuration )
					break
				end
			end
		end
		if f6_arg1.newValue == CoD.Perks.STATE_NOTOWNED then
			if f6_local0.perkId == f6_arg1.name then
				CoD.Perks.RemovePerkIcon( f6_arg0, f6_local1 )
				break
			end
		end
		if f6_arg1.newValue == CoD.Perks.STATE_PAUSED then
			if f6_local0.perkId == f6_arg1.name then
				f6_local0:beginAnimation( "pulse", CoD.Perks.PulseDuration )
				f6_local0:setScale( CoD.Perks.PulseScale )
				f6_local0.perkIcon:beginAnimation( "pulse", CoD.Perks.PulseDuration )
				f6_local0.perkIcon:setAlpha( CoD.Perks.PausedAlpha )
				if f6_local0.perkGlowIcon then
					f6_local0.perkGlowIcon:beginAnimation( "pulse", CoD.Perks.PulseDuration )
					f6_local0.perkGlowIcon:setAlpha( 0 )
					break
				end
			end
		end
		if f6_arg1.newValue == CoD.Perks.STATE_TBD then
			
		end
	end
end

CoD.Perks.IconPulseFinish = function ( f7_arg0, f7_arg1 )
	if f7_arg1.interrupted ~= true then
		f7_arg0:beginAnimation( "pulse_done", CoD.Perks.PulseDuration )
		f7_arg0:setScale( 1 )
	end
end

CoD.Perks.AddGlowIcon = function ( f8_arg0, f8_arg1 )
	if not f8_arg1.perkGlowIcon then
		local self = LUI.UIImage.new()
		self:setLeftRight( true, true, -CoD.Perks.IconSize / 2, CoD.Perks.IconSize / 2 )
		self:setTopBottom( true, true, -CoD.Perks.IconSize / 2, CoD.Perks.IconSize / 2 )
		self:setAlpha( 0 )
		f8_arg1:addElement( self )
		f8_arg1.perkGlowIcon = self
	end
end

CoD.Perks.AddVultureMeter = function ( f9_arg0, f9_arg1 )
	if not f9_arg1.meterContainer then
		local f9_local0 = CoD.Perks.TopStart + CoD.Perks.IconSize * 2
		local f9_local1 = -CoD.Perks.IconSize
		
		local meterContainer = LUI.UIElement.new()
		meterContainer:setLeftRight( true, false, 0, CoD.Perks.IconSize )
		meterContainer:setTopBottom( false, true, f9_local0 + 5, f9_local1 + 5 )
		meterContainer:setAlpha( 0 )
		meterContainer:setPriority( -10 )
		f9_arg1:addElement( meterContainer )
		f9_arg1.meterContainer = meterContainer
		
		local f9_local3 = LUI.UIImage.new()
		f9_local3:setLeftRight( true, true, -CoD.Perks.IconSize / 2, CoD.Perks.IconSize / 2 )
		f9_local3:setTopBottom( true, true, 0, 0 )
		f9_local3:setImage( CoD.Perks.MeterBlackMaterial )
		meterContainer:addElement( f9_local3 )
		local f9_local4 = LUI.UIImage.new()
		f9_local4:setLeftRight( true, true, -CoD.Perks.IconSize / 2, CoD.Perks.IconSize / 2 )
		f9_local4:setTopBottom( true, true, 0, 0 )
		f9_local4:setImage( CoD.Perks.MeterGreenMaterial )
		meterContainer:addElement( f9_local4 )
		f9_arg1:registerEventHandler( "vulture_perk_disease_meter", CoD.Perks.UpdateVultureDiseaseMeter )
	end
end

CoD.Perks.UpdateVultureDiseaseMeter = function ( f10_arg0, f10_arg1 )
	local f10_local0 = f10_arg1.newValue
	if f10_arg0.meterContainer then
		f10_arg0.meterContainer:setAlpha( f10_local0 )
	end
	if f10_arg0.perkGlowIcon then
		f10_arg0.perkGlowIcon:setAlpha( f10_local0 )
	end
end