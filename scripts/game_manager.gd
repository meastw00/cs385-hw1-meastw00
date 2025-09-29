extends Node

var score = 0

@onready var score_label: Label = $ScoreLabel

func add_point():
	score += 1
	score_label.text = "OH NO, YOU HAVE " + str(score) + " COINS, THAT'S TOO MANY AHHHHHHHHHH"
