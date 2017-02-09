#!/bin/sh
set -e

RESOURCES_TO_COPY=${PODS_ROOT}/resources-to-copy-${TARGETNAME}.txt
> "$RESOURCES_TO_COPY"  

function ergodic(){  
    for file in ` ls $1 `  
      do  
        if [ -d $1"/"$file ]  
            then  
                ergodic $1"/"$file  
            else  
                if [ "${file##*.}" = "json" ]; then
                fullpath=$1"/"$file
                echo json: $fullpath
                install_resource $fullpath
                fi   
        fi  
      done  
}  

install_resource()
{
  case $1 in
    /*)
      echo "install Json: $1"
      echo "$1" >> "$RESOURCES_TO_COPY"
      ;;
    *)
      echo "${PODS_ROOT}/$1"
      echo "${PODS_ROOT}/$1" >> "$RESOURCES_TO_COPY"
      ;;
  esac
}

if [[ "$CONFIGURATION" == "Debug" ]]; then
    Mock_Folder="${SRCROOT}/{{args.ProductName}}/Network/Mock"
    ergodic $Mock_Folder
fi

mkdir -p "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
rsync -avr --copy-links --no-relative --exclude '*/.svn/*' --files-from="$RESOURCES_TO_COPY" / "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
if [[ "${ACTION}" == "install" ]]; then
  mkdir -p "${INSTALL_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
  rsync -avr --copy-links --no-relative --exclude '*/.svn/*' --files-from="$RESOURCES_TO_COPY" / "${INSTALL_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
fi
rm -f "$RESOURCES_TO_COPY"
