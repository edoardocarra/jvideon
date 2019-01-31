import os
import subprocess
import re

silence_console=True

def process(console_command):
	silence=""
	if silence_console:
		silence=" -loglevel 0"
	os.system(console_command+silence)

def getLength(filename):

	#SUBPROCESS HERE

	time=os.system("ffprobe -i "+filename+" -show_entries format=duration -v quiet -of csv=\"p=0\"")
	print(time)
	return time

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

	fade_time = 1
	command = "ffmpeg -y "
	for video in input_videos:
		command += "-i "+video+" "
	command += "-f lavfi -i color=white:s=1920x1080 -filter_complex "

	command += "\""

	time_pts=0
	for i in range(0,len(input_videos)):
		vformat="format=pix_fmts=yuva420p"

		if i==0:
			fade_in=""
		else:
			fade_in="fade=t=in:st=0:d=1:alpha=1"			

		pts="setpts=PTS-STARTPTS+"+str(time_pts)+"/TB"

		time_pts+=getLength(input_videos[i])

		fade_out="fade=t=out:st="+str(time_pts)+":d=1:alpha=1"
		print(time_pts)
		print(fade_in)
		print(fade_out)
		print(pts)

	command += "\""

	print(command)

#ffmpeg -y -i slides/us.mp4 \
#-i video_userstudy/photo3_40s_label_su.mp4 \
#-i video_userstudy/drawing2_40s_label_su.mp4 \
#-i video_userstudy/photo4_40s_label_su.mp4 \
#-i video_userstudy/drawing3_40s_label_su.mp4 \
#-i video_userstudy/drawing5_label.mp4 \
#-f lavfi -i color=white:s=1920x1080 -filter_complex \
#"[0:v]format=pix_fmts=yuva420p,fade=t=out:st=10:d=1:alpha=1,setpts=PTS-STARTPTS[v0]; \
#[1:v]format=pix_fmts=yuva420p,fade=t=in:st=0:d=1:alpha=1,fade=t=out:st=22.5:d=1:alpha=1,setpts=PTS-STARTPTS+2.5/TB[v1]; \
#[2:v]format=pix_fmts=yuva420p,fade=t=in:st=0:d=1:alpha=1,fade=t=out:st=42.5:d=1:alpha=1,setpts=PTS-STARTPTS+22.5/TB[v2]; \
#[3:v]format=pix_fmts=yuva420p,fade=t=in:st=0:d=1:alpha=1,fade=t=out:st=62.5:d=1:alpha=1,setpts=PTS-STARTPTS+42.5/TB[v3]; \
#[4:v]format=pix_fmts=yuva420p,fade=t=in:st=0:d=1:alpha=1,fade=t=out:st=82.5:d=1:alpha=1,setpts=PTS-STARTPTS+62.5/TB[v4]; \
#[5:v]format=pix_fmts=yuva420p,fade=t=in:st=0:d=1:alpha=1,fade=t=out:st=102.5:d=1:alpha=1,setpts=PTS-STARTPTS+82.5/TB[v5]; \
#[5:v]trim=duration=40[over]; \
#[over][v0]overlay[over1]; \
#[over1][v1]overlay[over2]; \
#[over2][v2]overlay[over3]; \
#[over3][v3]overlay[over4]; \
#[over4][v4]overlay[over5]; \
#[over5][v5]overlay=format=yuv420[outv]" \
#-vcodec libx264 -map [outv] video_userstudy/us_sequences_40s.mp4
