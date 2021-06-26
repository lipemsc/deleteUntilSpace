#!/bin/bash

getPercent () {
        return $(df --output=pcent /dev/sda2 | tail -n 1 | cut -d% -f1)
}

deleteFile () {
        folder="/var/lib/motion/"
        getPercent
        percent=$?
        if [ $percent -gt 98 ] ; then
                fileToDelete=$(ls $folder | head -n 1)
                tput el
                echo "Removing $folder$fileToDelete"
                rm $folder$fileToDelete
                tput cuu1
                deleteFile
        else
                tput el
                echo Done
        fi


}

deleteFile
