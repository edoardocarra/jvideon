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

### VIDEO
The videos included into the final one. We can specify multiple paths for a VIDEO element. This means that the VIDEO is the composition of multiple videos. Each VIDEO is composed of: 

* A unique id 
* A name
* path list to videos `["video_0.mp4","video_1.mp4"]`
* FILTER id list for every video `[[filters for video_0.mp4], [filters for video_1.mp4]]`

### FILTER
Transformations applied to the video. Each FILTER is composed of: 

* A unique id 
* A name
* Operation id 
* Operations parameters

---

#### TODO: 
* audio
