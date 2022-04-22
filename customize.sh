
SKIPUNZIP=0
ASH_STANDALONE=1
key_source(){
if [[ -e "$1" ]];then
	source "$1"
	rm -rf "$1"
	fi
}
key_source $MODPATH/key.sh
key_source $MODPATH/myrun_android11.sh
key_source $MODPATH/myrun_android12.sh
ui_print "In the future,"
ui_print "if add new app please reinstall this module."
set_perm_recursive $MODPATH 0 0 0755 0644



