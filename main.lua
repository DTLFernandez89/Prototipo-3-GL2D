
local TargetFPS = 120
local FrameTime = 1 / TargetFPS

--- Estados del Juego: "MENU", "GAMEPLAY", "GAMEOVER", "WIN" ---
GameState = " MENU "


function love.load()


    --- Semilla Aleatoria ---
    math.randomseed(os.time())
    math.random()

    love.graphics.setDefaultFilter("nearest", "nearest")

    print("==========================================")
    print(" Trabajo Práctico - Prototipo N° 3 ")
    print(" Resolución: 1280x720 | FPS : 120")
    print("==========================================")

    --- Probar ---


end


function love.update(dt)


    --- Limitar Framerate Dinamico para Asegurar los 120 FPS ---
    if dt < FrameTime then

        love.timer.sleep(FrameTime - dt)

    end
    if GameState == " MENU " then
        --- Lógica de actualización del menú ---

    elseif GameState == " GAMEPLAY " then
        --- Lógica del bucle de juego ---
    
    elseif GameState == " GAMEOVER " or GameState == " WIN " then
        --- Lógica de Pausa/Finalización ---
        --- 
    end


end


function love.draw()


    if GameState == " MENU " then
        love.graphics.clear(0.1, 0.1, 0.12)
        love.graphics.setColor(1, 1, 1)
        love.graphics.printf(" Prototipo 3 - Game ", 0, 260, 1280, " center ")
        love.graphics.printf(" Presiona ENTER o Clic para Empezar ", 0, 340, 1280, " center ")


    elseif GameState == " GAMEPLAY " then
        love.graphics.clear(0.05, 0.05, 0.05)
        love.graphics.setColor(1, 1, 1)
        love.graphics.print(" GAMEPLAY EN CURSO (Prototipo de Integración) ", 20, 20)


    elseif GameState == " GAMEOVER " then
        love.graphics.clear(0.15, 0.02, 0.02)
        love.graphics.setColor(1, 0.3, 0.3)
        love.graphics.printf(" ¡HAS MUERTO! ", 0, 220, 1280, " center ")
        
        love.graphics.setColor(1, 1, 1)
        love.graphics.printf(" [R] Reiniciar Partida ", 0, 320, 1280, " center ")
        love.graphics.printf(" [M] Menú Inicial ", 0, 360, 1280, " center ")
        love.graphics.printf(" [ESC] Salir del Juego ", 0, 400, 1280, " center ")


    elseif GameState == " WIN " then
        love.graphics.clear(0.02, 0.15, 0.05)
        love.graphics.setColor(0.3, 1, 0.4)
        love.graphics.printf(" ¡VICTORIA SUPERADA! ", 0, 220, 1280, " center ")

        love.graphics.setColor(1, 1, 1)
        love.graphics.printf(" [R] Jugar de Nuevo ", 0, 320, 1280, " center ")
        love.graphics.printf(" [M] Menú Inicial ", 0, 360, 1280, " center ")
        love.graphics.printf(" [ESC] Salir del Juego ", 0, 400, 1280, " center ")
    end


end


function love.keypressed(key)


    --- Tecla ESC en cualquier momento fuera de GAMEOVER/WIN para salir directamente ---
    if key == " escape " and (GameState == " GAMEOVER " or GameState == " WIN " or GameState == " MENU ") then

        love.event.quit()

    end
    if GameState == " MENU " then

        if key == " return " or key == " space " then

            GameState = " GAMEPLAY "

        end

    elseif GameState == " GAMEOVER " or GameState == " WIN " then

        if key == " r " then

            GameState = " GAMEPLAY "
            --- Aquí se invocará la reinicialización completa del mundo ---

        elseif key == " m " then

            GameState = " MENU "

        end

    end

end
