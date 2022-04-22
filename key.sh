author="`grep_prop author $TMPDIR/module.prop`"
name="`grep_prop name $TMPDIR/module.prop`"
description="`grep_prop description $TMPDIR/module.prop`"
id="`grep_prop id $TMPDIR/module.prop`"

function get_magisk_lite(){
local until_function=/data/adb/magisk/util_functions.sh
grep -q lite_modules $until_function && echo "－ 當前為: Magisk lite" || echo "－ 當前為: Magisk official" 
}

function hello_master(){
if test -n "$(getprop persist.sys.device_name)" ;then
	echo ""
	echo "~~您好！"$(getprop persist.sys.device_name)"！~~"
	get_magisk_lite
	echo ""
elif test -n "$(pm list users | cut -d : -f2 )" ;then
	echo ""
	echo "~~您好！" $(pm list users | cut -d : -f2 )！"！~~"
	get_magisk_lite
	echo ""
fi
}


echo ""
echo "∞————————————————————————∞"
hello_master
echo "－品牌: `getprop ro.product.brand`"
echo "－代號: `getprop ro.product.device`"
echo "－型號: `getprop ro.product.model`"
echo "－Android OS: `getprop ro.build.version.release`"
test "`getprop ro.miui.ui.version.name`" != "" && echo "－MIUI1版本: MIUI`getprop ro.miui.ui.version.name` - `getprop ro.build.version.incremental` "
test "`getprop ro.product.brand.ui`" != "" && echo "－UI版本:`getprop ro.product.brand.ui`:`getprop ro.build.display.id` - `getprop ro.build.version.incremental`"
#echo "－內核版本: `uname -a `"
#echo "－运存大小: `free -m|grep "Mem"|awk '{print $2}'`MB  已用:`free -m|grep "Mem"|awk '{print $3}'`MB  剩余:$((`free -m|grep "Mem"|awk '{print $2}'`-`free -m|grep "Mem"|awk '{print $3}'`))MB"
#echo "－Swap大小: `free -m|grep "Swap"|awk '{print $2}'`MB  已用:`free -m|grep "Swap"|awk '{print $3}'`MB  剩余:`free -m|grep "Swap"|awk '{print $4}'`MB"
echo "∞————————————————————————∞"
#echo ""
#echo "∞————————————————————————∞"


