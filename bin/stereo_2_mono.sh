for i in *."mp3";
  do ffmpeg -i "$i" -ac 1 "${i%.*}-mono.mp3";
done
