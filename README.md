# jvideon
Simple video generation from JSON 

## JSON ENTITIES

### BKG 
The entities the video is composed of. Each BKG is composed of:

* A unique id 
* A name
* Path to image (user made. This will define background color, writes, images, and all which is static for a given frame).

### SUBSEQ 
A subsequence of the final video. The final video is the composition of many SUBSEQ. The duration of the video is the sum of the durations of all the SUBSEQ. If a SUBSEQ does not reference to a video (only to a BKG), its duration is the one specified by the user. Otherwise the duration is the one of the longest video between those referenced by the SUBSEQ. Each SUBSEQ is composed of:

* A unique id 
* A name
* BKG id 
* duration (hh:mm:ss)
* VIDEO ids
