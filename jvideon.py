#!/usr/bin/python

import sys
import json
import os.path
import numpy as np
import scipy.misc

json_file="video.json"
work_directory="jvideon"

def speedup(output_name, value) :
	input_name=temp_name(output_name)
	os.system("cp "+output_name+" "+input_name)
	os.system("ffmpeg -y -i "+input_name+" -an -filter:v \"setpts=1/"+str(value)+"*PTS\" "+output_name)
	os.system("rm "+input_name)

def crop(output_name, value) :
	input_name=temp_name(output_name)
	os.system("cp "+output_name+" "+input_name)
	os.system("ffmpeg -i "+input_name+" -filter:v \"crop="+str(value)+"\" "+output_name)
	os.system("rm "+input_name)

def scale(output_name, value) :
	input_name=temp_name(output_name)
	os.system("cp "+output_name+" "+input_name)
	os.system("ffmpeg -y -i "+input_name+" -vf scale="+str(value)+" "+output_name)
	os.system("rm "+input_name)
 
def position():
	print("fill code here")

operation2func = {
    "SPEEDUP": speedup,
    "CROP": scale,
    "SCALE": crop,
    "POSITION": position
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




