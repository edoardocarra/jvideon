import numpy as np
import scipy.misc
import os

silence_console=True

def process(console_command):
	silence=""
	if silence_console:
		silence=" -loglevel 0"
	os.system(console_command+silence)

def trim(input_name, parameters, background, output_name) :
	parts=parameters.split("@")
	process("ffmpeg -y -i "+input_name+" -ss "+parts[0]+" -t "+parts[1]+" -async 1 "+output_name)

def speedup(input_name, parameters, background, output_name) :
	process("ffmpeg -y -i "+input_name+" -an -filter:v \"setpts="+parameters+"\" "+output_name)

def position(input_name, parameters, background, output_name) :
 	process("ffmpeg -y -i "+ background +" -i "+ input_name +" -filter_complex \"[0:v][1:v] overlay="+ parameters +"\" -pix_fmt yuv420p -c:a copy "+output_name)

def scale(input_name, parameters, background, output_name) :
	process("ffmpeg -y -i "+input_name+" -vf scale="+parameters+" "+output_name)

def crop(input_name, parameters, background, output_name) :
	process("ffmpeg -y -i "+input_name+" -filter:v \"crop="+parameters+"\" "+output_name)