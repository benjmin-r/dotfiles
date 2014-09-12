#!/bin/bash

version=1.0.1
versionDate="2014-02-14"

function showHelp() {
echo "watchfile - monitor file(s)/command and perform action when changed

Possible ways of usage
----------------------------------------
Monitor FILE, when modified execute FILE
\$ watchfile [options] FILE

Monitor FILE, when modified execute CMND [PARAM_1 ..PARAM_N]
\$ watchfile [options] FILE CMND [PARAM_1 .. PARAM_N]

Monitor FILE_1 .. FILE_N, when modified execute CMND [PARAM_1 ..PARAM_N]
\$ watchfile [options] -i FILE_1 .. FILE_N -e CMND [PARAM_1 .. PARAM_N]

Monitor output of CMND1, when modified execute CMND2 [PARAM_1 .. PARAM_N]
\$ watchfile [options] -s \"CMND1\" -e CMND [PARAM_1 .. PARAM_N]


options:
-h, --help       Show help
-d, --delay=N    Specify the delay between each monitor update. Default 0.5.
--check-content  If set it checks file content, instead of just the timestamp.
                 Has no effect with the -s flag set.
--no-clear       If set, it doesn't clear the screen before executing CMND.
-v, --version    Outputs version information

flags:
-s,    Next argument specifies monitor command. Requires -e flag.
-i,    Start listing files to monitor. Requires -e flag.
-e,    Start listing command to execute. Requires -s or -i or flag.
       Must be the last flag used (CMND can thus use flags as parameters)

Note: If CMND isn't found, and ./CMND is, it automatically uses this command.
Note: If the command uses ampersands (&, &&), these must be escaped (\&, \&\&).


Examples
----------------------------------------
Monitor executable foo.sh, and execute on change
$ watchfile foo.sh

Monitor python file foo.py, and execute it on change
$ watchfile foo.py python foo.py

As above, but monitor content (not just timestamp):
$ watchfile --check-content foo.py python foo.py

Compiling main.cpp file on change:
$ watchfile main.cpp g++ -Wall main.cpp -o main

Compiling main.cpp file on change, running when compilation succeedes:
$ watchfile main.cpp g++ -Wall main.cpp -o main \&\& ./main

Compiling project whenever source files changes, and running if it succeedes:
$ watchfile -s \"find . -name '*.cpp' -or -name '*.h' | xargs cat\" \\
            -e make \&\& ./main

See: http://swarminglogic.com/jotting/2014_02_watchfile for more examples

Mainted at: https://gist.github.com/swarminglogic/8963507
Author:     Roald Fernandez (github@swarminglogic.com)
Version:    $version ($versionDate)
License:    CC-zero (public domain)
"
    exit $1
}

function parseParameters() {
    tmp=$@
    leftovers=""
    while test $# -gt 0; do
        case "$1" in
            -h|--help)
                showHelp 0
                ;;
            --no-clear)
                shift
                flagNoClear=true
                ;;
            --check-content)
                shift
                flagCheckContent=true
                ;;
            -d)
                shift
                delay=$1
                shift
                ;;
            --delay*)
                delay=`echo $1 | sed -e 's/^[^=]*=//g'`
                shift
                ;;
            -v|--version)
                shift
                echo "watchfile $version"
                exit 0
                ;;
            -s)
                shift
                flagS=true
                watchcmnd=$1
                shift
                ;;
            -i)
                shift
                flagI=true
                nI=0
                for i in `seq 1 $#`; do
                    if [[ ${!i} == -* ]] ; then
                        break;
                    else
                        ((++nI))
                    fi
                done
                watchfiles=${@:1:$nI}
                shift $nI
                ;;
            -e)
                shift
                flagE=true
                execcmnd=${@:1}
                break
                ;;
            -*)
                leftovers="$leftovers "$1
                shift
                ;;
            *)
                leftovers="$leftovers "$1
                shift
                ;;
        esac
    done
    if [[ $flagE && (! $flagS) && (! $flagI) ]] ; then
        echo "Error: If -e flag is set, -s or -i flags are required."
        exit 1
    elif [[ ($flagS || $flagI) && ! $flagE ]] ; then
        echo "Error: If -s or -i flags are set, the -e flags is required."
        exit 1
    elif [[ $flagS && $flagI ]]; then
        echo "Error: Both -s and -i flags cannot be used simultaneously."
        exit 1
    elif [[ (! $flagE) && (! $flagS) && (! $flagI) ]] ; then
        set -- $leftovers
        watchfiles=$1
        if [ $# -gt 1 ]; then
            execcmnd=${@:2}
        else
            execcmnd=$watchfiles
        fi
    fi
}

# Exit with help if no parameters
if [[ ! $@ ]] ; then showHelp 1; fi

# Defaults
delay=0.5

# Parse parameters into $watch and $execcmnd variables
parseParameters "$@"

# Sanitize executable
set -- $execcmnd
if [[ ! `which $1` ]] && [[ -x ./$1 ]] ; then
    execcmnd=./$execcmnd
elif [[ ! `which $1` ]] && [[ ! -x ./$1 ]] ; then
    echo "Error: No executable $1 or ./$1 found"
    exit 1
fi

# Main monitoring loop.
if [[ -z $watchcmnd ]] ; then
    if [[ ! $flagCheckContent ]] ; then
        watchcmnd="stat -c %Y $watchfiles | md5sum"
    else
        watchcmnd="cat $watchfiles | md5sum"
    fi
else
    watchcmnd="$watchcmnd | md5sum"
fi

md5sum=`eval $watchcmnd`
md5sumNow=$md5sum
while [[ true ]]
do
    # Loop until some files have changed
    while [[ "$md5sumNow" = "$md5sum" ]]
    do
        sleep $delay
        md5sumNow=`eval $watchcmnd`
    done

    # Execute the file, as it has changed.
    if [[ ! $flagNoClear ]] ; then
        clear
    fi
    eval $execcmnd

    md5sum=$md5sumNow
done
