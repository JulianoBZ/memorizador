extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var percentage = 0.0


# Called when the node enters the scene tree for the first time.
func _ready():
	var fscore = float(Global.score)
	var fquestions = float(Global.totalQuestions)
	$Label.text = "Você acertou "+str(Global.score)+" de "+str(Global.totalQuestions)+" perguntas."
	percentage = float((fscore/fquestions)*100)
	$Label2.text = str(percentage)+"%"
	#int(round((float(Global.score/Global.totalQuestions)*100))

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	for n in Global.get_children():
		n.queue_free()
	get_node("/root/Main").show()
