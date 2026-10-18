
function love.conf(t)


    t.identity = " Prototipo 3 - Game "     --- Nombre de la carpeta de guardado ---
    --- t.version = " "                     --- Version objetivo de LOVE --- (Desactivar/Eliminar)


    --- Configuracion de la Pantalla del Juego ---
    t.window.title = " Prototipo 3 - Game "
    t.window.icon = nil
    t.window.width = 1280
    t.window.height = 720
    t.window.borderless = false
    t.window.resizable = false
    t.window.minwidth = 1280
    t.window.minheight = 720
    t.window.fullscreen = false
    t.window.fullscreentype = "desktop"
    t.window.vsync = 0                      --- Desactiva el VSync para FPS especificos ---
    t.window.msaa = 0


    --- Modulos requeridos de LOVE ---
    t.modules.audio = true
    t.modules.event = true
    t.modules.graphics = true
    t.modules.image = true
    t.modules.keyboard = true
    t.modules.mouse = true
    t.modules.sound = true
    t.modules.timer = true
    t.modules.window = true
    t.modules.system = true


end
