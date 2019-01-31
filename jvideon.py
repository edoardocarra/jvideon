#!/usr/local/bin/python3.6

import sys
sys.path.append('modules')
import os
import json
import operations
import ntpath
import time
import progressbar
import threading

json_file="video.json"
work_directory="jvideon"

completed=0

def pb(total_videos):
	toolbar_width = 50
	segment=int(toolbar_width/total_videos)
	global completed

	# setup toolbar
	sys.stdout.write("[%s]" % (" " * toolbar_width))
	sys.stdout.flush()
	sys.stdout.write("\b" * (toolbar_width+1)) # return to start of line, after '['

	showed=0
	while completed < total_videos:
		if showed < completed:
			for i in range(segment):
				sys.stdout.write("-")
				sys.stdout.flush()
			showed=completed
		
	sys.stdout.write("\n")

operation2func = {
    "SPEEDUP": operations.speedup,
    "CROP": operations.crop,
    "SCALE": operations.scale,
    "POSITION": operations.position,
    "TRIM": operations.trim
}

def valid(videos_json):
	is_valid=True
	n_videos=0
	output_videos=[video_json["name"] for video_json in videos_json]

	for video_json in videos_json:
		is_valid = is_valid and video_json["name"] != ""
		is_valid = is_valid and (video_json["background"] == "" or os.path.isfile(video_json["background"]))
		is_valid = is_valid and len(video_json["input"]) == len(video_json["transformations"])
		for input_path in video_json["input"]:
			is_valid = is_valid and (os.path.isfile(input_path) or input_path in output_videos)  
		for transforms in video_json["transformations"]:
			for operation in transforms:
				n_videos=n_videos+1
				is_valid = is_valid and (operation["operation"] in operation2func)

	if is_valid:
		return n_videos
	else:
		return -1

def apply_transformations(path, transformations, background):
	global completed
	(dirname, filename) = os.path.split(path)
	input_video_name = filename #on start this is video on disk
	for transformation in transformations:
		input_video_path=os.path.join(dirname,input_video_name)
		output_video_name = transformation["operation"]+"_"+filename
		output_video_path=os.path.join(dirname,output_video_name)
		operation2func[transformation["operation"]](input_video_path, transformation["parameters"], background, output_video_path)
		input_video_name=output_video_name
		completed=completed+1

	return os.path.join(dirname,input_video_name)

def build(video_json):
	output_name=video_json["name"]
	background=video_json["background"]
	input_videos=video_json["input"]
	transformations=video_json["transformations"]

	for i in range(0,len(input_videos)):
		video_path = input_videos[i]
		video_transformations = transformations[i] 
		output_video = apply_transformations(video_path,video_transformations,background)
		os.system("mv "+output_video+" "+output_name)
		background=output_name

if not os.path.isfile(json_file): 
	print("ERROR: "+json_file+" does not exists")
	exit()

with open(json_file) as f:
    data = json.load(f)

if "videos" in data:
	n_videos = valid(data["videos"])

	if n_videos == -1:
		print("ERROR: Invalid video properties")
		exit()

	#progress bar
	t = threading.Thread(target=pb, args=(n_videos,))
	t.start()

	for video in data["videos"]:
		build(video)

	t.join()
else: 
	print("ERROR: any video present")
	exit()




