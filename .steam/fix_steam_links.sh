#!/bin/bash
STEAM_PATH="/mnt/data/SteamLibrary"
ln -sf "$STEAM_PATH"/ubuntu12_32  bin32
ln -sf "$STEAM_PATH"/ubuntu12_64  bin64
ln -sf "$STEAM_PATH"		   root 
ln -sf "$STEAM_PATH"/linux32	   sdk32
ln -sf "$STEAM_PATH"/linux64	   sdk64
ln -sf "$STEAM_PATH"		   steam
