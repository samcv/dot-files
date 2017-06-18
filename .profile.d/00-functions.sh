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
    local array_name=$1
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
cmd_exists () { command -v $1 2>/dev/null ; }
function zsh-help () {
    #This function used to call the "bash" builtin.
    #bash -c "help $@"

    #Better way: look it up in the man pages. I often look up "test" which doesn't give a usefull result,
    #so I added that as a special case.
    if [[ $1 == "test" ]]; then
        man --pager="less -p'^CONDITIONAL EXPRESSIONS$'" zshall
    else
        man --pager="less -p'^ *$@ '" zshall
    fi
}