hooksecurefunc("GameTooltip_SetDefaultAnchor", function(self, parent) self:SetOwner(parent, "ANCHOR_CURSOR_RIGHT", 30, -100) end)

GameTooltip:HookScript("OnTooltipSetUnit", function(GameTooltip)
	local _, unit = GameTooltip:GetUnit()
	if UnitIsPlayer(unit) then
		local _, class = UnitClass(unit)
		local color = class and (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[class]
		local unitGuild = GetGuildInfo(unit)
		if color then
			local text = GameTooltipTextLeft1:GetText()
			GameTooltipTextLeft1:SetFormattedText("|cff%02x%02x%02x%s|r", color.r * 255, color.g * 255, color.b * 255, text:match("|cff\x\x\x\x\x\x(.+)|r") or text)
		end
		if unitGuild then
			GameTooltipTextLeft2:SetText("<"..unitGuild..">")
		end
	else
		local text2 = GameTooltipTextLeft2:GetText()
		if (text2 and string.sub(text2,1,string.len("Level ")) ~= "Level ") then
			GameTooltipTextLeft2:SetText("<"..text2..">")
		end
	end
end)
