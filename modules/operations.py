#!/usr/bin/python

import numpy as np
import scipy.misc

def speedup():
	print("fill code speedup")
def scale():
	print("fill code scale")
def crop():
	print("fill code crop")
def position():
	print("fill code position")
def trim():
	print("fill code trim")

# def out_path(file):
# 	return os.path.join(output_dir,file)
# def in_path(file):
# 	return os.path.join(asset_folder,file)

# def empty():
# 	image_array = np.zeros([1080,1920,3],dtype=np.uint8)
# 	image_array[:] = 255
# 	scipy.misc.imsave(out_path("empty.png"), image_array)

# def temp_name(output_name):
# 	path, filename = os.path.split(output_name)
# 	filename = os.path.splitext(filename)[0]
# 	newfilename = 'temp_%s.mp4' % filename
# 	return os.path.join(path, newfilename)

# def speedup(output_name, value) :
# 	input_name=temp_name(output_name)
# 	os.system("cp "+output_name+" "+input_name)
# 	os.system("ffmpeg -y -i "+input_name+" -an -filter:v \"setpts=1/"+str(value)+"*PTS\" "+output_name)
# 	os.system("rm "+input_name)

# def crop(output_name, value) :
# 	input_name=temp_name(output_name)
# 	os.system("cp "+output_name+" "+input_name)
# 	os.system("ffmpeg -i "+input_name+" -filter:v \"crop="+str(value)+"\" "+output_name)
# 	os.system("rm "+input_name)

# def scale(output_name, value) :
# 	input_name=temp_name(output_name)
# 	os.system("cp "+output_name+" "+input_name)
# 	os.system("ffmpeg -y -i "+input_name+" -vf scale="+str(value)+" "+output_name)
# 	os.system("rm "+input_name)

# def overlay(background_video, overlay, background_image="") :
# 	if background_image!="":
# 		background = background_image
# 	else:
# 		background=temp_name(background_video)
# 		os.system("cp "+background_video+" "+background)

# 	os.system("ffmpeg -y -i "+ background +" -i "+ out_path(overlay["input"]) +" -filter_complex \"[0:v][1:v] overlay="+ overlay["position"] +"\" -pix_fmt yuv420p -c:a copy "+background_video)

# def build(video):
# 	input_name=in_path(video['input'])
# 	os.system("cp "+input_name+" "+output_dir)
# 	output_name=out_path(video['input'])
# 	for key,value in video.items():
# 		if key in field_2_func:
# 			field_2_func[key](output_name, value)

# def combine(output, parameters):
# 	if parameters["background"]=="empty.png":
# 		empty()
# 	itervids = iter(parameters["videos"])
# 	overlay(output, next(itervids), out_path(parameters["background"]))
# 	for video in itervids:
# 		overlay(output, video)