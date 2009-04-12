install_dir=`dirname "$0"`
if [ `whoami` = "root" ]; then
	prefix=${1:-/usr/local}
	XDG_DATA_DIRS=$prefix/share/:${XDG_DATA_DIRS:-/usr/local/share/:/usr/share/}
else
	prefix=${1:-$HOME/.local}
fi
echo "Removing $prefix/bin/dispcalGUI..."
rm -f "$prefix/bin/dispcalGUI"
if [ -e "$install_dir/setup.py" ]; then
	# python install
	echo "Removing $prefix/lib/python/site-packages/dispcalGUI..."
	rm -f -r "$prefix/lib/python/site-packages/dispcalGUI"
	rm -f "$prefix/lib/python/site-packages/dispcalGUI-"*.egg-info
fi
echo "Removing $prefix/share/dispcalGUI..."
rm -f -r "$prefix/share/dispcalGUI"
echo "Removing $prefix/share/doc/dispcalGUI..."
rm -f -r "$prefix/share/doc/dispcalGUI"
echo "Uninstalling desktop menu entry..."
xdg-desktop-menu uninstall "$prefix/share/applications/dispcalGUI.desktop"
echo "Uninstalling icon resources..."
xdg-icon-resource uninstall --noupdate --size 16 dispcalGUI
xdg-icon-resource uninstall --noupdate --size 22 dispcalGUI
xdg-icon-resource uninstall --noupdate --size 24 dispcalGUI
xdg-icon-resource uninstall --noupdate --size 32 dispcalGUI
xdg-icon-resource uninstall --noupdate --size 48 dispcalGUI
xdg-icon-resource uninstall --noupdate --size 256 dispcalGUI
xdg-icon-resource forceupdate
echo "...done"
