# Make the compose key work globally in GTK and QT programs since not all programs
# (especially GTK ones) follow the Xorg standards by default

export GTK_IM_MODULE='xim'
export QT_IM_MODULE='xim'
