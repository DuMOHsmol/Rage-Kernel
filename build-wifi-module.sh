export PATH=arm-2010q1/bin:$PATH
cd xperia-ti-wlan/sta/platforms/os/linux
export CROSS_COMPILE=/home/dumoh/RageKernel/arm-2010q1/bin/arm-none-eabi-
export ARCH=arm
export HOST_PLATFORM=msm
export KERNEL_DIR=/home/dumoh/RageKernel/kernel
make
cp sdio.ko ../../../../../
cp tiwlan_drv.ko ../../../../../
make clean
