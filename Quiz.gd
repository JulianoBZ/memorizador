extends Node2D


var lines
var quizCount = 0
var quizMax = 0

var question
var answer

func _ready():
	lines = Global.lines
	quizMax = lines.size()
	arrange_All(lines)

func arrange_All(li):
	var separated_line = li[quizCount].split(",",true,0)
	
	$Buttons/Button5.hide()
	
	question = str(separated_line[0])
	answer = str(separated_line[1])
	
	$Label.text = question
	
	separated_line.remove(0)
	var answers = []
	for each in separated_line:
		answers.append(each)
	
	print(answers)
	answers.shuffle()
	var but_counter = 0
	for n in answers:
		$Buttons.get_child(but_counter).text = str(n)
		$Buttons.get_child(but_counter).show()
		but_counter+=1



func _on_Button_pressed():
	if $Buttons/Button.text == answer:
		print("Correct!")
		Global.score += 1
	else:
		print("Incorrect")
	hide_buttons()
	quizCount += 1

func _on_Button2_pressed():
	if $Buttons/Button2.text == answer:
		print("Correct!")
		Global.score += 1
	else:
		print("Incorrect")
	hide_buttons()
	quizCount += 1

func _on_Button3_pressed():
	if $Buttons/Button3.text == answer:
		print("Correct!")
		Global.score += 1
	else:
		print("Incorrect")
	hide_buttons()
	quizCount += 1

func _on_Button4_pressed():
	if $Buttons/Button4.text == answer:
		print("Correct!")
		Global.score += 1
	else:
		print("Incorrect")
	hide_buttons()
	quizCount += 1

func hide_buttons():
	for each in $Buttons.get_children():
		if each.text == answer:
			each.show()
			each.disabled = true
		else:
			each.hide()
	$Buttons/Button5.show()
	$Buttons/Button5.text = "Próxima Pergunta"

func _on_Button5_pressed():
	for each in $Buttons.get_children():
		each.hide()
		each.text = ""
		each.disabled = false
	if quizCount < (quizMax):
		arrange_All(lines)
	else:
		Global.totalQuestions = quizMax
		Global.end_game()
