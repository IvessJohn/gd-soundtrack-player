extends Node
class_name SOUNDTRACKPLAYER_CLASS

enum THEMES {
	PEACE,
	BATTLE
}

var TRACKS = {
	THEMES.PEACE: [preload("res://soundtracks/Theme_Chill.wav"), preload("res://soundtracks/Theme_Happy.wav")],
	THEMES.BATTLE: [preload("res://soundtracks/Mellow Boss_loop.wav")]
}

var current_theme: int = THEMES.PEACE
var is_repeating: bool = true

onready var streamPlayer: AudioStreamPlayer = $AudioStreamPlayer


func play_theme(theme: int, repeat_themes: bool = true):
	if current_theme != theme or !streamPlayer.playing:
		is_repeating = false # Prevent accidentally starting an old track playing
								# again when next command is stop()
		streamPlayer.stop()
		
		is_repeating = repeat_themes
		current_theme = theme
		
		var theme_tracks: Array = TRACKS[current_theme]
		if theme_tracks != []:
			streamPlayer.stream = theme_tracks[randi() % theme_tracks.size()]
			streamPlayer.play()

func replay_current_theme():
	var theme_tracks: Array = TRACKS[current_theme]
	streamPlayer.stream = theme_tracks[randi() % theme_tracks.size()]
	streamPlayer.play()

func _on_AudioStreamPlayer_finished():
	if is_repeating:
		replay_current_theme()
