echo "Movie Concatentation"
if [ "$#" -ne 3 ]; then
	echo "ERROR: incorrect number of parameters are passed"
	exit 1
fi
echo "Going to concatenate the files: "$1" + "$2" =>>"$3


ffmpeg -i $1 -c copy -bsf:v h264_mp4toannexb -f mpegts 1.ts
ffmpeg -i $1 -c copy -bsf:v h264_mp4toannexb -f mpegts 2.ts

ffmpeg -f mpegts -i "concat:1.ts|2.ts|" -c copy -bsf:a aac_adtstoasc $3
rm 1.ts
rm 2.ts
