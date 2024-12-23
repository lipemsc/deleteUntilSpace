#!/bin/bash

getPercent () {
        return $(df --output=pcent $1 | tail -n 1 | cut -d% -f1)
}

deleteFile () {
        folder=$2
	getPercent $1
        percent=$?
        if [ $percent -gt 98 ] ; then
                fileToDelete=$(ls $folder | head -n 1)
                # tput el
                echo "Removing $folder$fileToDelete"
                rm $folder$fileToDelete
                # tput cuu1
                deleteFile $1 $2
        else
                #tput el
                echo Done
        fi


}

deleteFile $1 $2
