```
                                           ___  _____  ______             _   _            
                                          |__ \|  __ \|  ____|         (_) | | |           
                                             ) | |  | | |__   _ __ ___  _| |_| |_ ___ _ __ 
                                            / /| |  | |  __| | '_ ` _ \| | __| __/ _ \ '__|
                                           / /_| |__| | |____| | | | | | | |_| ||  __/ |   
                                          |____|_____/|______|_| |_| |_|_|\__|\__\___|_|   
                
                                                   Create beautiful ui particles!
  
                                                             By @Synitx     
                                                 Please don't re-sell this product

```

Click **[here](https://www.roblox.com/library/9025855281/2D-Emitter)** to get the module

Lets start by requiring the module.
  
  ```lua
  local Module = require(path.to.module)
  ```
  
  Create the emitter
  
  ```lua
  local Emitter = Module.new(position:UDim2) -- Starting position of the particle in UDim2
   ```

  Setting a property
  Available properties: { Size, Speed, Amount, LifeTime, Spread, Color, ParticleType, Corner }
  
  • Particle Type
    All available types of particles: { Default, Clouds, Custom }
    | Default | Clouds | Custom |
| :---         |     :---:      |          ---: |
| Squares customizable   | Image of clouds     | Your very own custom particle    |
  
  Setting particle type:
  
  ```lua
  Emitter:SetParticleType(Emitter.ParticleType.Default)
  ```
## OR
  ```lua
  Emitter:SetParticleType(Emitter.ParticleType.Clouds)
  ```
## OR
  ```lua
  Emitter:SetParticleType(Emitter.ParticleType.Custom)
  ```
  
  You can either do Emitter:Set{PropertyName}
  to make your code less then you also can use
  
  ```lua
  Emitter:Set({options}) -- options must be a table
  ```
  ```lua
  Emitter:Set({
     Size = 3,
     LifeTime = Vector2.new(5,15),
     Speed = 0.3,
     Spread = false,
     Color = { Color3.new(255,255,255), Color3.new(0,255,0) },
     Amount = 15,
     Corner = UDim.new(0,0),
     SetParticleType = Emitter.SetParticleType.Default
  })
  ```
  
  • Size : number
    Size of the particle, default is 1 
        size must be a number.

```lua
     Emitter:SetSize(2)
 ```
    
  • LifeTime : Vector2
    Lifetime of the particle, lifetime is the end time of the particle
       lifetime must be a vector2.

```lua
    Emitter:SetLifeTime(Vector2.new(5,10))
```
    
  • Speed : number
    Speed of the particle, it changes the speed of the particle
       speed must be a number.

```lua
    Emitter:SetSpeed(0.3)
```
    
  • Spread : boolean
    Should spread to different angles or not, Setting this to false will make particles go straight
       must be a boolean (true or false)

```lua
   Emitter:ToggleSpread(value : boolean)
```
   
  • Color : table
    List of colors for the particle, it picks random color from the table and set it to the color of the particle
      In table colors must be Color3 values.

```lua
   Emitter:SetColor( { Color3.fromRGB(255,255,255) , Color3.fromRGB(255,0,0) } )
```
   
   • Amount : number
     The default amount of the particles
       must be a number

```lua
   Emitter:SetAmount(value : number)
```
   
   • Corner : UDim
     Adds corner to your UI particle
       must be UDim

```lua
   Emitter:SetCorner( UDim.new(0,10) )
```
   
   • SetParticleType : ParticleType (string)
     Changes your particle type, all the types are listed above.
      must be a string
      
```lua
   Emitter:SetParticleType("Clouds") or Emitter:SetParticleType(Emitter.ParticleType.Clouds)
```
   
   
## Making a Custom Particle
   
   Create a module in Custom folder
   Then name it unique
   
   Then follow the template in the Custom folder
   
   
### How to emit a particle?
   
   ```lua
   Emitter:Emit() or Emitter:Emit(amount : number)
   ```
   
You even can make custom particles and share it on devforum.
