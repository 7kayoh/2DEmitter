--[[

  ___  _____  ______             _   _            
 |__ \|  __ \|  ____|         (_) | | |           
    ) | |  | | |__   _ __ ___  _| |_| |_ ___ _ __ 
   / /| |  | |  __| | '_ ` _ \| | __| __/ _ \ '__|
  / /_| |__| | |____| | | | | | | |_| ||  __/ |   
 |____|_____/|______|_| |_| |_|_|\__|\__\___|_|   
                
          Create beautiful ui particles!
  
                    By @Synitx     
         Please don't re-sell this product

]]--

local System = {}
local tweenService = game:GetService("TweenService")

System.ParticleType = {
	Default = "default",
	Clouds = "clouds",
	Custom = "custom"
}

function System.new(position)
	local Settings = { -- Default values do not touch
		ParticleType = "Default",
		Amount = 10,
		LifeTime = Vector2.new(15,20),
		Colors = {Color3.fromRGB(255,255,255)},
		Speed = 0.5,
		Spread = false,
		Size = 1,
		Corners = UDim.new(0,0),
		Id = "none",
		Position = position
	}
	local items = {}

	function items:GetSettings() return Settings end
	function items:SetAmount(amount:number)
		if not amount then amount = 10 end
		if amount > 100 then amount = 100 end
		Settings.Amount = amount
	end
	function items:SetID(id:string)
		if id  then
			Settings.Id = id
		end
	end
	function items:SetParticleType(particleType:string)
		if not particleType then particleType = System.ParticleType.Default end
		local particleTypeList = {"default","clouds","custom"}
		if table.find(particleTypeList,particleType:lower()) then
			Settings.ParticleType = particleType
		end
	end
	function items:SetColor(tab)
		local p = {}
		for i,v in pairs(tab) do
			if typeof(v) == "Color3" then
				table.insert(p,v)
			end
		end
		Settings.Colors = p
	end
	function items:SetCorner(val:UDim)
		if val then Settings.Corners = val end
	end
	function items:ToggleSpread(value:boolean)
		if value then
			Settings.Spread = value
		else
			Settings.Spread = false
		end
	end
	function items:SetLifeTime(amount:Vector2)
		if amount then
			Settings.LifeTime = amount
		end
	end
	function items:SetSpeed(amount:number)
		if amount then
			Settings.Speed = amount
		end
	end
	function items:SetSize(amount:number)
		if amount then
			Settings.Size = amount
		end
	end
	function items:Set(options)
		if typeof(options) == "table" then
			if options.Size then
				Settings.Size = options.Size
			end
			if options.Speed then
				Settings.Speed = options.Speed
			end
			if options.LifeTime then
				Settings.LifeTime = options.LifeTime
			end
			if options.Spread then
				Settings.Spread = options.Spread
			end
			if options.Color then
				Settings.Colors = options.Color
			end
			if options.ParticleType then
				Settings.ParticleType = options.ParticleType
			end
			if options.Amount then
				Settings.Amount = options.Amount
			end
			if options.Corner then
				Settings.Corners = options.Corner
			end
			if options.Id then
				Settings.Id = options.Id
			end
		end
	end
	function items:Emit(amount:number)
		if not amount then amount = Settings.Amount end
		local player = game.Players.LocalPlayer
		local playerUI = player.PlayerGui:FindFirstChild("2DEmitter")
		if not playerUI then
			playerUI = Instance.new("ScreenGui")
			playerUI.Name = "2DEmitter"
			playerUI.Parent = player.PlayerGui
		end
		if Settings.ParticleType:lower() == "default" then
			for number = 1, amount do
				local frame = Instance.new("Frame")
				frame.Parent = playerUI
				frame.Name = "_particle."..number
				frame.BorderSizePixel = 0
				frame.AnchorPoint = Vector2.new(0.5,0.5)
				frame.Size = UDim2.new(0, 13 + Settings.Size,0, 13 + Settings.Size)
				frame.Position = position
				if Settings.Corners ~= UDim.new(0,0) then
					local cor = Instance.new("UICorner")
					cor.CornerRadius = Settings.Corners
					cor.Parent = frame
				end
				if Settings.Colors then
					frame.BackgroundColor3 = Settings.Colors[math.random(1,#Settings.Colors)]
				end
				local random = math.random(Settings.LifeTime.X,Settings.LifeTime.Y)
				local newPos
				if Settings.Spread == true then
					newPos = UDim2.new(0,math.random(-random,random),0,math.random(-random,random))
				else
					newPos = UDim2.new(0,0,0,-random)
				end
				local tween = tweenService:Create(frame,TweenInfo.new(Settings.Speed,Enum.EasingStyle.Linear,Enum.EasingDirection.In,0,false,0),{
					Position = frame.Position + newPos,
					Rotation = math.random(0,360),
					BackgroundTransparency = 1,
					Size = UDim2.new(0,0,0,0)
				})
				tween:Play()
				tween.Completed:Connect(function()
					delay(.1,function() frame:Destroy() end)
				end)
			end
		elseif Settings.ParticleType:lower() == "clouds" then
			for number = 1, amount do
				local frame = Instance.new("ImageLabel")
				frame.Parent = playerUI
				frame.Name = "_particle."..number
				frame.Image = "rbxassetid://5746933124"
				frame.BorderSizePixel = 0
				frame.BackgroundTransparency = 1
				frame.AnchorPoint = Vector2.new(0.5,0.5)
				frame.Size = UDim2.new(0,0,0,0)
				frame.Position = position
				if Settings.Corners ~= UDim.new(0,0) then
					local cor = Instance.new("UICorner")
					cor.CornerRadius = Settings.Corners
					cor.Parent = frame
				end
				if Settings.Colors then
					frame.ImageColor3 = Settings.Colors[math.random(1,#Settings.Colors)]
				end
				local random = math.random(Settings.LifeTime.X,Settings.LifeTime.Y)
				local newPos
				if Settings.Spread == true then
					newPos = UDim2.new(0,math.random(-random,random),0,math.random(-random,random))
				else
					newPos = UDim2.new(0,0,0,-random)
				end
				local tween = tweenService:Create(frame,TweenInfo.new(Settings.Speed,Enum.EasingStyle.Linear,Enum.EasingDirection.In,0,false,0),{
					Position = frame.Position + newPos,
					Rotation = math.random(0,360),
					Size = UDim2.new(0, 13 + Settings.Size,0, 13 + Settings.Size)
				})
				local tween2 = tweenService:Create(frame,TweenInfo.new(Settings.Speed,Enum.EasingStyle.Linear,Enum.EasingDirection.In,0,false,0),{
					BackgroundTransparency = 1,
					Size = UDim2.new(0,0,0,0)
				})
				tween:Play()
				tween.Completed:Connect(function()
					tween2:Play()
					tween2.Completed:Connect(function()
						delay(.1,function() frame:Destroy() end)
					end)
				end)
			end
		elseif Settings.ParticleType:lower() == "custom" then
			if Settings.Id then
				if script.Custom:FindFirstChild(Settings.Id) then
					for number = 1,Settings.Amount do
						local particleElement, particleTween, particleOption = require(script.Custom[Settings.Id])(Settings)
						particleElement.Parent = playerUI
						particleElement.Name = "_custom.particle."..number
						particleElement.BorderSizePixel = 0
						particleElement.AnchorPoint = Vector2.new(0.5,0.5)
						particleElement.Size = UDim2.new(0, 13 + Settings.Size,0, 13 + Settings.Size)
						particleElement.Position = position
						if Settings.Corners ~= UDim.new(0,0) then
							local cor = Instance.new("UICorner")
							cor.CornerRadius = Settings.Corners
							cor.Parent = particleElement
						end
						local random = math.random(Settings.LifeTime.X,Settings.LifeTime.Y)
						local newPos
						if Settings.Spread == true then
							newPos = UDim2.new(0,math.random(-random,random),0,math.random(-random,random))
						else
							newPos = UDim2.new(0,0,0,-random)
						end
						local tween2
						if particleOption.DefaultTweenEnabled then
							tween2 = tweenService:Create(particleElement,TweenInfo.new(Settings.Speed,Enum.EasingStyle.Linear,Enum.EasingDirection.In,0,false,0),{
								Position = particleElement.Position + newPos,
								Rotation = math.random(0,360),
								BackgroundTransparency = 1,
								Size = UDim2.new(0,0,0,0)
							})
						end
						if not particleTween then
							particleTween = tweenService:Create(particleElement,TweenInfo.new(Settings.Speed,Enum.EasingStyle.Linear,Enum.EasingDirection.In,0,false,0),{
								Position = particleElement.Position + newPos,
								Rotation = math.random(0,360),
								BackgroundTransparency = 1,
								Size = UDim2.new(0,0,0,0)
							})
						end
						if typeof(particleTween) == "table" then
							spawn(function()
								for i,v in pairs(particleTween) do
									v:Play()
									v.Completed:Wait()
								end
							end)
						else
							particleTween:Play()
							particleTween.Completed:Connect(function()
								delay(.1,function() particleElement:Destroy() end)
							end)
						end
						if tween2 then tween2:Play() end						
					end
				end
			end
		end
	end
	return items
end

return
