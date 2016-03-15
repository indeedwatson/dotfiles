#!/bin/bash
# All options are here: http://www.imagemagick.org/Usage/blur/#blur_args
#BLURTYPE="0x5"
#BLURTYPE="0x2"
#BLURTYPE="5x3"
#BLURTYPE="2x8"
#BLURTYPE="2x3"

DISPLAY_RE="([0-9]+)x([0-9]+)\\+([0-9]+)\\+([0-9]+)"
IMAGE_RE="([0-9]+)x([0-9]+)"
FOLDER=`dirname "$BASH_SOURCE"`
LOCK="$HOME/Pictures/icons/Lock-icon.png"
#TEXT="$HOME/Pictures/icons/Lock-icon.png"
PARAMS=""
OUTPUT_IMAGE="/tmp/i3lock.png"

#Take screenshot:
scrot $OUTPUT_IMAGE

#Get dimensions of the lock image:
LOCK_IMAGE_INFO=`identify $LOCK`
[[ $LOCK_IMAGE_INFO =~ $IMAGE_RE ]]
IMAGE_WIDTH=${BASH_REMATCH[1]}
IMAGE_HEIGHT=${BASH_REMATCH[2]}

#Get dimensions of the text image:
#TEXT_IMAGE_INFO=`identify $TEXT`
#[[ $TEXT_IMAGE_INFO =~ $IMAGE_RE ]]
#TEXT_WIDTH=${BASH_REMATCH[1]}
#TEXT_HEIGHT=${BASH_REMATCH[2]}

#Execute xrandr to get information about the monitors:
while read LINE
do
  #If we are reading the line that contains the position information:
  if [[ $LINE =~ $DISPLAY_RE ]]; then
    #Extract information and append some parameters to the ones that will be given to ImageMagick:
    WIDTH=${BASH_REMATCH[1]}
    HEIGHT=${BASH_REMATCH[2]}
    X=${BASH_REMATCH[3]}
    Y=${BASH_REMATCH[4]}
    POS_X=$(($X+$WIDTH/2-$IMAGE_WIDTH/2))
    POS_Y=$(($Y+$HEIGHT/2-$IMAGE_HEIGHT/2))
    #TEXT_X=$(($X+$WIDTH/2-$TEXT_WIDTH/2))
    #TEXT_Y=$(($Y+$HEIGHT/2-$TEXT_HEIGHT/2+200))

    PARAMS="$PARAMS '$LOCK' '-geometry' '+$POS_X+$POS_Y' '-composite'"
  fi
done <<<"`xrandr`"

#Execute ImageMagick:
PARAMS="'$OUTPUT_IMAGE' '-level' '0%,100%,0.6' '-scale 10%' $PARAMS '$OUTPUT_IMAGE'"
eval mogrify $PARAMS

#Lock the screen:
i3lock -i $OUTPUT_IMAGE -u

#Remove the generated image:
rm $OUTPUT_IMAGE
