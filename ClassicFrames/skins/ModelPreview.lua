if not _G.ModelPreviewFrame then return end

ApplyCloseButton(ModelPreviewFrameCloseButton)

ModelPreviewFrame.TitleContainer:ClearAllPoints()
ModelPreviewFrame.TitleContainer:SetPoint("TOPLEFT", ModelPreviewFrame, "TOPLEFT", 58, 0)
ModelPreviewFrame.TitleContainer:SetPoint("TOPRIGHT", ModelPreviewFrame, "TOPRIGHT", -58, 0)

ApplyTitleBgNoPortrait(ModelPreviewFrame)
ApplyNineSliceNoPortrait(ModelPreviewFrame)

ModelPreviewFrame.Bg:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\UI-Background-Rock", true, true)

ModelPreviewFrame.Display.ModelScene.ControlFrame:HookScript("OnShow", function(self)
	self:SetPoint("TOP")
end)