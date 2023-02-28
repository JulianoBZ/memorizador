extends Node2D


func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func list_files_in_directory(path):
	var files = []
	var dir = Directory.new()
	#var path = dir.get_current_dir()
	dir.open(path)
	dir.list_dir_begin()
	
	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with(".") && file.begins_with("mem"):
			files.append(file)
	
	dir.list_dir_end()
	
	return files


func _on_Button_pressed():
	var path = $TextEdit.text
	$"Files Options".organize_files(list_files_in_directory(path),path)
	

func load_file(file):
	var lines = []
	var f = File.new()
	f.open(file, File.READ)
	while not f.eof_reached(): # iterate through all lines until the end of file is reached
		var line = f.get_line()
		lines.append(line)
	f.close()
	return lines
