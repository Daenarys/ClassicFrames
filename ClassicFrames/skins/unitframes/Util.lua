local framesToSyncAndHide =
{       
    ["CfTargetFrame"] =
        {
            ["name"] = "TargetFrame",
            ["xOffset"] = 20,
            ["yOffset"] = -4,
        },
    ["CfFocusFrame"] =
        {
            ["name"] = "FocusFrame",
            ["xOffset"] = 22,
            ["yOffset"] = -4,
        }
}

function CfUtil_AlwaysHide(frame)
    frame:SetAlpha(0);

    hooksecurefunc(frame, "Show", function()
        frame:SetAlpha(0);
    end)
end

function CfUtil_AlwaysSync(parent, child, xOffset, yOffset)
    child:ClearAllPoints();
    child:SetPoint("TOPLEFT", parent, "TOPLEFT", xOffset, yOffset);
    child:SetScale(parent:GetScale());

    hooksecurefunc(parent, "SetPoint", function(frame, ...)
        child:ClearAllPoints();
        child:SetPoint("TOPLEFT", parent, "TOPLEFT", xOffset, yOffset);
    end)
        hooksecurefunc(parent, "SetScale", function(frame, s)
        child:SetScale(s);
    end)
    if parent.HighlightSystem then
        hooksecurefunc(parent, "HighlightSystem", function (frame)
            child.isInEditMode = true;
            child:SetFrameStrata("BACKGROUND")
        end)
    end
    if parent.ClearHighlight then
        hooksecurefunc(parent, "ClearHighlight", function (frame)
            child.isInEditMode = false;
            child:SetFrameStrata("LOW")
        end)
    end
end

for newFrameName, frameInfo in pairs(framesToSyncAndHide) do
    CfUtil_AlwaysHide(_G[frameInfo["name"]]);
    CfUtil_AlwaysSync(_G[frameInfo["name"]], _G[newFrameName], frameInfo["xOffset"], frameInfo["yOffset"]);
    _G[newFrameName]:EnableMouse(false);
end

PlayerFrame:HookScript("OnEvent", function(self)
    local classPowerBar = self.classPowerBar
    if (classPowerBar) then
        classPowerBar:UnregisterAllEvents()
        classPowerBar:Hide()
    end
    if (EssencePlayerFrame) then
        EssencePlayerFrame:UnregisterAllEvents()
        EssencePlayerFrame:Hide()
    end
    if (RuneFrame) then
        RuneFrame:UnregisterAllEvents()
        RuneFrame:Hide()
    end
end)

hooksecurefunc(TargetFrame, "menu", function(self)
    DropDownList1:ClearAllPoints()
    DropDownList1:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 140, 6)
end)

if TargetFrame.totFrame then
    TargetFrame.totFrame:SetScale(0.80)
    TargetFrame.totFrame:ClearAllPoints()
    TargetFrame.totFrame:SetPoint("TOPRIGHT", TargetFrame, "BOTTOMRIGHT", -10, 27)
end