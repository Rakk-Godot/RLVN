extends Node

var link_discord = ""
var link_twitter = ""
var link_patreon = ""
var link_itch = ""
var link_steam = ""
var link_substar = ""

var save_name = "data"
var save_format = ".dat"

var data = {}
	
func update_save(reset=false):
	if reset == true:
		Globals.reset_data()
	var ndata = {}
	ndata["main"] = Globals.game_data
	ndata["time"] = timestamp()
	_game_save(save_name, ndata)
	
func continue_save():
	var ldata = _game_load(save_name)
	if ldata != null:
		Globals.game_data = ldata["main"]
		return true
	return false

func get_save_path():
	return "user://"+save_name+save_format

func exists(title=save_name):
	var path = "user://"+title+save_format
	if FileAccess.file_exists(path):
		return true
	return false

func _game_save(title, what):
	var path = "user://"+title+save_format
	var file = FileAccess.open(path, FileAccess.WRITE)
	file.store_var(what, true)
	file.close()
	#print(path, " saved")

func _game_load(title):
	var path = "user://"+title+save_format
	if FileAccess.file_exists(path):
		var file = FileAccess.open(path, FileAccess.READ)
		var content = file.get_var(true)
		file.close()
		#print(path, " loaded")
		return content
	print(path, " failed to load")
	return null

func timestamp():
	var date = Time.get_datetime_dict_from_system(true)
	var d_year = date["year"]
	var d_day = date["day"]
	var d_month = date["month"]
	var d_hour = date["hour"]
	var d_min = date["minute"]
	var d_sec = date["second"]
	
	var months = {1: "JAN",2: "FEB", 3: "MAR", 4: "APR", 5: "MAY", 6: "JUN",
		7: "JUL", 8: "AUG", 9: "SEP", 10: "OCT", 11: "NOV", 12: "DEC"}
		
	return months[d_month] + "-" + str(d_day) + "-" + str(d_year) + "-" + str(d_hour) + "-" + str(d_min) + "-" + str(d_sec)
