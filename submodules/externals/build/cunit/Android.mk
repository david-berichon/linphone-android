BUILD_PATH := $(call my-dir)
LOCAL_PATH := $(call my-dir)/../../cunit

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	CUnit/Sources/Framework/CUError.c \
	CUnit/Sources/Framework/MyMem.c \
	CUnit/Sources/Framework/TestDB.c \
	CUnit/Sources/Framework/TestRun.c \
	CUnit/Sources/Framework/Util.c \
	CUnit/Sources/Basic/Basic.c \

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/CUnit/Headers/ \

LOCAL_EXPORT_C_INCLUDES := \
	$(BUILD_PATH) \

LOCAL_MODULE := cunit
LOCAL_LDLIBS := -llog 

include $(BUILD_SHARED_LIBRARY)

