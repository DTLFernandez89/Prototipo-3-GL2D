
local Collisions = {}


--- Define los 8 bloques de muros rosados según el diseño de scenario01/scenario02 ---
--- Ancho de pared ~40px, huecos de spawn centrados en Norte, Sur, Este y Oeste ---
Collisions.mapWalls = {

    --- Paredes Superiores (dejan hueco central x: 590 a 690) ---
    { x = 0,    y = 0,   w = 590, h = 40 },
    { x = 690,  y = 0,   w = 590, h = 40 },

    --- Paredes Inferiores (dejan hueco central x: 590 a 690) ---
    { x = 0,    y = 680, w = 590, h = 40 },
    { x = 690,  y = 680, w = 590, h = 40 },

    --- Paredes Izquierdas (dejan hueco central y: 310 a 410) ---
    { x = 0,    y = 0,   w = 40,  h = 310 },
    { x = 0,    y = 410, w = 40,  h = 310 },

    --- Paredes Derechas (dejan hueco central y: 310 a 410) ---
    { x = 1240, y = 0,   w = 40,  h = 310 },
    { x = 1240, y = 410, w = 40,  h = 310 }

}


--- Puntos de reaparición (Spawns) exactos dentro de los 4 accesos libres ---
Collisions.spawnPoints = {

    { x = 640,  y = 10 },  -- Norte
    { x = 640,  y = 690 }, -- Sur
    { x = 10,   y = 360 }, -- Oeste
    { x = 1250, y = 360 }  -- Este

}


--- Algoritmo AABB clásico (Axis-Aligned Bounding Box) ---
function Collisions.checkAABB(a, b)

    return a.x < b.x + b.w and
           a.x + a.w > b.x and
           a.y < b.y + b.h and
           a.y + a.h > b.y

end


--- Verifica si un objeto colisiona con cualquiera de los 8 muros del mapa ---
function Collisions.checkMapCollision(box)

    for _, wall in ipairs(Collisions.mapWalls) do

        if Collisions.checkAABB(box, wall) then

            return true

        end

    end
    return false

end

return Collisions
