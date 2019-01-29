#!/usr/bin/python

import sys
sys.path.append('modules')
import os
import json
import operations

json_file="video.json"
work_directory="jvideon"

operation2func = {
    "SPEEDUP": operations.speedup,
    "CROP": operations.scale,
    "SCALE": operations.crop,
    "POSITION": operations.position,
    "TRIM": operations.trim
}

def valid(videos_json):
	is_valid=True
	output_videos=[video_json["name"] for video_json in videos_json]

	for video_json in videos_json:
		is_valid = is_valid and video_json["name"] != ""
		is_valid = is_valid and os.path.isfile(video_json["background"])
		is_valid = is_valid and len(video_json["input"]) == len(video_json["transformations"])
		for input_path in video_json["input"]:
			is_valid = is_valid and (os.path.isfile(input_path) or input_path in output_videos)  
		for transforms in video_json["transformations"]:
			for operation in transforms:
				is_valid = is_valid and (operation["operation"] in operation2func)
	return is_valid

def build(video_json):
	name=video_json["name"]
	background=video_json["background"]
	input_videos=video_json["input"]
	transformations=video_json["transformations"]
	#building logic

if not os.path.isfile(json_file): 
	print("ERROR: "+json_file+" does not exists")
	exit()

with open(json_file) as f:
    data = json.load(f)

if "videos" in data:
	if not valid(data["videos"]):
		print("ERROR: Invalid video properties")
		exit()
	print("Valid properties. Building")
	for video in data["videos"]:
		build(video)
else: 
	print("ERROR: any video present")
	exit()




