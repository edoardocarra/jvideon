#!/usr/bin/python

import sys
sys.path.append('modules')
import os
import json
import operations
import ntpath

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

		if not is_valid:
			print(video_json["name"])

		is_valid = is_valid and os.path.isfile(video_json["background"])
		
		if not is_valid:
			print(video_json["background"])

		is_valid = is_valid and len(video_json["input"]) == len(video_json["transformations"])
		for input_path in video_json["input"]:
			is_valid = is_valid and (os.path.isfile(input_path) or input_path in output_videos)  
		for transforms in video_json["transformations"]:
			for operation in transforms:
				is_valid = is_valid and (operation["operation"] in operation2func)

	return is_valid

def apply_transformations(path, transformations, background):

	(dirname, filename) = os.path.split(path)
	input_video = filename
	for transformation in transformations:
		operation = transformation["operation"]
		parameters = transformation["parameters"]

		print("prendo "+ input_video)
		print("applico "+ operation)
		print("salvo "+ operation+"_"+filename)
		input_video=operation+"_"+filename

	return background

def build(video_json):
	name=video_json["name"]
	background=video_json["background"]
	input_videos=video_json["input"]
	transformations=video_json["transformations"]

	for i in range(0,len(input_videos)):
		video_path = input_videos[i]
		video_transformations = transformations[i] 
		background = apply_transformations(video_path,video_transformations,background)
	
	#for each input video and for each respective transformation, generate an intermediate video
	#intermediate video is saved in a temporary folder, and the name terminates with the name of the transformation applied on it 
	#if there are more that one video, they will compose into the first one once all transformations on them are finished

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




