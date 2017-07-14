local filename="$0"
debug_filename
alias useflags='echo /etc/portage/package.use/00-sabayon.package.use'
alias emerge-update='sudo layman -S && sudo emerge --sync && sudo emerge -avuN $(equo query revisions 9999 -q) && sudo equo rescue spmsync --ask'
alias equo-sync='sudo equo rescue spmsync --ask'
alias equo-update='sudo equo update && sudo equo upgrade --ask'