#!/usr/bin/python

import sys
import json
import os.path
import numpy as np
import scipy.misc

json_file="video.json"
work_directory="jvideon"

def valid(video_json):
	is_valid=True
	is_valid = is_valid and video_json["name"] != ""
	is_valid = is_valid and os.path.isfile(video_json["background"])
	is_valid = is_valid and len(video_json["input"]) == len(video_json["transformations"])
	for path in video_json["input"]:
		is_valid = is_valid and os.path.isfile(path)
	for transform in video_json["transformations"]:
		is_valid = is_valid and (transform in operation2func)

	return is_valid

def build(video_json):
	if not valid(video_json):
		print("ERROR: Invalid video properties")
		exit()

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
	for video in data["videos"]:
		build(video)
else: 
	print("ERROR: any video present")
	exit()




