MODULENAME=calcSys

obj-m += $(MODULENAME).o

module_sys:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean_sys:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean

install_sys:
	sudo insmod $(MODULENAME).ko

uninstall_sys:
	sudo rmmod $(MODULENAME)





MODULENAME=calcProc

obj-m += $(MODULENAME).o

module_proc:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean_proc:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean

install_proc:
	sudo insmod $(MODULENAME).ko

uninstall_proc:
	sudo rmmod $(MODULENAME)
