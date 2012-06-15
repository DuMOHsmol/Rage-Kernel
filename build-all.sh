version=30


version=`expr $version - 1`
echo $version > ./kernel/.version
./build-minipro.sh
echo $version > ./kernel/.version
./build-mini.sh
echo $version > ./kernel/.version
./build-lww.sh
echo $version > ./kernel/.version
./build-active.sh
