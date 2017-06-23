input_module=ibus
export GTK_IM_MODULE=$input_module
export XMODIFIERS=@im=$input_module
export QT_IM_MODULE=$input_module
source "$HOME/.profile.d/profile.sh"
if [[ "$QT_IM_MODULE" != "ibus" || ! "$_PROFILE_SH_LOADED" ]]; then
    KDESOURCEFAIL=1
    export KDESOURCEFAIL
fi