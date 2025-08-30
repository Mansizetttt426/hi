local a=loadstring(game:HttpGet("https://raw.githubusercontent.com/GRPGaming/Key-System/refs/heads/Xycer-Hub-Script/ZusumeLib(Slider)"))()
local b=a:MakeWindow({Name="PVP MODE",HidePremium=false,SaveConfig=true,ConfigFolder="PVP MODE"})
local c=b:MakeTab({Name="Hitbox",Icon="rbxassetid://6031075931",PremiumOnly=false})
local d=b:MakeTab({Name="ESP",Icon="rbxassetid://6031075931",PremiumOnly=false})
local e=b:MakeTab({Name="Teleport",Icon="rbxassetid://6031075931",PremiumOnly=false})
local f=game:GetService("Players")
local g=game:GetService("Workspace")
local h=game:GetService("RunService")
local i=game:GetService("UserInputService")
local j=f.LocalPlayer
local function k()
 local l=j.Character
 if not l then return nil,nil end
 return l,l:FindFirstChild("HumanoidRootPart"),l:FindFirstChild("Humanoid")
end
local m=false
local n=50
local function o(p)
 local q=p:FindFirstChild("HumanoidRootPart")
 if q then
  q.Size=Vector3.new(n,n,n)
  q.Transparency=0.7
  q.Material=Enum.Material.Neon
  q.BrickColor=BrickColor.new("Bright red")
  q.CanCollide=false
 end
end
local function r(p)
 local q=p:FindFirstChild("HumanoidRootPart")
 if q then
  q.Size=Vector3.new(2,2,1)
  q.Transparency=1
  q.Material=Enum.Material.Plastic
  q.CanCollide=true
  q.Anchored=false
 end
end
local function s(t)
 m=t
 for _,u in pairs(f:GetPlayers())do
  if u~=j and u.Character then
   if t then o(u.Character)else r(u.Character)end
  end
 end
end
f.PlayerAdded:Connect(function(v)
 v.CharacterAdded:Connect(function(w)
  task.wait(1)
  if m then o(w) end
 end)
end)
c:AddToggle({Name="Enable Hitbox",Default=false,Callback=s})
c:AddSlider({Name="Hitbox Size",Min=2,Max=50,Default=n,Callback=function(x)
 n=x
 if m then
  for _,u in pairs(f:GetPlayers())do
   if u~=j and u.Character then o(u.Character) end
  end
 end
end})
local y=false
local z=nil
local A=Instance.new("Folder",game.CoreGui)
A.Name="ESPFolder"
local B={Color3.fromRGB(255,0,0),Color3.fromRGB(0,255,0),Color3.fromRGB(0,0,255)}
local function C(D,E)
 local q=D:FindFirstChild("HumanoidRootPart")
 if not q then return end
 if q:FindFirstChild("ESP") then q.ESP:Destroy() end
 local F=Instance.new("BillboardGui")
 F.Name="ESP"
 F.AlwaysOnTop=true
 F.Size=UDim2.new(0,100,0,20)
 F.Adornee=q
 F.Parent=A
 local G=Instance.new("TextLabel",F)
 G.Size=UDim2.new(1,0,1,0)
 G.BackgroundTransparency=1
 G.Text=D.Name
 G.TextColor3=E
 G.Font=Enum.Font.SourceSansBold
 G.TextSize=16
end
local function H()
 for _,I in pairs(A:GetChildren())do I:Destroy() end
 if not y then return end
 local J=j.Team
 local K=1
 for _,u in pairs(f:GetPlayers())do
  if u~=j and u.Character and u.Character:FindFirstChild("HumanoidRootPart")then
   local L=(u.Team==J)and Color3.fromRGB(0,170,255)or B[K]
   C(u.Character,L)
   if u.Team~=J then K=K%#B+1 end
  end
 end
end
f.PlayerAdded:Connect(function(M)
 M.CharacterAdded:Connect(function()
  task.wait(1)
  H()
 end)
end)
h.Heartbeat:Connect(function()
 if y then H() end
end)
local N=nil
local function O(P)
 if N then N:Disconnect() end
 z=P
 N=h.Heartbeat:Connect(function()
  local Q,R=k()
  if not R then return end
  local S=nil
  if z then
   S=f:FindFirstChild(z)
   if S then S=S.Character end
  else
   local T=math.huge
   for _,u in pairs(f:GetPlayers())do
    if u~=j and u.Character and u.Character:FindFirstChild("HumanoidRootPart")then
     local U=(R.Position-u.Character.HumanoidRootPart.Position).Magnitude
     if U<T then T=U;S=u.Character end
    end
   end
  end
  if S and S:FindFirstChild("HumanoidRootPart")then
   R.CFrame=S.HumanoidRootPart.CFrame
  end
 end)
end
local function V()
 if N then N:Disconnect() end
end
d:AddToggle({Name="Enable ESP",Default=false,Callback=function(W)
 y=W
 H()
end})
d:AddButton({Name="Start GhostKill Closest",Callback=function() O(nil) end})
d:AddButton({Name="Stop GhostKill",Callback=V})
d:AddTextbox({Name="Follow Player By Name",Default="",TextDisappear=true,Callback=function(X)
 if X~="" then O(X) end
end})
local Y=false
local Z=50
c:AddToggle({Name="Enable WalkSpeed",Default=false,Callback=function(a1)
 Y=a1
 local _,b1=k()
 if b1 then b1.WalkSpeed=Y and Z or 16 end
end})
c:AddSlider({Name="WalkSpeed Value",Min=16,Max=200,Default=Z,Callback=function(a2)
 Z=a2
 if Y then
  local _,b2=k()
  if b2 then b2.WalkSpeed=Z end
 end
end})
e:AddTextbox({Name="Teleport To Player",Default="",TextDisappear=true,Callback=function(a3)
 if a3=="" then return end
 local b3=f:FindFirstChild(a3)
 if b3 and b3.Character and b3.Character:FindFirstChild("HumanoidRootPart")then
  local _,c1=k()
  if c1 then c1.CFrame=b3.Character.HumanoidRootPart.CFrame+Vector3.new(0,5,0) end
 end
end})
local d1=Instance.new("Part")
d1.Size=Vector3.new(10000,1,10000)
d1.Transparency=1
d1.Anchored=true
d1.CanCollide=true
d1.Position=Vector3.new(0,-100,0)
d1.Parent=g
