old_extension=$1
new_extension=$2

for i in *."$old_extension";
  do ffmpeg -i "$i" "${i%.*}.$new_extension";
done
