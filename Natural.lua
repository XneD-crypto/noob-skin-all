local NoobSkinBtn = createGrayButton("NOOB SKIN ALL")
NoobSkinBtn.MouseButton1Click:Connect(function()
    local function SendNotification(title, text)
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = 5
        })
    end
 
    SendNotification("Delta Injector", "Поиск всех ClickDetector...")
 
    if game:GetService("CoreGui"):FindFirstChild("PurchasePromptApp") then
        game:GetService("CoreGui").PurchasePromptApp:Destroy()
        SendNotification("Delta Injector", "PurchasePromptApp удален.")
    end
 
    local player = game:GetService("Players").LocalPlayer
    if player and player:FindFirstChild("PlayerGui") then
        local mainGui = player.PlayerGui:FindFirstChild("MainGui")
        if mainGui and mainGui:FindFirstChild("HoverSound") then
            mainGui.HoverSound.Volume = 0
        end
    end
 
    local allDetectors = {}
    for _, obj in pairs(game:GetService("Workspace"):GetDescendants()) do
        if obj:IsA("ClickDetector") then
            table.insert(allDetectors, obj)
        end
    end
 
    if #allDetectors == 0 then
        SendNotification("Delta Injector", "НЕ РАБОТАЕТ: ClickDetector не найдены.")
        return
    else
        SendNotification("Delta Injector", "Найдено детекторов: " .. #allDetectors .. ". Начинаю клики.")
    end
 
    for i = 1, 20000 do
        for _, detector in ipairs(allDetectors) do
            fireclickdetector(detector)
        end
        if i % 30 == 1 then
            task.wait()
        end
    end
 
    SendNotification("Delta Injector", "Готово! 20000 циклов выполнено.")
    print("Noob Skin All запущен")
end)
