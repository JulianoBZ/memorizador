extends Node


var lines = []
var quiz = preload("res://Quiz.tscn")
var end = preload("res://End_Screen.tscn")
var count = 0
var score = 0

var totalQuestions = 0

func _ready():
	pass # Replace with function body.


func _process(_delta):
	if lines.size() > 0 && count == 0:
		count+=1
		get_parent().get_node("Main").hide()
		random_lines(lines)
		var q = quiz.instance()
		add_child(q)

func random_lines(l):
	randomize()
	l.shuffle()

func end_game():
	var e = end.instance()
	add_child(e)
	get_node("Quiz").hide()
