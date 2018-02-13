# jvideon
Simple video generation from JSON 

## JSON ENTITIES

### BACKGROUND 
The entities the video is composed of. Each BACKGROUND is composed of:

* A unique id 
* A name
* Path to image (user made. This will define background color, writes, images, and all which is static for a given frame).

### SUBSEQUENCE
A subsequence of the final video. The final video is the composition of many SUBSEQUENCEs. The duration of the video is the sum of the durations of all the SUBSEQUENCEs. If a SUBSEQUENCE does not reference to a video (hence only to a BACKGROUND), its duration is the one specified by the user. Otherwise the duration is the one of the longest video between those referenced by the SUBSEQUENCE. Each SUBSEQUENCE is composed of:

* A unique id 
* A name
* BACKGROUND id 
* duration
* COMPOSITE id

### COMPOSITE
A single COMPOSITE defines the layout for a single VIDEO, like position, or the layout for a compositions of multiple videos. This enhances side-by-side, crossfading, being independent from the BACKGROUND of the SUBSEQUENCE. 

### VIDEO
A single video included into the final one. Each VIDEO is composed of: 

* A unique id 
* A name
* path to video
* FILTER list for video

### FILTER
Transformations applied to the video. Each FILTER is composed of: 

* A unique id 
* A name
* Operation id 
* Operations parameters

---

#### TODO: 
* audio
