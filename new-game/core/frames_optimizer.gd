extends Control


func _on_optimize_pressed() -> void:
	for i in range(0, $TextEdit.get_line_count()):
		var target = $TextEdit.get_line(i)
		delete_contents(target, 3, true)

func delete_contents(path, n=2, delete=false, _p=false):
	if DirAccess.dir_exists_absolute(path):
		var dir = DirAccess.open(path)
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if file_name != "." or file_name != "..":
				if not dir.current_is_dir() and not file_name.ends_with(".import"):
					var fpath = file_name.replace(".png", "")
					var tip = int(fpath[fpath.length()-2]+fpath[fpath.length()-1])
					if tip % n != 0:
						if delete:
							var d = dir.remove(path+file_name)
							if _p:
								if d != OK:
									print("error delete for: " + file_name)
								else:
									print("deleted: " + file_name)
						else:
							if _p:
								print("deleted: " + file_name)
#					
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path: " + path)
