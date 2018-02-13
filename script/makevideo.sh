#########################################    BUILDING UP TITLE    ######################################
########################################################################################################
##ffmpeg -loop 1 -i slides/title.png -c:v libx264 -preset ultrafast -t 5 -pix_fmt yuv420p slides/title.mp4
##ffmpeg -loop 1 -i slides/results.png -c:v libx264 -preset ultrafast -t 3 -pix_fmt yuv420p slides/results.mp4
##ffmpeg -loop 1 -i slides/sys_coll_feat.png -c:v libx264 -preset ultrafast -t 3 -pix_fmt yuv420p slides/sys_coll_feat.mp4
###
#########################################    BUILDING UP RESULTS    ####################################
########################################################################################################
#rm -rf video_results/intermediates
#mkdir -p video_results/intermediates
#
#ffmpeg -i video_results/original/ivy_A.mov -ss 00:17:50 -t 00:03:20 -async 1 video_results/intermediates/ivy_A_trim.mp4
#ffmpeg -i video_results/original/ivy_B.mov -ss 00:17:50 -t 00:03:20 -async 1 video_results/intermediates/ivy_B_trim.mp4
#ffmpeg -i video_results/intermediates/ivy_A_trim.mp4  -an -filter:v "setpts=0.1*PTS" video_results/intermediates/ivy_A_trim_su.mp4
#ffmpeg -i video_results/intermediates/ivy_B_trim.mp4  -an -filter:v "setpts=0.1*PTS" video_results/intermediates/ivy_B_trim_su.mp4
#

#ffmpeg -i video_results/original/lion_A.mov -ss 00:11:40 -t 00:03:20 -async 1 video_results/intermediates/lion_A_trim.mp4
#ffmpeg -i video_results/original/lion_B.mov -ss 00:11:40 -t 00:03:20 -async 1 video_results/intermediates/lion_B_trim.mp4
#ffmpeg -i video_results/intermediates/lion_A_trim.mp4  -an -filter:v "setpts=0.1*PTS" video_results/intermediates/lion_A_trim_su.mp4
#ffmpeg -i video_results/intermediates/lion_B_trim.mp4  -an -filter:v "setpts=0.1*PTS" video_results/intermediates/lion_B_trim_su.mp4
#
#ffmpeg -i video_results/original/sea_A.mov -ss 00:02:50 -t 00:01:40 -async 1 video_results/intermediates/sea_A_trim.mp4
#ffmpeg -i video_results/original/sea_B.mov -ss 00:02:50 -t 00:01:40 -async 1 video_results/intermediates/sea_B_trim.mp4
#ffmpeg -i video_results/intermediates/sea_A_trim.mp4  -an -filter:v "setpts=0.2*PTS" video_results/intermediates/sea_A_trim_su.mp4
#ffmpeg -i video_results/intermediates/sea_B_trim.mp4  -an -filter:v "setpts=0.2*PTS" video_results/intermediates/sea_B_trim_su.mp4
#
#ffmpeg -i video_results/original/house_A.mov -ss 00:12:13 -t 00:01:42 -async 1 video_results/intermediates/house_A_trim.mp4
#ffmpeg -i video_results/original/house_B.mov -ss 00:12:13 -t 00:01:42 -async 1 video_results/intermediates/house_B_trim.mp4
#ffmpeg -i video_results/intermediates/house_A_trim.mp4  -an -filter:v "setpts=0.2*PTS" video_results/intermediates/house_A_trim_su.mp4
#ffmpeg -i video_results/intermediates/house_B_trim.mp4  -an -filter:v "setpts=0.2*PTS" video_results/intermediates/house_B_trim_su.mp4
#
#ffmpeg -i video_results/intermediates/house_A_trim_su.mp4 -filter:v "crop=1440:847:0:48" video_results/intermediates/house_A_trim_su_c.mp4
#ffmpeg -i video_results/intermediates/house_B_trim_su.mp4 -filter:v "crop=1440:847:0:48" video_results/intermediates/house_B_trim_su_c.mp4
#ffmpeg -i video_results/intermediates/sea_A_trim_su.mp4 -filter:v "crop=1440:847:0:48" video_results/intermediates/sea_A_trim_su_c.mp4
#ffmpeg -i video_results/intermediates/sea_B_trim_su.mp4 -filter:v "crop=1440:847:0:48" video_results/intermediates/sea_B_trim_su_c.mp4
#ffmpeg -i video_results/intermediates/lion_A_trim_su.mp4 -filter:v "crop=1440:847:0:48" video_results/intermediates/lion_A_trim_su_c.mp4
#ffmpeg -i video_results/intermediates/lion_B_trim_su.mp4 -filter:v "crop=1440:847:0:48" video_results/intermediates/lion_B_trim_su_c.mp4
#ffmpeg -i video_results/intermediates/ivy_A_trim_su.mp4 -filter:v "crop=1440:847:0:48" video_results/intermediates/ivy_A_trim_su_c.mp4
#ffmpeg -i video_results/intermediates/ivy_B_trim_su.mp4 -filter:v "crop=1440:847:0:48" video_results/intermediates/ivy_B_trim_su_c.mp4
#
#ffmpeg -i video_results/intermediates/ivy_A_trim_su_c.mp4 -i video_results/intermediates/ivy_B_trim_su_c.mp4 -filter_complex hstack video_results/intermediates/ivy_AB.mp4
#ffmpeg -i video_results/intermediates/lion_A_trim_su_c.mp4 -i video_results/intermediates/lion_B_trim_su_c.mp4 -filter_complex hstack video_results/intermediates/lion_AB.mp4
#ffmpeg -i video_results/intermediates/house_A_trim_su_c.mp4 -i video_results/intermediates/house_B_trim_su_c.mp4 -filter_complex hstack video_results/intermediates/house_AB.mp4
#ffmpeg -i video_results/intermediates/sea_A_trim_su_c.mp4 -i video_results/intermediates/sea_B_trim_su_c.mp4 -filter_complex hstack video_results/intermediates/sea_AB.mp4
#
#ffmpeg -i video_results/intermediates/ivy_AB.mp4 -vf scale=1920:-1 video_results/intermediates/ivy_ABs.mp4
#ffmpeg -i video_results/intermediates/lion_AB.mp4 -vf scale=1920:-1 video_results/intermediates/lion_ABs.mp4
#ffmpeg -i video_results/intermediates/house_AB.mp4 -vf scale=1920:-1 video_results/intermediates/house_ABs.mp4
#ffmpeg -i video_results/intermediates/sea_AB.mp4 -vf scale=1920:-1 video_results/intermediates/sea_ABs.mp4

#ffmpeg -i slides/lion_sxr.png -i video_results/intermediates/lion_ABs.mp4 -filter_complex "[0:v][1:v] overlay=0:256" -pix_fmt yuv420p -c:a copy video_results/intermediates/lion_AB_fin.mp4
#ffmpeg -i slides/sea_sxr.png -i video_results/intermediates/sea_ABs.mp4 -filter_complex "[0:v][1:v] overlay=0:256" -pix_fmt yuv420p -c:a copy video_results/intermediates/sea_AB_fin.mp4
#ffmpeg -i slides/ivy_sxr.png -i video_results/intermediates/ivy_ABs.mp4 -filter_complex "[0:v][1:v] overlay=0:256" -pix_fmt yuv420p -c:a copy video_results/intermediates/ivy_AB_fin.mp4
#ffmpeg -i slides/house_sxr.png -i video_results/intermediates/house_ABs.mp4 -filter_complex "[0:v][1:v] overlay=0:256" -pix_fmt yuv420p -c:a copy video_results/intermediates/house_AB_fin.mp4

#ffmpeg -y -i slides/supplemental_slide2.mp4 \
#-i video_results/intermediates/house_AB_fin.mp4  \
#-i video_results/intermediates/ivy_AB_fin.mp4 \
#-i video_results/intermediates/lion_AB_fin.mp4 \
#-i video_results/intermediates/sea_AB_fin.mp4 \
#-f lavfi -i color=white:s=1920x1080 -filter_complex \
#"[0:v]format=pix_fmts=yuva420p,fade=t=out:st=10:d=1:alpha=1,setpts=PTS-STARTPTS[v0]; \
#[1:v]format=pix_fmts=yuva420p,fade=t=in:st=0:d=1:alpha=1,fade=t=out:st=22.5:d=1:alpha=1,setpts=PTS-STARTPTS+2.5/TB[v1]; \
#[2:v]format=pix_fmts=yuva420p,fade=t=in:st=0:d=1:alpha=1,fade=t=out:st=42.5:d=1:alpha=1,setpts=PTS-STARTPTS+22.5/TB[v2]; \
#[3:v]format=pix_fmts=yuva420p,fade=t=in:st=0:d=1:alpha=1,fade=t=out:st=62.5:d=1:alpha=1,setpts=PTS-STARTPTS+42.5/TB[v3]; \
#[4:v]format=pix_fmts=yuva420p,fade=t=in:st=0:d=1:alpha=1,fade=t=out:st=82.5:d=1:alpha=1,setpts=PTS-STARTPTS+62.5/TB[v4]; \
#[5:v]trim=duration=40[over]; \
#[over][v0]overlay[over1]; \
#[over1][v1]overlay[over2]; \
#[over2][v2]overlay[over3]; \
#[over3][v3]overlay[over4]; \
#[over4][v4]overlay=format=yuv420[outv]" \
#-vcodec libx264 -map [outv] video_results/results.mp4


########################################   BUILDING UP 4x image   ####################################
#######################################################################################################

#
#
#ffmpeg -i video_results/intermediates/house_ABs.mp4 \
#-i video_results/intermediates/ivy_ABs.mp4 \
#-i video_results/intermediates/lion_ABs.mp4 \
#-i video_results/intermediates/sea_ABs.mp4 \
#-filter_complex " nullsrc=size=1920x1080 [base];[0:v] setpts=PTS-STARTPTS, scale=960x234 [upperleft];[1:v] setpts=PTS-STARTPTS, scale=960x234 [upperright];[2:v] setpts=PTS-STARTPTS, scale=960x234 [lowerleft];[3:v] setpts=PTS-STARTPTS, scale=960x234 [lowerright];[base][upperleft] overlay=shortest=1:x [tmp1];[tmp1][upperright] overlay=shortest=1:x=960 [tmp2];[tmp2][lowerleft] overlay=shortest=1:y=540 [tmp3];[tmp3][lowerright] overlay=shortest=1:x=960:y=540" \
#-c:v libx264 video_results/mosaic.mp4
##
##
#
#ffmpeg -i video_results/original/sea_A.mov -ss 00:09:33 -t 00:01:40 -async 1 video_results/intermediates/sea_A_trim2.mp4
#ffmpeg -i video_results/original/sea_B.mov -ss 00:09:34 -t 00:01:40 -async 1 video_results/intermediates/sea_B_trim2.mp4
#ffmpeg -i video_results/intermediates/sea_A_trim2.mp4  -an -filter:v "setpts=0.2*PTS" video_results/intermediates/sea_A_trim_su2.mp4
#ffmpeg -i video_results/intermediates/sea_B_trim2.mp4  -an -filter:v "setpts=0.2*PTS" video_results/intermediates/sea_B_trim_su2.mp4
#
#ffmpeg -i video_results/intermediates/sea_ABs2.mp4  -an -filter:v "setpts=0.38*PTS" video_results/intermediates/sea_ABx4.mp4
#
# 2 users introduction ivy
#ffmpeg -i video_results/original/ivy_A.mov -ss 00:25:54 -t 00:01:40 -async 1 video_results/intermediates/ivy_A_trim.mp4
#ffmpeg -i video_results/original/ivy_B.mov -ss 00:25:54 -t 00:01:40 -async 1 video_results/intermediates/ivy_B_trim.mp4
#ffmpeg -i video_results/intermediates/ivy_A_trim.mp4  -an -filter:v "setpts=0.2*PTS" video_results/intermediates/ivy_A_trim_su.mp4
#ffmpeg -i video_results/intermediates/ivy_B_trim.mp4  -an -filter:v "setpts=0.2*PTS" video_results/intermediates/ivy_B_trim_su.mp4
#
#ffmpeg -i video_results/intermediates/ivy_A_trim_su.mp4 -filter:v "crop=1440:847:0:48" video_results/intermediates/ivy_A_trim_su_intro.mp4
#ffmpeg -i video_results/intermediates/ivy_B_trim_su.mp4 -filter:v "crop=1440:847:0:48" video_results/intermediates/ivy_B_trim_su_intro.mp4
#
#ffmpeg -i video_results/intermediates/ivy_A_trim_su_intro.mp4 -i video_results/intermediates/ivy_B_trim_su_intro.mp4 -filter_complex hstack video_results/intermediates/ivy_AB_intro.mp4
#
#ffmpeg -i video_results/intermediates/ivy_AB_intro.mp4 -vf scale=1920:-1 video_results/intermediates/ivy_ABs2.mp4
#
#ffmpeg -i video_results/intermediates/ivy_ABs2.mp4  -an -filter:v "setpts=0.38*PTS" video_results/intermediates/ivy_ABx4.mp4
#
##
## 2 users introduction lion
#ffmpeg -i video_results/original/lion_A.mov -ss 00:03:13 -t 00:01:40 -async 1 video_results/intermediates/lion_A_trim.mp4
#ffmpeg -i video_results/original/lion_B.mov -ss 00:03:13 -t 00:01:40 -async 1 video_results/intermediates/lion_B_trim.mp4
#ffmpeg -i video_results/intermediates/lion_A_trim.mp4  -an -filter:v "setpts=0.2*PTS" video_results/intermediates/lion_A_trim_su.mp4
#ffmpeg -i video_results/intermediates/lion_B_trim.mp4  -an -filter:v "setpts=0.2*PTS" video_results/intermediates/lion_B_trim_su.mp4
#
#ffmpeg -i video_results/intermediates/lion_A_trim_su.mp4 -filter:v "crop=1440:847:0:48" video_results/intermediates/lion_A_trim_su_intro.mp4
#ffmpeg -i video_results/intermediates/lion_B_trim_su.mp4 -filter:v "crop=1440:847:0:48" video_results/intermediates/lion_B_trim_su_intro.mp4
#
#ffmpeg -i video_results/intermediates/lion_A_trim_su_intro.mp4 -i video_results/intermediates/lion_B_trim_su_intro.mp4 -filter_complex hstack video_results/intermediates/lion_AB_intro.mp4
#
#ffmpeg -i video_results/intermediates/lion_AB_intro.mp4 -vf scale=1920:-1 video_results/intermediates/lion_ABs2.mp4
#
#ffmpeg -i video_results/intermediates/lion_ABs2.mp4  -an -filter:v "setpts=0.38*PTS" video_results/intermediates/lion_ABsx4.mp4
#
###
###
#
### 2 users introduction house
#ffmpeg -i video_results/original/house_A.mov -ss 00:04:40 -t 00:01:40 -async 1 video_results/intermediates/house_A_trim_gab.mp4
#ffmpeg -i video_results/original/house_B.mov -ss 00:04:40 -t 00:01:40 -async 1 video_results/intermediates/house_B_trim_gab.mp4
#ffmpeg -i video_results/intermediates/house_A_trim_gab.mp4  -an -filter:v "setpts=0.2*PTS" video_results/intermediates/house_A_trim_su_gab.mp4
#ffmpeg -i video_results/intermediates/house_B_trim_gab.mp4  -an -filter:v "setpts=0.2*PTS" video_results/intermediates/house_B_trim_su_gab.mp4
#
#ffmpeg -i video_results/intermediates/house_A_trim_su_gab.mp4 -filter:v "crop=1440:847:0:48" video_results/intermediates/house_A_trim_su_intro_gab.mp4
#ffmpeg -i video_results/intermediates/house_B_trim_su_gab.mp4 -filter:v "crop=1440:847:0:48" video_results/intermediates/house_B_trim_su_intro_gab.mp4
#
#ffmpeg -i video_results/intermediates/house_A_trim_su_intro_gab.mp4 -i video_results/intermediates/house_B_trim_su_intro_gab.mp4 -filter_complex hstack video_results/intermediates/house_AB_intro_gab.mp4
#
#ffmpeg -i video_results/intermediates/house_AB_intro_gab.mp4 -vf scale=1920:-1 video_results/intermediates/house_ABs2_gab.mp4
#
#ffmpeg -i video_results/intermediates/house_ABs2_gab.mp4 -an -filter:v "setpts=0.38*PTS" video_results/intermediates/house_ABsx4_gab.mp4
#
#
##
#ffmpeg -y -i video_results/intermediates/house_ABsx4_gab.mp4 \
#-i video_results/intermediates/ivy_ABx4.mp4 \
#-i video_results/intermediates/lion_ABsx4.mp4 \
#-i video_results/intermediates/sea_ABsx4.mp4 \
#-f lavfi -i color=white:s=1920x564 -filter_complex \
#"[0:v]format=pix_fmts=yuva420p,fade=t=out:st=10:d=1:alpha=1,setpts=PTS-STARTPTS[v0]; \
#[1:v]format=pix_fmts=yuva420p,fade=t=in:st=0:d=1:alpha=1,fade=t=out:st=13.5:d=1:alpha=1,setpts=PTS-STARTPTS+6.5/TB[v1]; \
#[2:v]format=pix_fmts=yuva420p,fade=t=in:st=0:d=1:alpha=1,fade=t=out:st=20.5:d=1:alpha=1,setpts=PTS-STARTPTS+13.5/TB[v2]; \
#[3:v]format=pix_fmts=yuva420p,fade=t=in:st=0:d=1:alpha=1,fade=t=out:st=27.5:d=1:alpha=1,setpts=PTS-STARTPTS+20.5/TB[v3]; \
#[4:v]trim=duration=28[over]; \
#[over][v0]overlay[over1]; \
#[over1][v1]overlay[over2]; \
#[over2][v2]overlay[over3]; \
#[over3][v3]overlay=format=yuv420[outv]" \
#-vcodec libx264 -map [outv] video_results/intermediates/sixsecfading_gab.mp4
#
##
##ffmpeg -loop 1 -i slides/2users.png -c:v libx264 -preset ultrafast -t 4 -pix_fmt yuv420p slides/2users.png
###
#ffmpeg -i slides/2users.png -i video_results/intermediates/sixsecfading_gab.mp4 -filter_complex "[0:v][1:v] overlay=0:256" -pix_fmt yuv420p -c:a copy video_results/2users_gab.mp4

########################################   BUILDING UP SPIEGOTTO   ####################################
#######################################################################################################



#rm -rf video_spiegotto/intermediates
#mkdir -p video_spiegotto/intermediates
#
## cropping for spiegotto
#ffmpeg -i video_spiegotto/lion_A.mp4 -filter:v "crop=1440:847:0:48" video_spiegotto/intermediates/lion_A_crop.mp4
#ffmpeg -i video_spiegotto/lion_B.mp4 -filter:v "crop=1440:847:0:48" video_spiegotto/intermediates/lion_B_crop.mp4
#
## scaling for spiegotto min max
#ffmpeg -i video_spiegotto/intermediates/lion_A_crop.mp4 -vf scale=576:-1 video_spiegotto/intermediates/lion_A_crop_sc_mini.mp4
#ffmpeg -i video_spiegotto/intermediates/lion_A_crop.mp4 -vf scale=1192:-1 video_spiegotto/intermediates/lion_A_crop_sc_maxi.mp4
#ffmpeg -i video_spiegotto/intermediates/lion_B_crop.mp4 -vf scale=1192:-1 video_spiegotto/intermediates/lion_B_crop_sc_maxi.mp4
#
## OVERLAY SPIEGOTTO
#
#ffmpeg -i slides/usera.png -i video_spiegotto/intermediates/lion_A_crop_sc_maxi.mp4 -filter_complex "[0:v][1:v] overlay=364:111.3" -pix_fmt yuv420p -c:a copy video_spiegotto/intermediates/lion_A_spiegotto.mp4
#
#ffmpeg -i slides/minmax.png -i video_spiegotto/intermediates/lion_B_crop_sc_maxi.mp4 -filter_complex "[0:v][1:v] overlay=654.1:19" -pix_fmt yuv420p -c:a copy video_spiegotto/intermediates/lion_B_crop_sc_maxi_blank.mp4
#
#ffmpeg -i video_spiegotto/intermediates/lion_B_crop_sc_maxi_blank.mp4 -i video_spiegotto/intermediates/lion_A_crop_sc_mini.mp4 -filter_complex "[0:v][1:v] overlay=73:723" -pix_fmt yuv420p -c:a copy video_spiegotto/intermediates/lion_A_B_minmax_spiegotto.mp4
#
#ffmpeg -y -i ./slides/sys_coll_feat.mp4 \
#-i video_spiegotto/intermediates/lion_A_spiegotto.mp4  \
#-i video_spiegotto/intermediates/lion_A_B_minmax_spiegotto.mp4  \
#-f lavfi -i color=white:s=1920x1080 -filter_complex \
#"[0:v]format=pix_fmts=yuva420p,fade=t=out:st=10:d=1:alpha=1,setpts=PTS-STARTPTS[v0]; \
#[1:v]format=pix_fmts=yuva420p,fade=t=in:st=0:d=1:alpha=1,fade=t=out:st=56.5:d=1:alpha=1,setpts=PTS-STARTPTS+2.5/TB[v1]; \
#[2:v]format=pix_fmts=yuva420p,fade=t=in:st=0:d=1:alpha=1,fade=t=out:st=113:d=1:alpha=1,setpts=PTS-STARTPTS+56.5/TB[v2]; \
#[3:v]trim=duration=40[over]; \
#[over][v0]overlay[over1]; \
#[over1][v1]overlay[over2]; \
#[over2][v2]overlay=format=yuv420[outv]" \
#-vcodec libx264 -map [outv] video_spiegotto/spiegotto.mp4
##
#########################################   BUILDING UP 3 USERS VIDEO     ##############################
########################################################################################################
#rm -rf video_3/intermediates
#mkdir -p video_3/intermediates
#
#ffmpeg -i video_3/three4_A.mov -filter:v "crop=976:833:97.1:56.3" video_3/three4_A_crop.mp4
#ffmpeg -i video_3/three4_B.mov -filter:v "crop=976:833:97.1:56.3" video_3/three4_B_crop.mp4
#ffmpeg -i video_3/three4_C.mov -filter:v "crop=976:833:97.1:56.3" video_3/three4_C_crop.mp4
#
#ffmpeg -i video_3/three4_A_crop_trim.mp4 -vf scale=594:-1 video_3/three4_A_crop_trim_sz.mp4
#ffmpeg -i video_3/three4_B_crop_trim.mp4 -vf scale=594:-1 video_3/three4_B_crop_trim_sz.mp4
#ffmpeg -i video_3/three4_C_crop_trim.mp4 -vf scale=594:-1 video_3/three4_C_crop_trim_sz.mp4
#
#ffmpeg -i video_3/original/three4_A_crop_trim_sz.mp4  -an -filter:v "setpts=0.2*PTS" video_3/intermediates/three4_A_crop_trim_sz_su.mp4
#ffmpeg -i video_3/original/three4_B_crop_trim_sz.mp4  -an -filter:v "setpts=0.2*PTS" video_3/intermediates/three4_B_crop_trim_sz_su.mp4
#ffmpeg -i video_3/original/three4_C_crop_trim_sz.mp4 -an -filter:v "setpts=0.2*PTS" video_3/intermediates/three4_C_crop_trim_sz_su.mp4
#
#ffmpeg -i slides/3users.png -i video_3/intermediates/three4_B_crop_trim_sz_su.mp4 -filter_complex "[0:v][1:v] overlay=663.2:330.4" -pix_fmt yuv420p -c:a copy video_3/intermediates/3users_onlyB.mp4
##
#ffmpeg -i video_3/intermediates/3users_onlyB.mp4 -i video_3/intermediates/three4_A_crop_trim_sz_su.mp4 -filter_complex "[0:v][1:v] overlay=38:330.4" -pix_fmt yuv420p -c:a copy video_3/intermediates/3users_onlyAB.mp4
##
#ffmpeg -i video_3/intermediates/3users_onlyAB.mp4 -i video_3/intermediates/three4_C_crop_trim_sz_su.mp4 -filter_complex "[0:v][1:v] overlay=1288.4:330.4" -pix_fmt yuv420p -c:a copy video_3/3users.mp4
#
##
#ffmpeg -i video_3/3users.mp4  -an -filter:v "setpts=0.5*PTS" video_3/3users_su.mp4
#
##
#
##
##########################################   BUILDING UP USER STUDY     #################################
#########################################################################################################
#rm -rf video_userstudy/intermediates
#mkdir -p video_userstudy/intermediates
###
###ffmpeg -i video_userstudy/original/t2_1830_A_trimmed_right.mov -filter:v "crop=1435:847:0:48" video_userstudy/intermediates/t2_1830_A_right.mp4
###ffmpeg -i slides/blankfix.png -i video_userstudy/intermediates/t2_1830_A_right.mp4 -filter_complex "[0:v][1:v] overlay=4:0" -pix_fmt yuv420p -c:a copy video_userstudy/intermediates/t2_1830_A_right_fixed.mp4
###ffmpeg -i video_userstudy/original/t2_1830_A_trimmed_left.mov -filter:v "crop=1440:847:0:48" video_userstudy/intermediates/t2_1830_A_left.mp4
###
#ffmpeg -i video_userstudy/original/draw_5_B.mov -filter:v "crop=1440:847:0:48" video_userstudy/intermediates/draw_5_B_crop.mp4
#ffmpeg -i video_userstudy/intermediates/draw_5_B_crop.mp4  -an -filter:v "setpts=0.1*PTS" video_userstudy/intermediates/draw_5_B_crop_su.mp4
#
#ffmpeg -i video_userstudy/original/draw_5_A_crop.mov -an -filter:v "setpts=0.1*PTS" video_userstudy/intermediates/draw_5_A_crop_su.mp4
#
#ffmpeg -i video_userstudy/intermediates/draw_5_A_crop_su.mp4 -i video_userstudy/intermediates/draw_5_B_crop_su.mp4 -filter_complex hstack video_userstudy/intermediates/draw_5_AB.mp4
#
#ffmpeg -i video_userstudy/intermediates/draw_5_AB.mp4 -vf scale=1920:-1 video_userstudy/intermediates/draw_5_ABs.mp4
#
#ffmpeg -i slides/us.png -i video_userstudy/intermediates/draw_5_ABs.mp4 -filter_complex "[0:v][1:v] overlay=0:190" -pix_fmt yuv420p -c:a copy video_userstudy/us_AB_fin.mp4
##
###########################################    COMBINE ALL      ########################################
########################################################################################################
##
#
ffmpeg -y -i slides/title.mp4 \
-i video_results/2users_gab.mp4 \
-i video_3/3users_suGIUSTO.mp4 \
-i video_results/results.mp4 \
-f lavfi -i color=white:s=1920x1080 -filter_complex \
"[0:v]format=pix_fmts=yuva420p,fade=t=out:st=10:d=1:alpha=1,setpts=PTS-STARTPTS[v0]; \
[1:v]format=pix_fmts=yuva420p,fade=t=in:st=0:d=1:alpha=1,fade=t=out:st=32.5:d=1:alpha=1,setpts=PTS-STARTPTS+4.5/TB[v1]; \
[2:v]format=pix_fmts=yuva420p,fade=t=in:st=0:d=1:alpha=1,fade=t=out:st=62.5:d=1:alpha=1,setpts=PTS-STARTPTS+32.5/TB[v2]; \
[3:v]format=pix_fmts=yuva420p,fade=t=in:st=0:d=1:alpha=1,fade=t=out:st=145.5:d=1:alpha=1,setpts=PTS-STARTPTS+62.5/TB[v3]; \
[4:v]trim=duration=40[over]; \
[over][v0]overlay[over1]; \
[over1][v1]overlay[over2]; \
[over2][v2]overlay[over3]; \
[over3][v3]overlay=format=yuv420[outv]" \
-vcodec libx264 -map [outv] final_video_significative_intro.mp4


#ffmpeg -loop 1 -i slides/us.png -c:v libx264 -preset ultrafast -t 3 -pix_fmt yuv420p slides/us.mp4
##
#ffmpeg -i video_userstudy/original/photo3_40s.mp4 -vf scale=1920:-1 video_userstudy/original/photo3s_40s.mp4
#ffmpeg -i video_userstudy/original/photo4_40s.mp4 -vf scale=1920:-1 video_userstudy/original/photo4s_40s.mp4
#ffmpeg -i video_userstudy/original/drawing2_40s.mp4 -vf scale=1920:-1 video_userstudy/original/drawing2s_40s.mp4
#ffmpeg -i video_userstudy/original/drawing3_40s.mp4 -vf scale=1920:-1 video_userstudy/original/drawing3s_40s.mp4
##
##
#ffmpeg -i slides/drawing2.png -i video_userstudy/original/drawing2s_40s.mp4 -filter_complex "[0:v][1:v] overlay=0:256" -pix_fmt yuv420p -c:a copy video_userstudy/drawing2_40s_label.mp4
#ffmpeg -i slides/drawing3.png -i video_userstudy/original/drawing3s_40s.mp4 -filter_complex "[0:v][1:v] overlay=0:256" -pix_fmt yuv420p -c:a copy video_userstudy/drawing3_40s_label.mp4
##ffmpeg -i slides/drawing5.png -i video_userstudy/original/drawing5.mp4 -filter_complex "[0:v][1:v] overlay=0:256" -pix_fmt yuv420p -c:a copy video_userstudy/drawing5_label.mp4
#
#ffmpeg -i slides/photo3.png -i video_userstudy/original/photo3s_40s.mp4 -filter_complex "[0:v][1:v] overlay=0:256" -pix_fmt yuv420p -c:a copy video_userstudy/photo3_40s_label.mp4
#ffmpeg -i slides/photo4.png -i video_userstudy/original/photo4s_40s.mp4 -filter_complex "[0:v][1:v] overlay=0:256" -pix_fmt yuv420p -c:a copy video_userstudy/photo4_40s_label.mp4

#
#ffmpeg -i video_userstudy/drawing2_40s_label.mp4  -an -filter:v "setpts=0.5*PTS" video_userstudy/drawing2_40s_label_su.mp4
#ffmpeg -i video_userstudy/drawing3_40s_label.mp4  -an -filter:v "setpts=0.5*PTS" video_userstudy/drawing3_40s_label_su.mp4
#ffmpeg -i video_userstudy/photo3_40s_label.mp4  -an -filter:v "setpts=0.5*PTS" video_userstudy/photo3_40s_label_su.mp4
#ffmpeg -i video_userstudy/photo4_40s_label.mp4  -an -filter:v "setpts=0.5*PTS" video_userstudy/photo4_40s_label_su.mp4


##########################################    COMBINE ALL      ########################################
#######################################################################################################
#
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




ffmpeg -y -i final_video_significative_intro.mp4 \
-i video_userstudy/us_sequences_40sGIUSTO.mp4 \
-f lavfi -i color=white:s=1920x1080 -filter_complex \
"[0:v]format=pix_fmts=yuva420p,fade=t=out:st=144.5:d=1:alpha=1,setpts=PTS-STARTPTS[v0]; \
[1:v]format=pix_fmts=yuva420p,fade=t=in:st=0:d=1:alpha=1,fade=t=out:st=247.5:d=1:alpha=1,setpts=PTS-STARTPTS+144.5/TB[v1]; \
[2:v]trim=duration=40[over]; \
[over][v0]overlay[over1]; \
[over1][v1]overlay=format=yuv420[outv]" \
-vcodec libx264 -map [outv] finale_completo_40s_significative_intro.mp4




