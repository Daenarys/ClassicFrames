local CF_HEADER = "Classic Frames"
CfOptionsPanelMixin = {}
function CfOptionsPanelMixin:OnLoad()
	self.isLoggingPaused = false
	self.loadTime = GetTime()
	self.showingArguments = true
	self.idCounter = CreateCounter()
	self.frameCounter = 0
	local timer = CreateFrame("FRAME")
	timer:SetScript("OnUpdate", function(o, elapsed)
		self.frameCounter = self.frameCounter + 1
	end)
	self:RegisterAllEvents()
    
    self.Options = LibStub("AceGUI-3.0"):Create("SimpleGroup")
    self.Options.frame:ClearAllPoints()
    self.Options.frame:SetAllPoints(self.Inset)

    self:Hide()

    self:SetScript("OnKeyDown", function(_,key)
        if (self:IsShown() and key == "ESCAPE") then
            self:Hide()
        end
    end)
    self:SetPropagateKeyboardInput(true)

    -- Initialize
    self:SetTitle(CF_HEADER)
	self:SetPortraitToAsset("interface\\icons\\trade_engineering")

    -- skin
    ApplyCloseButton(self.CloseButton)
	self.PortraitContainer.CircleMask:Hide()
	CfOptionsPortrait:SetSize(61, 61)
	CfOptionsPortrait:ClearAllPoints()
	CfOptionsPortrait:SetPoint("TOPLEFT", -6, 8)
	self.TitleContainer:ClearAllPoints()
	self.TitleContainer:SetPoint("TOPLEFT", self, "TOPLEFT", 58, 0)
	self.TitleContainer:SetPoint("TOPRIGHT", self, "TOPRIGHT", -58, 0)
	ApplyTitleBg(self)
	ApplyNineSlicePortrait(self)
end

function CfOptionsPanelMixin:OnHide()
    self.Options.frame:Hide()
end