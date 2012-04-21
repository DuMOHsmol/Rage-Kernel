PATH=arm-2010q1/bin:$PATH
export PATH
cd kernel
#Clean
ARCH=arm CROSS_COMPILE=../arm-2010q1/bin/arm-none-eabi- make clean
rm ../ramdisk/ramdisk.img
