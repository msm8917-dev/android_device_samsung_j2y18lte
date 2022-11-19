LOCAL_PATH := $(call my-dir)

MKBOOTIMG := $(LOCAL_PATH)/mkbootimg
FLASH_IMAGE_TARGET ?= $(PRODUCT_OUT)/recovery.tar
CUSTOM_DTB_TOOL := $(LOCAL_PATH)/dtbTool
KERNEL_OUT := $(PRODUCT_OUT)/kernel

INSTALLED_DTIMAGE_TARGET := $(PRODUCT_OUT)/dt.img
INSTALLED_DTBIMAGE_TARGET := $(PRODUCT_OUT)/dtb.img

BOARD_MKBOOTIMG_ARGS += --dt $(INSTALLED_DTBIMAGE_TARGET)

$(INSTALLED_DTIMAGE_TARGET): $(CUSTOM_DTB_TOOL) $(KERNEL_OUT)
	@echo ----- Making dt image ------
	$(hide) $(CUSTOM_DTB_TOOL) -s $(BOARD_KERNEL_PAGESIZE) -o $(INSTALLED_DTIMAGE_TARGET) -p $(KERNEL_OUT)/scripts/dtc $(KERNEL_OUT)/arch/$(TARGET_ARCH)/boot/dts/samsung/msm8917
	$(hide) mv $(INSTALLED_DTIMAGE_TARGET) $(INSTALLED_DTBIMAGE_TARGET)
	@echo ----- Made dt image: $@ --------

$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) $(INSTALLED_DTIMAGE_TARGET) $(recovery_kernel) $(recovery_ramdisk)
	@echo -e ${CL_GRN}"----- Making recovery image ------"${CL_RST}
	$(hide) $(MKBOOTIMG) $(INTERNAL_RECOVERYIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --output $@ --ramdisk $(recovery_ramdisk)
	@echo -e ${CL_CYN}"Made recovery image: $@"${CL_RST}
	@echo -e ${CL_GRN}"----- Lying about SEAndroid state to Samsung bootloader ------"${CL_RST}
	$(hide) echo -n "SEANDROIDENFORCE" >> $(INSTALLED_RECOVERYIMAGE_TARGET)
	$(hide) $(call assert-max-image-size,$@,$(BOARD_RECOVERYIMAGE_PARTITION_SIZE),raw)
	$(hide) tar -C $(PRODUCT_OUT) -c recovery.img > $(FLASH_IMAGE_TARGET)
	@echo -e ${CL_CYN}"Made Odin flashable recovery tar: ${FLASH_IMAGE_TARGET}"${CL_RST}
