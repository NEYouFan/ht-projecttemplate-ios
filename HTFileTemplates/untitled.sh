#!/usr/bin/env bash

arg1 = ""
arg2 = ""
arg3 = ""
arg4 = ""

while getopts "H:U:P:N:" arg #选项后面的冒号表示该选项需要参数
do
        case $arg in
             H)
                arg1=$OPTARG
                ;;
             U)
                arg2=$OPTARG
                ;;
             P)
                arg3=$OPTARG
                ;;
             N)
                arg4=$OPTARG
                ;;
             ?)  #当有不认识的选项的时候arg为?
            echo "含有未知参数"
        exit 1
        ;;
        esac
done

echo -e "$*"


mkdir temp

cd temp

git clone ssh://git@g.hz.netease.com:22222/HeartTouchOpen/HTTemplate.git 

cd ..

sleep(1)

rm -rf temp

	
