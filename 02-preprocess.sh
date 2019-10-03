# Concatenate
sox crying/**/*.wav tmp/batch-crying.wav

# Split
ffmpeg -i tmp/batch-crying.wav -f segment -segment_time 10.1 -c
FILES=tmp/crying*.wav
for f in $FILES
do
  # Trim to exactly 10s, boost 45 dB, resample to 22050
  b=$(basename $f)
  sox $f data/crying/$b vol 45 dB trim 0 10 rate 22050
done
rm data/crying/$(ls -t data/crying | head -n1)
