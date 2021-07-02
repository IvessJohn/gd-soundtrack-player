extends Node2D

func _ready():
	randomize()
	
	SoundtrackPlayer.play_theme(SOUNDTRACKPLAYER_CLASS.THEMES.BATTLE)
