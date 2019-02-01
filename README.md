# jvideon
Simple video generation from JSON 

A video is interpreted as a hierarchical structure of videos. Each video can be transformed according to ffmpeg defined operations, and may overlay a background (to create titles or description). Once all the videos in the leaves of the hierarchy are built, the upper level videos are generated. On the upper level, we may refer to any previously generated video, applying if needed other transformations. Thus each upper level video may refer to lower level videos. The root is the final video. Hierarchy is hand-defined in the json. 

## JSON ENTITIES

### SEQUENCE
The properties which the final video need. 

* Output path 
* The videos the sequence is composed of (indices referring to the array of videos)
* The transition effect 

### VIDEOS
The array of videos which needs to be generated.

Each video is composed by:

* Output path 
* Background path (if needed)
* An array of input videos paths
* Transformations to apply on each input video

