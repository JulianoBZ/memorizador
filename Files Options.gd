extends OptionButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var PATH
var FILE

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(_delta):
	if get_item_count() == 0:
		$"Choose File".hide()
	else:
		$"Choose File".show()

func organize_files(files,path):
	clear()
	PATH = path
	for n in files:
		add_item(n)


func _on_Choose_File_pressed():
	FILE = PATH + "\\" + get_item_text(get_selected_id())
	Global.lines = get_parent().load_file(FILE)
	#$Label.text = get_parent().load_file(FILE)
