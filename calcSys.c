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


