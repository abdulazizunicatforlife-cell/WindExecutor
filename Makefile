TARGET := iphone:clang:latest:14.0
ARCHS := arm64

include $(THEOS)/makefiles/common.mk

TWEAK_NAME := WindExecutor
WindExecutor_FILES := Tweak.xm

include $(THEOS)/makefiles/tweak.mk
