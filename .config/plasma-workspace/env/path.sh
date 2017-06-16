source "$HOME/.functions.sh"
source "$HOME/.profile.d/im_module-path.sh"
if [[ "$QT_IM_MODULE" != "ibus" ]]; then
    KDESOURCEFAIL=1
    export KDESOURCEFAIL
fi
