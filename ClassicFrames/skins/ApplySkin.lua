function ApplyDialogBorder(frame)
	frame.TopLeftCorner:SetAtlas("UI-Frame-DiamondMetal-CornerTopLeft", true)
	frame.TopLeftCorner:ClearAllPoints()
	frame.TopLeftCorner:SetPoint("TOPLEFT")

	frame.TopRightCorner:SetAtlas("UI-Frame-DiamondMetal-CornerTopRight", true)
	frame.TopRightCorner:ClearAllPoints()
	frame.TopRightCorner:SetPoint("TOPRIGHT")

	frame.BottomLeftCorner:SetAtlas("UI-Frame-DiamondMetal-CornerBottomLeft", true)
	frame.BottomLeftCorner:ClearAllPoints()
	frame.BottomLeftCorner:SetPoint("BOTTOMLEFT")

	frame.BottomRightCorner:SetAtlas("UI-Frame-DiamondMetal-CornerBottomRight", true)
	frame.BottomRightCorner:ClearAllPoints()
	frame.BottomRightCorner:SetPoint("BOTTOMRIGHT")

	frame.TopEdge:SetAtlas("_UI-Frame-DiamondMetal-EdgeTop", true)
	frame.TopEdge:SetHorizTile(true)
	frame.TopEdge:ClearAllPoints()
	frame.TopEdge:SetPoint("TOPLEFT", frame.TopLeftCorner, "TOPRIGHT")
	frame.TopEdge:SetPoint("TOPRIGHT", frame.TopRightCorner, "TOPLEFT")

	frame.BottomEdge:SetAtlas("_UI-Frame-DiamondMetal-EdgeBottom", true)
	frame.BottomEdge:SetHorizTile(true)
	frame.BottomEdge:ClearAllPoints()
	frame.BottomEdge:SetPoint("BOTTOMLEFT", frame.BottomLeftCorner, "BOTTOMRIGHT")
	frame.BottomEdge:SetPoint("BOTTOMRIGHT", frame.BottomRightCorner, "BOTTOMLEFT")

	frame.LeftEdge:SetAtlas("!UI-Frame-DiamondMetal-EdgeLeft", true)
	frame.LeftEdge:SetVertTile(true)
	frame.LeftEdge:SetPoint("TOPLEFT", frame.TopLeftCorner, "BOTTOMLEFT")
	frame.LeftEdge:SetPoint("BOTTOMLEFT", frame.BottomLeftCorner, "TOPLEFT")

	frame.RightEdge:SetAtlas("!UI-Frame-DiamondMetal-EdgeRight", true)
	frame.RightEdge:SetVertTile(true)
	frame.RightEdge:ClearAllPoints()
	frame.RightEdge:SetPoint("TOPRIGHT", frame.TopRightCorner, "BOTTOMRIGHT")
	frame.RightEdge:SetPoint("BOTTOMRIGHT", frame.BottomRightCorner, "TOPRIGHT")
end

function ApplyScrollBarArrow(frame)
	frame.Back:SetSize(18, 16)
	frame.Back:SetNormalAtlas("UI-ScrollBar-ScrollUpButton-Up")
	frame.Back:SetPushedAtlas("UI-ScrollBar-ScrollUpButton-Down")
	frame.Back:SetDisabledAtlas("UI-ScrollBar-ScrollUpButton-Disabled")
	frame.Back:SetHighlightAtlas("UI-ScrollBar-ScrollUpButton-Highlight")
	frame.Back:ClearAllPoints()
	frame.Back:SetPoint("TOPLEFT", 4, -4)

	frame.Forward:SetSize(18, 16)
	frame.Forward:SetNormalAtlas("UI-ScrollBar-ScrollDownButton-Up")
	frame.Forward:SetPushedAtlas("UI-ScrollBar-ScrollDownButton-Down")
	frame.Forward:SetDisabledAtlas("UI-ScrollBar-ScrollDownButton-Disabled")
	frame.Forward:SetHighlightAtlas("UI-ScrollBar-ScrollDownButton-Highlight")
	frame.Forward:SetPoint("BOTTOMLEFT", 4, 4)
end

function ApplyScrollBarTrack(frame)
	frame:SetWidth(18)
	frame:ClearAllPoints()
	frame:SetPoint("TOPLEFT", 4, -22)
	frame:SetPoint("BOTTOMRIGHT", -4, 22)
	
	frame.Begin:SetAtlas("UI-ScrollBar-EndCap-Top", true)
	frame.Begin:ClearAllPoints()
	frame.Begin:SetPoint("TOPLEFT", -4, 22)

	frame.End:SetAtlas("UI-ScrollBar-EndCap-Bottom", true)
	frame.End:ClearAllPoints()
	frame.End:SetPoint("BOTTOMLEFT", -4, -22)

	frame.Middle:SetAtlas("!UI-ScrollBar-Center", true)
	frame.Middle:ClearAllPoints()
	frame.Middle:SetPoint("TOPLEFT", frame.Begin, "BOTTOMLEFT")
	frame.Middle:SetPoint("BOTTOMRIGHT", frame.End, "TOPRIGHT")
end

function ApplyScrollBarThumb(frame)
	frame:SetWidth(18)
	frame.Begin:SetAtlas("UI-ScrollBar-Knob-EndCap-Top")
	frame.End:SetAtlas("UI-ScrollBar-Knob-EndCap-Bottom")
	frame.Middle:SetAtlas("UI-ScrollBar-Knob-Center")
	frame.upBeginTexture = "UI-ScrollBar-Knob-EndCap-Top"
	frame.upMiddleTexture = "UI-ScrollBar-Knob-Center"
	frame.upEndTexture = "UI-ScrollBar-Knob-EndCap-Bottom"
	frame.overBeginTexture = "UI-ScrollBar-Knob-MouseOver-EndCap-Top"
	frame.overMiddleTexture = "UI-ScrollBar-Knob-MouseOver-Center"
	frame.overEndTexture = "UI-ScrollBar-Knob-MouseOver-EndCap-Bottom"
	frame.downBeginTexture = "UI-ScrollBar-Knob-EndCap-Top-Disabled"
	frame.downMiddleTexture = "UI-ScrollBar-Knob-Center-Disabled"
	frame.downEndTexture = "UI-ScrollBar-Knob-EndCap-Bottom-Disabled"
	frame.Middle:ClearAllPoints()
	frame.Middle:SetPoint("TOPLEFT", 0, -5)
	frame.Middle:SetPoint("BOTTOMRIGHT", 0, 5)
end