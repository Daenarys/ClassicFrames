hooksecurefunc(NamePlateClassificationFrameMixin, "UpdateClassificationIndicator", function(frame)
    if (frame.classificationIndicator) then
        local classification = frame:GetClassification()
        if (classification == "rare") then
            frame.classificationIndicator:SetAtlas("nameplates-icon-elite-silver")
        end
    end
end)