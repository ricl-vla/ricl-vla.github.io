# Ensure you replace TIME in the '-t ${TIME}' option
# with the exact duration (in seconds) of your longest single video,

TIME=11.16

ffmpeg \
-stream_loop -1 -i static/videos_cropped_reencoded/pokeball_ricl.mp4 \
-stream_loop -1 -i static/videos_cropped_reencoded/sink-idli-plate_ricl.mp4 \
-stream_loop -1 -i static/videos_cropped_reencoded/sink-squeegee_ricl.mp4 \
-stream_loop -1 -i static/videos_cropped_reencoded/plate_ricl_idli.mp4 \
-stream_loop -1 -i static/videos_cropped_reencoded/squeegee_ricl.mp4 \
-stream_loop -1 -i static/videos_cropped_reencoded/lever_ricl.mp4 \
-stream_loop -1 -i static/videos_cropped_reencoded/door_ricl.mp4 \
-stream_loop -1 -i static/videos_cropped_reencoded/bagel_ricl.mp4 \
-filter_complex " \
[0:v]scale=480:540,setpts=PTS-STARTPTS[v0]; \
[1:v]scale=480:540,setpts=PTS-STARTPTS[v1]; \
[2:v]scale=480:540,setpts=PTS-STARTPTS[v2]; \
[3:v]scale=480:540,setpts=PTS-STARTPTS[v3]; \
[4:v]scale=480:540,setpts=PTS-STARTPTS[v4]; \
[5:v]scale=480:540,setpts=PTS-STARTPTS[v5]; \
[6:v]scale=480:540,setpts=PTS-STARTPTS[v6]; \
[7:v]scale=480:540,setpts=PTS-STARTPTS[v7]; \
[v0][v1][v2][v3][v4][v5][v6][v7]xstack=inputs=8:layout=0_0|w0_0|w0+w1_0|w0+w1+w2_0|0_h0|w0_h0|w0+w1_h0|w0+w1+w2_h0[out] \
" \
-map "[out]" \
-t ${TIME} \
video_grid/output_2x4_grid.mp4