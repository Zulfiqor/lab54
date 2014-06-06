sudo rmmod calcSys
sudo insmod calcSys.ko

fs="sys"
echo "10" > /$fs/calcSys/arg1
echo "4" > /$fs/calcSys/arg2
echo "+" > /$fs/calcSys/operation

cat /$fs/calcSys/result
