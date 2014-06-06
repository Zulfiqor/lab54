#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/string.h>

#include <linux/init.h>
#include <linux/fs.h>
#include <linux/slab.h>
#include "calcLogic.c"

// names
#define ARG1 "arg1"
#define ARG2 "arg2"
#define OPERATION "operation"
#define RESULT "result"

#define PARENT_DIR "calcSys"

struct calc_attr {
	struct attribute attr;
	int value;
};

static struct attribute arg1 = {
	.name = ARG1,
	.mode = 0666,
};

static struct attribute arg2 = {
	.name = ARG2,
	.mode = 0666,
};

static struct attribute operation = {
	.name = OPERATION,
	.mode = 0666,
};

static struct attribute result = {
	.name = RESULT,
	.mode = 0666,
};

static struct attribute * calc_attributes[] = {
	&arg1,
	&arg2,
	&operation,
	&result,
	NULL
};

static ssize_t default_show(struct kobject *kobj, struct attribute *attr,
		char *buf)
{
	if (!strcmp(attr->name, RESULT)) {
		long res = calculate();

		return sprintf(buf, "%ld\n", res);
	} else {
		return 0;
	}
}

static ssize_t default_store(struct kobject *kobj, struct attribute *attr,
		const char *buf, size_t len)
{
	if (len > WRITE_SIZE) {
		len = WRITE_SIZE;
	}

	if (!strcmp(attr->name, ARG1)) {
		memcpy(arg1_input, buf, len);
	} else if (!strcmp(attr->name, ARG2)) {
		memcpy(arg2_input, buf, len);
	} else if (!strcmp(attr->name, OPERATION)) {
		memcpy(operation_input, buf, len);
	}
	return len;
}

static struct sysfs_ops calc_ops = {
	.show = default_show,
	.store = default_store,
};

static struct kobj_type calc_type = {
	.sysfs_ops = &calc_ops,
	.default_attrs = calc_attributes,
};

struct kobject *calc_obj;
static int __init sysfsexample_module_init(void)
{
	int err = -1;
	calc_obj = kzalloc(sizeof(*calc_obj), GFP_KERNEL);
	if (calc_obj) {
		kobject_init(calc_obj, &calc_type);
		if (kobject_add(calc_obj, NULL, "%s", PARENT_DIR)) {
			err = -1;
			printk("Sysfs creation failed\n");
			kobject_put(calc_obj);
			calc_obj = NULL;
		}
		err = 0;
	}
	return err;
}

static void __exit sysfsexample_module_exit(void)
{
	if (calc_obj) {
		kobject_put(calc_obj);
		kfree(calc_obj);
	}
}

module_init(sysfsexample_module_init);
module_exit(sysfsexample_module_exit);
MODULE_LICENSE("GPL");


