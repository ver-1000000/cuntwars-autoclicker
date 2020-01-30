#!/bin/bash

IFS="
"

SCREEN=screen.png

function CvtPNG() {
  png2pat "battle.png" > "battle.pat"
  png2pat "auto.png" > "auto.pat"
  png2pat "lose.png" > "lose.pat"
  png2pat "win.png" > "win.pat"
}
CvtPNG

function GetSCREEN() {
  import -silent -window root -crop 1600x900-0x0 ${SCREEN}
}

function DetectPos() {
  while [ -z "$Pos" ]
  do
    GetSCREEN
    Pos=`visgrep "${SCREEN}" "${1}"`
    if [ -n "${Pos}" ]; then break;
    elif [ -n "${2}" ]; then Pos=`visgrep -t 80000 "${SCREEN}" "${2}"`; fi
    if [ -n "${Pos}" ]; then break; fi
    echo Not find. [${1} ${2}]
    sleep 1
  done
}

function Click() {
  Pos1=`echo ${Pos}|awk 'NR==1{ print $1 }'`
  PosX=`expr \`echo ${Pos1}|awk -F',' '{ print $1 }'\` + 20`
  PosY=`expr \`echo ${Pos1}|awk -F',' '{ print $2 }'\` + 20`
  Pos=
  xte "mousemove ${PosX} ${PosY}"
  xte "mouseclick 1"
  echo Clicked. x: ${PosX}, y: ${PosY}
}

PointClick() {
  xte "mousemove ${1} ${2}"
  xte "mouseclick 1"
}

# while :
# do
#   # バトル
#   DetectPos battle.pat
#   Click
#   sleep 4
# 
#   # オート
#   DetectPos auto.pat
#   Click
#   sleep 25
# 
#   # 敗北 or 勝利
#   DetectPos lose.pat win.pat lose.pat
#   Click
#   sleep 2
# done

while :
do
  GetSCREEN
  if [ -n "`visgrep ${SCREEN} auto.pat`" ]; then PointClick 1320 750;
  elif [ -n "`visgrep ${SCREEN} battle.pat`" ]; then PointClick 800 600; 
  else PointClick 1320 600; fi
  sleep 1
done
