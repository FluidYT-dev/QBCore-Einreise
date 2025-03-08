fx_version 'cerulean'
game 'gta5'

author 'FluidYT'
description 'Ein einfaches FiveM QBCore Script f�r den /einreise Befehl / Geschrieben von FluidYT / In dem Ordner server/main.lua kannst Du die Koordinaten (Vector3) in Zeile 4 ver�ndern. Dort spawnt der Spieler dann!'
version '1.0.0'

-- Abh�ngigkeit
dependencies {
    'qb-core'
}

-- Serverseitige Skripte
server_scripts {
    'server/main.lua'
}

-- Clientseitige Skripte
client_scripts {
    'client/main.lua'
}