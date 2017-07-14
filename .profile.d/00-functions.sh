filename="$0"
function debug_filename () {
    if [[ "$samcv_debug" ]]; then echo "loading $filename" 1>&2; fi;
}
debug_filename
function parse_file () {
    if [[ -f "$1" ]]; then
        eval "$2" "$1"
    else
        if [[ "$samcv_debug" == 'true' ]]; then
            printf "Can't parse_file $1 $2" 1>&2
        fi
    fi
}
function add_array_to_path () {
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
cmd_exists () { command -v "$1" &> /dev/null; }
if cmd_exists kcachegrind; then
    kcachegrind () {
        echo kcachegrind "$@"
        command kcachegrind "$@" &> /dev/null &
    }
fi
function zsh-help () {
    function join { # Joins the arguments into a string delimited by $separator
        local separator=$1;
        local arr=$*;
        arr=${arr:${#separator}+1}; # < Line needed so result doesn't start with
        arr=${arr// /$separator};   # a separator.
        <<<$arr
    } 
    if [[ $# < 1 || $1 == "--help" ]]; then
        printf "Looks up things in the zsh documentation.\n"
        printf "Press 'n' to search forward 'N' to search backwards for the term.\n"
        printf "Usage: $0 [-a] search term(s)\n"
        printf "Option --all will seach for the term anywhere, not just at the start of a line.\n"
        return 1
    fi
    if [[ $1 == "test" && $# == 1 ]]; then
        man --pager="less -p'^CONDITIONAL EXPRESSIONS$'" zshall
        return
    elif [[ $1 == "--all" ]]; then
        shift
        local pattern=$(join '\s+' "$@")
    else
        local pattern="^\s*$(join '\s+' "$@")"
    fi
    man --pager="less -i -p '${pattern}'" zshall
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
function-grep () {
    local query="$1";
    local i='';
    for i in ${(ok)functions}; do;
        if [[  "${functions[$i]}" =~ ${query} && "${i}" != _* ]]; then
            printf "%s\n" "${i}";
        fi; 
    done;
}