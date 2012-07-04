source = http://dl.suckless.org/dwm/dwm-6.0.tar.gz
source_filename = $(call notdir,${source})
patches_dirname = patches
build_dirname = $(call basename,$(call basename,${source_filename}))

patches = http://dwm.suckless.org/patches/dwm-6.0-attachabove.diff \
          http://dwm.suckless.org/patches/dwm-6.0-bstack.diff \
          http://dwm.suckless.org/patches/autoresize.diff \
          http://dwm.suckless.org/patches/dwm-6.0-single_window_no_border.diff \
          http://dwm.suckless.org/patches/dwm-6.0-pertag.diff \
          http://dwm.suckless.org/patches/dwm-6.0-statusallmons.diff \
          http://dwm.suckless.org/patches/dwm-6.0-systray.diff \
          http://dwm.suckless.org/patches/dwm-r1522-viewontag.diff \
          http://dwm.suckless.org/patches/dwm-6.0-xft.diff \
          http://dwm.suckless.org/patches/dwm-6.0-zoomswap.diff

# TODO: Patches to modify for DWM 6.0
#	combo
#	fibonacci
#	gestures
#	keymodes
#	nametag

patch_filename = $(patches_dirname)/$1
patch_url_to_filename = $(call patch_filename,$(call notdir,$1))

all: $(build_dirname)

$(build_dirname): $(source_filename)
	tar -xvf $(source_filename)

$(source_filename):
	wget $(source) -O $(source_filename)

clean:
	rm $(source_filename)
	rm -rf patches
	rm -rf dwm

.PHONY: all clean

