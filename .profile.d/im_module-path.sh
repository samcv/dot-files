
if [[ "$BASH" ]]; then
    filename="$0"
else
    local filename="$0"
fi
debug_filename
if [[ "$BASH" ]]; then
    input_module=ibus
else
    local input_module=ibus
fi
#local input_module=xim
#local input_module=none
export GTK_IM_MODULE=$input_module
export XMODIFIERS=@im=$input_module
export QT_IM_MODULE=$input_module