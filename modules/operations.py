import os
import subprocess
import re

silence_console=True

def process(console_command):
	silence=""
	if silence_console:
		silence=" -loglevel 0"
	os.system(console_command+silence)

def time(duration):
	result = re.search('Duration: (.*), start', duration)
	seconds=0
	time = result.group(1)
	parts=time.split(':')
	seconds+=float(parts[0])*3600 + float(parts[1])*60 + float(parts[2])
	return seconds

def getLength(filename):
	result = subprocess.Popen(["ffprobe", filename],stdout = subprocess.PIPE, stderr = subprocess.STDOUT)
	duration = [x for x in result.stdout.readlines() if "Duration" in x]
	return time(duration[0])

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

def crossfade(input_videos,output_name) :

	fade_time = 0.5
	command = "ffmpeg -y "
	for video in input_videos:
		command += "-i "+video+" "
	command += "-f lavfi -i color=white:s=1920x1080 -filter_complex "

	command += "\""

	time_pts=-fade_time
	for i in range(0,len(input_videos)):
		vformat="format=pix_fmts=yuva420p,"

		if i==0:
			fade_in=""
			pts="setpts=PTS-STARTPTS+0/TB"
		else:
			fade_in="fade=t=in:st=0:d=1:alpha=1,"
			pts="setpts=PTS-STARTPTS+"+str(time_pts)+"/TB"			

		time_pts+=getLength(input_videos[i])

		fade_out="fade=t=out:st="+str(time_pts)+":d=1:alpha=1,"

		command+="["+str(i)+":v]"+vformat+fade_in+fade_out+pts+"[v"+str(i)+"]; "

	command+="["+str(i)+":v]trim=duration=40[over]; "

	for i in range(0,len(input_videos)-1):
		one="[over"
		if i==0:
			two="]"
		else:
			two=str(i)+"]"
		three="[v"+str(i)+"]overlay[over"+str(i+1)+"]; "
		command+=one+two+three

	command+="[over"+str(len(input_videos)-1)+"][v"+str(len(input_videos)-1)+"]overlay=format=yuv420[outv]\" -vcodec libx264 -map [outv] "+output_name

	process(command)
