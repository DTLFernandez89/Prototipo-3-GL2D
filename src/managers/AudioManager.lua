
local AudioManager = {}
AudioManager.__index = AudioManager


function AudioManager.new(eventManager)

    local self = setmetatable({}, AudioManager)
    self.eventManager = eventManager


    --- Carga de efectos de sonido ---
    self.sfx = {

        damage_player   = love.audio.newSource("Archives/audio/damage_player.wav", "static"),

        death_player    = love.audio.newSource("Archives/audio/death_player.wav", "static"),
        death_enemies1  = love.audio.newSource("Archives/audio/death_enemies01.wav", "static"),
        death_enemies2  = love.audio.newSource("Archives/audio/death_enemies02.wav", "static"),

        enemies_damage1 = love.audio.newSource("Archives/audio/enemies_damage01.wav", "static"),
        enemies_damage2 = love.audio.newSource("Archives/audio/enemies_damage02.wav", "static"),
        enemies_damage3 = love.audio.newSource("Archives/audio/enemies_damage03.wav", "static"),
        enemies_damage4 = love.audio.newSource("Archives/audio/enemies_damage04.wav", "static"),

        yes             = love.audio.newSource("Archives/audio/yes!.wav", "static")

    }

    --- Carga de temas musicales ---
    self.music = {

        main_menu = love.audio.newSource("Archives/audio/main_menu.mp3", "stream"),

        gameplay1 = love.audio.newSource("Archives/audio/gameplay01.mp3", "stream"),
        gameplay2 = love.audio.newSource("Archives/audio/gameplay02.mp3", "stream"),
        gameplay3 = love.audio.newSource("Archives/audio/gameplay03.mp3", "stream"),

        lose      = love.audio.newSource("Archives/audio/lose.mp3", "stream"),
        win       = love.audio.newSource("Archives/audio/win.mp3", "stream")

    }

    self.currentMusic = nil
    self:registerEvents()

    return self

end


function AudioManager:registerEvents()

    if not self.eventManager then return end

    self.eventManager:on("player_damaged", function()

        self:playSFX("damage_player")

    end)


    self.eventManager:on("player_died", function()

        self:playSFX("death_player")
        self:playMusic("lose")

    end)


    self.eventManager:on("enemy_damaged", function()

        --- Selección aleatoria entre los 4 sonidos de daño a enemigos ---
        local idx = math.random(1, 4)
        self:playSFX("enemies_damage" .. idx)

    end)


    self.eventManager:on("enemy_died", function()

        --- Selección aleatoria entre los 2 sonidos de muerte de enemigos ---
        local idx = math.random(1, 2)
        self:playSFX("death_enemies" .. idx)

    end)


    self.eventManager:on("collectible_picked", function()

        self:playSFX("yes")

    end)


    self.eventManager:on("game_won", function()

        self:playMusic("win")

    end)

end


function AudioManager:playSFX(name)

    if self.sfx[name] then

        self.sfx[name]:stop()
        self.sfx[name]:play()

    end

end

