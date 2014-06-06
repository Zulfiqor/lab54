MODULENAME=calcSys
MODULENAME1=calcProc
obj-m += $(MODULENAME).o
obj-m += $(MODULENAME1).o
module:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean

install:
	sudo insmod $(MODULENAME).ko

uninstall:
	sudo rmmod $(MODULENAME)




