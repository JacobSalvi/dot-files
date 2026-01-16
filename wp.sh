#!/bin/sh

DATE=`date +'%d_%m_%y'`

RANDOM_BLOCK=$((RANDOM % 2))

FOLDER=/home/jacob/Wallpaper
IMAGE="$FOLDER/$DATE.jpg"

if [ -f $IMAGE ]; then
  swaybg -m fit -i $IMAGE &
  exit 0
fi


if [ $RANDOM_BLOCK -eq 0 ]; then
  URL=`curl -s -X GET 'https://api.waifu.im/search?height=>=2000&is_nsfw=false' -H 'Content-Type: application/json' | awk -F '\"url\":\"' '{print $2}' | awk -F '\"' '{print $1}'`
  echo $URL
  curl $URL --output $FOLDER/$DATE.jpg
  IMAGE="$FOLDER/$DATE.jpg"
else
  URL_NEKO=`curl -s -X GET https://nekos.moe/api/v1/random/image\?nsfw=false | awk -F '\"id\":\"' '{print $2}' | awk -F '\"' '{print $1}'`
  echo $URL
  curl https://nekos.moe/image/$URL_NEKO.jpg --output $FOLDER/$DATE.jpg
  IMAGE="$FOLDER/$DATE.jpg"
fi

swaybg -m fit -i $IMAGE &

