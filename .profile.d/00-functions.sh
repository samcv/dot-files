filename="$0"
function debug_filename {
    if [[ "$samcv_debug" ]]; then echo "loading $filename" 1>&2; fi;
}
debug_filename
function parse_file {
    if [[ -f "$1" ]]; then
        eval "$2" "$1"
    else
        if [[ "$samcv_debug" == 'true' ]]; then
            printf "Can't parse_file $1 $2" 1>&2
        fi
    fi
}
function add_array_to_path {
    local array_name="$1"
    local i=''
    for i in ${(P)${array_name}}; do
        if [[ -e "$i" ]]; then
            if [[ "$samcv_debug" && "$PATH" =~ "$i" ]];   then
                echo "You're trying to add $i to the path again!" 1>&2
            fi
            PATH="$i:$PATH"
        elif [[ "$samcv_debug" ]]; then
            echo "Can't find $i in file $filename" 1>&2
        fi
    done
    #echo "first array element is: " ${(P)${array_name}[1]} 1>&2
}
function set-cap-sys-admin {
    function usage {
        printf "Usage: %s command-name\nSets cap_sys_admin+ep on the program by resolving the path if it's a program\nor setting it if given a path\n" "$0"
    }
    if [[ ! "$1" ]]; then; usage; return 1; fi;
    if [[ -f "$1"  && "$1" = */* ]]; then
        local path="$1";
    else
        local path="$(command -v $1)";
        if [[ ! "${path}" ]]; then usage; return 1; fi
    fi
    echo $path
    command /usr/bin/sudo setcap cap_sys_admin+ep "${path}"
}
function cmd_exists { command -v "$1" &> /dev/null; }
if cmd_exists kcachegrind; then
    kcachegrind () {
        echo kcachegrind "$@"
        command kcachegrind "$@" &> /dev/null &
    }
fi
function zsh-help {
    function join { # Joins the arguments into a string delimited by $separator
        local separator=$1;
        local arr=$*;
        arr=${arr:${#separator}+1}; # < Line needed so result doesn't start with
        arr=${arr// /$separator};   # a separator.
        <<<$arr
    }
    local case='-i'
    local section='zshall'
    local debug=''
    local pattern=''
    if [[ $# < 1 || $1 == "--help" ]]; then
        printf "Looks up things in the zsh documentation.\n"
        printf "Press 'n' to search forward 'N' to search backwards for the term.\n"
        printf "Usage: $0 [-a] search term(s)\n"
        printf "Option --all will seach for the term anywhere, not just at the start of a line.\n"
        return 1
    fi
    if [[ $1 == '--zsh-help-debug' ]]; then
        debug=1
        shift
    fi
    if [[ $1 == "test" && $# == 1 ]]; then
        case=''
        pattern='^CONDITIONAL EXPRESSIONS$'
    elif [[ ($1 == "-eq" || $1 == "-ne" || $1 == "-lt" || $1 == "-gt" || $1 == "-le" || $1 == "-ge") && $# == 1 ]]; then
        case=''
        pattern="^\s*exp1\s+${1}\s+exp2"
    elif [[ $1 == "--all" ]]; then
        shift
        pattern=$(join '\s+' "$@")
    fi
    # Check ZSHBUILTINS first. If not found there, we will search ZSHALL
    if [[ $pattern == "" ]]; then
        section=ZSHBUILTINS
        pattern="^\s*${1}"
        if man --pager="less ${case} -p '${pattern}'" "${section}" > /dev/null 2>&1; then
            true
        else
            local section='zshall'
            pattern="^\s*$(join '\s+' "$@")"
        fi
    fi
    if [[ ${debug} ]] && setopt VERBOSE
    man --pager="less ${case} -p '${pattern}'" "${section}"
}
function too-many-files {
    function get-most-file-descriptors-open {
        local lines_to_get="${1:-10}";
        lsof -P +c 0 -n -w  | awk '{ print $2; }' | uniq -c | sort -rn | head -n $lines_to_get;
    }
    local i=''
    local gotten=$(get-most-file-descriptors-open "${1:-10}")
    printf "OPEN\tPID\tUSER\tARGS\n";
    if [[ $ZSH_VERSION ]]; then
        local vary=( ${(f)gotten} )
    else
        local vary="$gotten"
    fi
    for i in $vary; do
        local num_open=$(sed -re 's/^ *([0-9]+)\s+.*$/\1/' <<<$i); 
        local pid="$(sed -re 's/^\s*([0-9]+)\s+([0-9]+)\s*/\2/' <<<$i)";
        if local this_part="$(ps -q $pid -o pid= -o user= -o args=)"; then
            printf "%s\t%s\n" "${num_open}" "${this_part}"
        else
            printf "ps error for pid $pid num_open $num_open"
        fi
        
    done
}
function function-grep {
    local query="$1";
    local i='';
    local v='';
    if [[ "${1}" == '-v' ]]; then v="1"; shift; fi;
    for i in ${(ok)functions}; do;
        if [[  "${functions[$i]}" =~ ${query} && "${i}" != _* ]]; then
            if [[ "${v}" ]]; then printf "%s\t%s\n\n" "${i}" "${functions[$i]}";
            else
                printf "%s\n" "${i}";
            fi
        fi; 
    done;
}
function define {
	
	# espeak for the pronunciation audible output and phonetic alphabet string
	if [[ "$1" == '-p' ]]; then
		shift
		echo "Phoneme mnemonics: $(espeak -ven-uk-rp -x -s 120 "$1" 2> /dev/null)"
	fi
	# dict - the client for the dictionary server
	dict "$1" | less
}
