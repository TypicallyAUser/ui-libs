local Library = {}

function Library:CreateMain()
    local UI_1 = Instance.new("ScreenGui")
    local Main = Instance.new("Frame")
    local Glow = Instance.new("ImageLabel")
    local Title = Instance.new("TextLabel")
    local TabButtons = Instance.new("Frame")
    local List = Instance.new("UIListLayout")
    local Tabs = Instance.new("Frame")
    local Line = Instance.new("Frame")

    UI_1.Name = "UI_1"
    UI_1.Parent = game.CoreGui
    UI_1.ResetOnSpawn = false

    Main.Name = "Main"
    Main.Parent = UI_1
    Main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Main.BorderSizePixel = 0
    Main.Position = UDim2.new(0.218978107, 0, 0.175438598, 0)
    Main.Size = UDim2.new(0, 581, 0, 333)

    Glow.Name = "Glow"
    Glow.Parent = Main
    Glow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Glow.BackgroundTransparency = 1.000
    Glow.BorderSizePixel = 0
    Glow.Position = UDim2.new(0, -15, 0, -15)
    Glow.Size = UDim2.new(1, 30, 1, 30)
    Glow.ZIndex = 0
    Glow.Image = "rbxassetid://4996891970"
    Glow.ImageColor3 = Color3.fromRGB(15, 15, 15)
    Glow.ScaleType = Enum.ScaleType.Slice
    Glow.SliceCenter = Rect.new(20, 20, 280, 280)

    Title.Name = "Title"
    Title.Parent = Main
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1.000
    Title.Position = UDim2.new(0.0200573057, 0, 0, 0)
    Title.Size = UDim2.new(0, 136, 0, 40)
    Title.Font = Enum.Font.GothamBold
    Title.Text = "TYPICAL HUB"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 20.000
    Title.TextWrapped = true

    TabButtons.Name = "TabButtons"
    TabButtons.Parent = Main
    TabButtons.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabButtons.BackgroundTransparency = 1.000
    TabButtons.Position = UDim2.new(0, 0, 0.120120123, 0)
    TabButtons.Size = UDim2.new(0, 117, 0, 293)

    List.Name = "List"
    List.Parent = TabButtons
    List.SortOrder = Enum.SortOrder.LayoutOrder
    List.Padding = UDim.new(0, 5)

    Tabs.Name = "Tabs"
    Tabs.Parent = Main
    Tabs.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Tabs.BorderSizePixel = 0
    Tabs.Position = UDim2.new(0.20137693, 0, 0.120120123, 0)
    Tabs.Size = UDim2.new(0, 464, 0, 293)

    Line.Name = "Line"
    Line.Parent = Main
    Line.BackgroundColor3 = Color3.fromRGB(85, 255, 127)
    Line.BorderSizePixel = 0
    Line.Position = UDim2.new(0, 0, 0.114114121, 0)
    Line.Size = UDim2.new(0, 581, 0, 2)

    local function BKASY_fake_script() -- Main.Dragify 
        local script = Instance.new('LocalScript', Main)
    
        local UIS = game:GetService("UserInputService")
        function dragify(Frame)
            dragToggle = nil
            local dragSpeed = 0
            dragInput = nil
            dragStart = nil
            local dragPos = nil
            function updateInput(input)
                local Delta = input.Position - dragStart
                local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
                game:GetService("TweenService"):Create(Frame, TweenInfo.new(0.25), {Position = Position}):Play()
            end
            Frame.InputBegan:Connect(function(input)
                if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UIS:GetFocusedTextBox() == nil then
                    dragToggle = true
                    dragStart = input.Position
                    startPos = Frame.Position
                    input.Changed:Connect(function()
                        if input.UserInputState == Enum.UserInputState.End then
                            dragToggle = false
                        end
                    end)
                end
            end)
            Frame.InputChanged:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                    dragInput = input
                end
            end)
            game:GetService("UserInputService").InputChanged:Connect(function(input)
                if input == dragInput and dragToggle then
                    updateInput(input)
                end
            end)
        end
        
        dragify(script.Parent)
    end
    coroutine.wrap(BKASY_fake_script)()

    local NewLib = {}

    function NewLib:Tab(Name)
        local Tab = Instance.new("TextButton")
        local Tab1 = Instance.new("ScrollingFrame")
        local List2 = Instance.new("UIListLayout")
        local Pad = Instance.new("UIPadding")

        Tab.Name = Name
        Tab.Parent = TabButtons
        Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Tab.BackgroundTransparency = 1.000
        Tab.Size = UDim2.new(0, 117, 0, 29)
        Tab.Font = Enum.Font.GothamSemibold
        Tab.Text = Name
        Tab.TextColor3 = Color3.fromRGB(255, 255, 255)
        Tab.TextSize = 14.000
        
        Tab1.Name = Name
        Tab1.Parent = Tabs
        Tab1.Active = true
        Tab1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Tab1.BackgroundTransparency = 1.000
        Tab1.BorderSizePixel = 0
        Tab1.Size = UDim2.new(0, 464, 0, 293)
        Tab1.BottomImage = ""
        Tab1.CanvasSize = UDim2.new(0, 0, 5, 0)
        Tab1.ScrollBarThickness = 3
        Tab1.TopImage = ""

        Tab.MouseButton1Down:Connect(function()
			for i,v in next, Tabs:GetChildren() do
				if v:IsA("ScrollingFrame") then
					v.Visible = false
				end
			end
			Tab1.Visible = true
		end)

        local function Ripple()  
			local Circle = Instance.new("ImageLabel")
			local script = Instance.new('LocalScript', Tab)
			Circle.Name = "Circle"
			Circle.Parent = script
			Circle.AnchorPoint = Vector2.new(0.5, 0.5)
			Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Circle.BackgroundTransparency = 1.000
			Circle.Position = UDim2.new(0.5, 0, 0.5, 0)
			Circle.ZIndex = 10
			Circle.Image = "rbxassetid://266543268"
			Circle.ImageColor3 = Color3.fromRGB(0, 0, 0)
			Circle.ImageTransparency = 0.500


			local RippleColor        = Color3.fromRGB(255, 255, 255) -- RGB Color of the ripple effect, you can change it.
			local RippleTransparency = 0.8 ---------------------------- Max is 1, Min is 0
			local PixelSize          = 2000 --------------------------- The Max size of the ripple in pixels
			local TimeLength         = 0.9 ---------------------------- How long the ripple animation is
			local FadeLength         = 0.6 ---------------------------- How long it takes for the ripple to fade out

			local frame = script.Parent
			local rgb = Color3.fromRGB
			local ud2 = UDim2.new
			repeat
				wait()
			until game.Players.LocalPlayer
			local plr = game.Players.LocalPlayer
			local mouse = plr:GetMouse()

			frame.ClipsDescendants = true
			frame.AutoButtonColor = false


			function tweenInRipple(ripple)
				spawn(function()
					local TweenService = game:GetService("TweenService")
					local Part = ripple
					local Info = TweenInfo.new(
						TimeLength,
						Enum.EasingStyle.Linear,
						Enum.EasingDirection.InOut,
						0,
						false,
						0
					)
					local Goals = 
						{
							Size = ud2(0, PixelSize, 0, PixelSize);
						}
					local Tween = TweenService:Create(Part, Info, Goals)
					Tween:Play()
				end)
			end

			function fadeOutRipple(ripple)
				spawn(function()
					local TweenService = game:GetService("TweenService")
					local Part = ripple
					local Info = TweenInfo.new(
						FadeLength,
						Enum.EasingStyle.Linear,
						Enum.EasingDirection.InOut,
						0,
						false,
						0
					)
					local Goals = 
						{
							ImageTransparency = 1;
						}
					local Tween = TweenService:Create(Part, Info, Goals)
					Tween:Play()
					wait(FadeLength + 0.1)
					ripple:Destroy()
				end)
			end

			frame.MouseButton1Down:Connect(function()
				local done = false
				local ripple = script.Circle:Clone()
				ripple.Parent = frame
				ripple.ZIndex = frame.ZIndex + 1
				ripple.ImageColor3 = RippleColor
				ripple.ImageTransparency = RippleTransparency
				tweenInRipple(ripple)
				frame.MouseButton1Up:Connect(function()
					if done == false then
						done = true
						fadeOutRipple(ripple)
					end
				end)
				wait(4);
				done = true;
				fadeOutRipple(ripple) -- if it doesnt detect that it was unselected
			end)
		end --Not made by me too so stfu (Ripple Effect)
		coroutine.wrap(Ripple)()
        
        List2.Name = "List2"
        List2.Parent = Tab1
        List2.SortOrder = Enum.SortOrder.LayoutOrder
        List2.Padding = UDim.new(0, 5)
        
        Pad.Name = "Pad"
        Pad.Parent = Tab1
        Pad.PaddingBottom = UDim.new(0, 5)
        Pad.PaddingLeft = UDim.new(0, 5)
        Pad.PaddingRight = UDim.new(0, 5)
        Pad.PaddingTop = UDim.new(0, 5)

        local TabLib = {}

        function TabLib:Button(Name, callback)
            callback = callback or function() end

            local Button = Instance.new("TextButton")

            Button.Name = Name
            Button.Parent = Tab1
            Button.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            Button.BorderSizePixel = 0
            Button.Position = UDim2.new(0.0107758623, 0, 0.0170648471, 0)
            Button.Size = UDim2.new(0, 451, 0, 34)
            Button.AutoButtonColor = false
            Button.Font = Enum.Font.Gotham
            Button.Text = Name
            Button.TextColor3 = Color3.fromRGB(255, 255, 255)
            Button.TextSize = 14.000
            Button.MouseButton1Down:Connect(function()
                pcall(callback)
            end)

            local function Ripple()  
                local Circle = Instance.new("ImageLabel")
                local script = Instance.new('LocalScript', Button)
                Circle.Name = "Circle"
                Circle.Parent = script
                Circle.AnchorPoint = Vector2.new(0.5, 0.5)
                Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Circle.BackgroundTransparency = 1.000
                Circle.Position = UDim2.new(0.5, 0, 0.5, 0)
                Circle.ZIndex = 10
                Circle.Image = "rbxassetid://266543268"
                Circle.ImageColor3 = Color3.fromRGB(0, 0, 0)
                Circle.ImageTransparency = 0.500
    
    
                local RippleColor        = Color3.fromRGB(255, 255, 255) -- RGB Color of the ripple effect, you can change it.
                local RippleTransparency = 0.8 ---------------------------- Max is 1, Min is 0
                local PixelSize          = 2000 --------------------------- The Max size of the ripple in pixels
                local TimeLength         = 0.9 ---------------------------- How long the ripple animation is
                local FadeLength         = 0.6 ---------------------------- How long it takes for the ripple to fade out
    
                local frame = script.Parent
                local rgb = Color3.fromRGB
                local ud2 = UDim2.new
                repeat
                    wait()
                until game.Players.LocalPlayer
                local plr = game.Players.LocalPlayer
                local mouse = plr:GetMouse()
    
                frame.ClipsDescendants = true
                frame.AutoButtonColor = false
    
    
                function tweenInRipple(ripple)
                    spawn(function()
                        local TweenService = game:GetService("TweenService")
                        local Part = ripple
                        local Info = TweenInfo.new(
                            TimeLength,
                            Enum.EasingStyle.Linear,
                            Enum.EasingDirection.InOut,
                            0,
                            false,
                            0
                        )
                        local Goals = 
                            {
                                Size = ud2(0, PixelSize, 0, PixelSize);
                            }
                        local Tween = TweenService:Create(Part, Info, Goals)
                        Tween:Play()
                    end)
                end
    
                function fadeOutRipple(ripple)
                    spawn(function()
                        local TweenService = game:GetService("TweenService")
                        local Part = ripple
                        local Info = TweenInfo.new(
                            FadeLength,
                            Enum.EasingStyle.Linear,
                            Enum.EasingDirection.InOut,
                            0,
                            false,
                            0
                        )
                        local Goals = 
                            {
                                ImageTransparency = 1;
                            }
                        local Tween = TweenService:Create(Part, Info, Goals)
                        Tween:Play()
                        wait(FadeLength + 0.1)
                        ripple:Destroy()
                    end)
                end
    
                frame.MouseButton1Down:Connect(function()
                    local done = false
                    local ripple = script.Circle:Clone()
                    ripple.Parent = frame
                    ripple.ZIndex = frame.ZIndex + 1
                    ripple.ImageColor3 = RippleColor
                    ripple.ImageTransparency = RippleTransparency
                    tweenInRipple(ripple)
                    frame.MouseButton1Up:Connect(function()
                        if done == false then
                            done = true
                            fadeOutRipple(ripple)
                        end
                    end)
                    wait(4);
                    done = true;
                    fadeOutRipple(ripple) -- if it doesnt detect that it was unselected
                end)
            end --Not made by me too so stfu (Ripple Effect)
            coroutine.wrap(Ripple)()
        end

        function TabLib:Label(name)
            local Label = Instance.new("TextLabel")
            Label.Name = name
            Label.Parent = Tab1
            Label.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            Label.BorderSizePixel = 0
            Label.Size = UDim2.new(0, 451, 0, 34)
            Label.Font = Enum.Font.Gotham
            Label.Text = name
            Label.TextColor3 = Color3.fromRGB(255, 255, 255)
            Label.TextSize = 14.000
        end
        return TabLib;
    end
    function NewLib:SetHomePage(Name)
		for _,Frame in pairs(Tabs:GetChildren()) do
			if Frame:IsA("ScrollingFrame") then
				if string.lower(Frame.Name) == string.lower(Name) then
					Frame.Visible = true
				end
			end
		end
	end
    return NewLib;
end
return Library;
