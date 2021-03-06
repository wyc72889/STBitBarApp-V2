#!/bin/bash
# Version 2.32
if [ $# -gt 0 ]
  then
  	if [ $1 = "request" ]
  	then
  		curl -s $2 -H "Authorization: Bearer "$3
  		exit
    elif [ $1 = "open" ]
    then
        open $2 $3 $4 $5
        exit
    elif [ $1 = "github_ST_Python_Logic" ]
    then
        osascript -e 'display notification "Downloading the ST_Python_Logic.py from KurtSanders STBitBarApp GitHub Repo " with title "ST BitBar App Notice" sound name "Frog" '
        temp_file=$(mktemp)
        curl -LkSs https://github.com/KurtSanders/STBitBarApp-V2/archive/master.zip -o "$temp_file"
        unzip -qq -j -o -d ~/Downloads/ "$temp_file" 'STBitBarApp-V2-master/BitBar Plugin/ST/ST_Python_Logic.py'
        rm "$temp_file"
        chmod +x ST_Python_Logic.py
        #        curl -s -H 'Cache-Control: no-cache' --output ~/Downloads/ST_Python_Logic.py --URL https://raw.githubusercontent.com/kurtsanders/STBitBarApp/master/BitBar%20Plugin/ST/ST_Python_Logic.py
        open ~/Downloads/
        sleep 5
        osascript -e 'display notification "Move the new ST_Python_Logic.py located in your Downloads Directory." with title "ST BitBar App Notice" sound name "Frog" '
        sleep 2
        osascript -e 'display notification "into the same folder in your BitBar Plugins Subdirectory" with title "ST BitBar App Notice" sound name "Frog" '
        exit
    elif [ $1 = "github_ST5MSH" ]
    then
        osascript -e 'display notification "Downloading the ST.5m.sh from KurtSanders STBitBarApp GitHub Repo " with title "ST BitBar App Notice" sound name "Frog" '
#        curl -s -H 'Cache-Control: no-cache' --output ~/Downloads/ST.5m.sh --URL https://raw.githubusercontent.com/kurtsanders/STBitBarApp/master/BitBar%20Plugin/ST/ST.5m.sh
        temp_file=$(mktemp)
        curl -LkSs https://github.com/KurtSanders/STBitBarApp-V2/archive/master.zip -o "$temp_file"
        unzip -qq -j -o -d ~/Downloads/ "$temp_file" 'STBitBarApp-V2-master/BitBar Plugin/ST.5m.sh'
        rm "$temp_file"
        chmod +x ST.5m.sh
        open ~/Downloads/
        sleep 5
        osascript -e 'display notification "Move the new ST.5m.sh located in your Downloads Directory" with title "ST BitBar App Notice" sound name "Frog" '
        sleep 2
        osascript -e 'display notification "into the same folder in your BitBar Plugins Subdirectory" with title "ST BitBar App Notice" sound name "Frog" '
        exit
	fi
fi
python `dirname $0`/ST/ST_Python_Logic.py $0