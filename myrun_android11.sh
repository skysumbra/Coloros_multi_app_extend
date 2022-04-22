#export PATH="/product/bin:/apex/com.android.runtime/bin:/apex/com.android.art/bin:/system_ext/bin:/system/bin:/system/xbin:/odm/bin:/vendor/bin:/vendor/xbin:"

if [ -f "/system_ext/oppo/sys_multi_app_config.xml" ] ; then
	mkdir -p $MODPATH/system/system_ext/oppo
	cp /system_ext/oppo/sys_multi_app_config.xml $MODPATH/system/system_ext/oppo/sys_multi_app_config.xml
	sed -i 's/<maxNum name=\"2\" \/>/<maxNum name=\"1000\" \/>/' $MODPATH/system/system_ext/oppo/sys_multi_app_config.xml
	sed -i '/<allowed>/,/<\/allowed>/{//!d}' $MODPATH/system/system_ext/oppo/sys_multi_app_config.xml
	sed -i '/<\/allowed>/i\    <allowed>' $MODPATH/system/system_ext/oppo/sys_multi_app_config.xml
	for item in `pm list packages -3`
	do
		app=${item:8}
		sed -i '/<\/allowed>/i\        <item name=\"'"$app"'\" \/>' $MODPATH/system/system_ext/oppo/sys_multi_app_config.xml
	done
	ui_print "Please reboot system."
fi



