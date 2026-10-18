
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


