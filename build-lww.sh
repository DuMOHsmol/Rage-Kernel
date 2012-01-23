PATH=arm-2010q1/bin:$PATH
export PATH
cd kernel
#Build kernel
ARCH=arm CROSS_COMPILE=../arm-2010q1/bin/arm-none-eabi- make semc_coconut_edited_defconfig
ARCH=arm CROSS_COMPILE=../arm-2010q1/bin/arm-none-eabi- make
#Make ramdisk file
cd ../ramdisk/Coconut/
find . | cpio --quiet -o -H newc | gzip > ../ramdisk.img
#Make flashable boot.img file
cd ../../
./mkbootimg --base 0x00200000 --kernel kernel/arch/arm/boot/zImage --ramdisk ramdisk/ramdisk.img -o boot.img
#zip boot.img
./zip rage_kernel_live_with_walkman.zip boot.img
rm boot.img
