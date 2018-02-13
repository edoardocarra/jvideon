##CROSS FADING PIPELINE
##
#rm -rf ./supplemental/intermediates
#mkdir ./supplemental/intermediates
##
#ffmpeg -i video_results/original/sea_A.mov  -an -filter:v "setpts=0.1*PTS" supplemental/intermediates/sea_A_su.mp4
#ffmpeg -i video_results/original/lion_A.mov  -an -filter:v "setpts=0.05*PTS" supplemental/intermediates/lion_A_su.mp4
#ffmpeg -i video_results/original/house_A.mov  -an -filter:v "setpts=0.1*PTS" supplemental/intermediates/house_A_su.mp4
#ffmpeg -i video_results/original/ivy_A.mov  -an -filter:v "setpts=0.05*PTS" supplemental/intermediates/ivy_A_su.mp4
#ffmpeg -i video_results/original/sea_B.mov  -an -filter:v "setpts=0.1*PTS" supplemental/intermediates/sea_B_su.mp4
#ffmpeg -i video_results/original/lion_B.mov  -an -filter:v "setpts=0.05*PTS" supplemental/intermediates/lion_B_su.mp4
#ffmpeg -i video_results/original/house_B.mov  -an -filter:v "setpts=0.1*PTS" supplemental/intermediates/house_B_su.mp4
#ffmpeg -i video_results/original/ivy_B.mov  -an -filter:v "setpts=0.05*PTS" supplemental/intermediates/ivy_B_su.mp4
###
#ffmpeg -i supplemental/intermediates/sea_A_su.mp4 -i supplemental/intermediates/sea_B_su.mp4 -filter_complex hstack supplemental/intermediates/sea_A_B.mp4
#ffmpeg -i supplemental/intermediates/lion_A_su.mp4 -i supplemental/intermediates/lion_B_su.mp4 -filter_complex hstack supplemental/intermediates/lion_A_B.mp4
#ffmpeg -i supplemental/intermediates/house_A_su.mp4 -i supplemental/intermediates/house_B_su.mp4 -filter_complex hstack supplemental/intermediates/house_A_B.mp4
#ffmpeg -i supplemental/intermediates/ivy_A_su.mp4 -i supplemental/intermediates/ivy_B_su.mp4 -filter_complex hstack supplemental/intermediates/ivy_A_B.mp4
##
#ffmpeg -i supplemental/intermediates/sea_A_B.mp4 -filter:v "crop=2880:847:0:48" supplemental/intermediates/sea_A_B_crp.mp4
#ffmpeg -i supplemental/intermediates/lion_A_B.mp4 -filter:v "crop=2880:847:0:48" supplemental/intermediates/lion_A_B_crp.mp4
#ffmpeg -i supplemental/intermediates/house_A_B.mp4 -filter:v "crop=2880:847:0:48" supplemental/intermediates/house_A_B_crp.mp4
#ffmpeg -i supplemental/intermediates/ivy_A_B.mp4 -filter:v "crop=2880:847:0:48" supplemental/intermediates/ivy_A_B_crp.mp4
##
#ffmpeg -i supplemental/intermediates/sea_A_B_crp.mp4 -vf scale=1920:-1 supplemental/intermediates/sea_A_B_crp_sc.mp4
#ffmpeg -i supplemental/intermediates/lion_A_B_crp.mp4 -vf scale=1920:-1 supplemental/intermediates/lion_A_B_crp_sc.mp4
#ffmpeg -i supplemental/intermediates/house_A_B_crp.mp4 -vf scale=1920:-1 supplemental/intermediates/house_A_B_crp_sc.mp4
#ffmpeg -i supplemental/intermediates/ivy_A_B_crp.mp4 -vf scale=1920:-1 supplemental/intermediates/ivy_A_B_crp_sc.mp4
#
#ffmpeg -loop 1 -i ./slides/supplemental_title.png -c:v libx264 -preset ultrafast -t 5 -pix_fmt yuv420p ./slides/supplemental_title.mp4
#ffmpeg -loop 1 -i ./slides/supplemental_slide2.png -c:v libx264 -preset ultrafast -t 4 -pix_fmt yuv420p ./slides/supplemental_slide2.mp4
##
#ffmpeg -i slides/sea_sx.png -i supplemental/intermediates/sea_A_B_crp_sc.mp4 -filter_complex "[0:v][1:v] overlay=0:256" -pix_fmt yuv420p -c:a copy ./supplemental/sea_label.mp4
#ffmpeg -i slides/lion_sx.png -i supplemental/intermediates/lion_A_B_crp_sc.mp4 -filter_complex "[0:v][1:v] overlay=0:256" -pix_fmt yuv420p -c:a copy ./supplemental/lion_label.mp4
#ffmpeg -i slides/house_sx.png -i supplemental/intermediates/house_A_B_crp_sc.mp4 -filter_complex "[0:v][1:v] overlay=0:256" -pix_fmt yuv420p -c:a copy ./supplemental/house_label.mp4
#ffmpeg -i slides/ivy_sx.png -i supplemental/intermediates/ivy_A_B_crp_sc.mp4 -filter_complex "[0:v][1:v] overlay=0:256" -pix_fmt yuv420p -c:a copy ./supplemental/ivy_label.mp4
#

#[2:v]format=pix_fmts=yuva420p,fade=t=in:st=0:d=1:alpha=1,fade=t=out:st=[ENDSECONDS]:d=1:alpha=1,setpts=PTS-STARTPTS+[STARTSECOND]/TB[v2];

#
#
ffmpeg -y -i ./slides/supplemental_title.mp4 \
-i ./slides/supplemental_slide2.mp4 \
-i ./supplemental/house_label.mp4  \
-i ./supplemental/ivy_label.mp4 \
-i ./supplemental/lion_label.mp4 \
-i ./supplemental/sea_label.mp4 \
-f lavfi -i color=white:s=1920x1080 -filter_complex \
"[0:v]format=pix_fmts=yuva420p,fade=t=out:st=10:d=1:alpha=1,setpts=PTS-STARTPTS[v0]; \
[1:v]format=pix_fmts=yuva420p,fade=t=in:st=0:d=1:alpha=1,fade=t=out:st=8:d=1:alpha=1,setpts=PTS-STARTPTS+4.5/TB[v1]; \
[2:v]format=pix_fmts=yuva420p,fade=t=in:st=0:d=1:alpha=1,fade=t=out:st=96:d=1:alpha=1,setpts=PTS-STARTPTS+8/TB[v2]; \
[3:v]format=pix_fmts=yuva420p,fade=t=in:st=0:d=1:alpha=1,fade=t=out:st=236:d=1:alpha=1,setpts=PTS-STARTPTS+96/TB[v3]; \
[4:v]format=pix_fmts=yuva420p,fade=t=in:st=0:d=1:alpha=1,fade=t=out:st=327:d=1:alpha=1,setpts=PTS-STARTPTS+236/TB[v4]; \
[5:v]format=pix_fmts=yuva420p,fade=t=in:st=0:d=1:alpha=1,fade=t=out:st=397:d=1:alpha=1,setpts=PTS-STARTPTS+327/TB[v5]; \
[6:v]trim=duration=40[over]; \
[over][v0]overlay[over1]; \
[over1][v1]overlay[over2]; \
[over2][v2]overlay[over3]; \
[over3][v3]overlay[over4]; \
[over4][v4]overlay[over5]; \
[over5][v5]overlay=format=yuv420[outv]" \
-vcodec libx264 -map [outv] supplemental_results.mp4

# ffmpeg -i slides/house.png -i videos_ready/house_A_B.mp4 -filter_complex "[0:v][1:v] overlay=0:161.9" -pix_fmt yuv420p -c:a copy videos_paper/house_A_B.mp4
# ffmpeg -i slides/ivy.png -i videos_ready/ivy_A_B.mp4 -filter_complex "[0:v][1:v] overlay=0:161.9" -pix_fmt yuv420p -c:a copy videos_paper/ivy_A_B.mp4
# ffmpeg -i slides/lion.png -i videos_ready/lion_A_B.mp4 -filter_complex "[0:v][1:v] overlay=0:161.9" -pix_fmt yuv420p -c:a copy videos_paper/lion_A_B.mp4
# ffmpeg -i slides/sea.png -i videos_ready/sea_A_B.mp4 -filter_complex "[0:v][1:v] overlay=0:161.9" -pix_fmt yuv420p -c:a copy videos_paper/sea_A_B.mp4

#
#ffmpeg -i supplemental1.mp4 -filter_complex \
#"[0:v]trim=duration=93[a]; \
# [0:v]trim=start=264:end=407,setpts=PTS-STARTPTS[b]; \
# [0:v]trim=start=692:end=781,setpts=PTS-STARTPTS[c]; \
# [0:v]trim=start=958:end=1046,setpts=PTS-STARTPTS[d]; \
# [a][b][c][d]concat=n=4,format=yuv420p[out]" -map [out] supplemental_trimmed.mp4
#

#CONVIENE CHE LE SLIDE SIANO DEI VIDEO CON BACKGROUND BIANCO, LABEL E VIDEO GIA' FATTI, 
# E POI INSERITI IN QUESTA PIPELINE CHE FA IL CROSS FADING 


