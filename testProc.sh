sudo rmmod calcProc
sudo insmod calcProc.ko

echo "10" > /proc/calcProc/arg1
echo "2" > /proc/calcProc/arg2
echo "-" > /proc/calcProc/operation

cat /proc/calcProc/result
