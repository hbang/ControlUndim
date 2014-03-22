TARGET = :clang::7.0
ARCHS = armv7 arm64

include theos/makefiles/common.mk

TWEAK_NAME = ControlUndim
ControlUndim_FILES = Tweak.xm
ControlUndim_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec spring
