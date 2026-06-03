#include <linux/module.h>

int init_module(void)
{
    printk("hello sdk kernel module!\n");
    printk("hello sdk kernel module!\n");
    printk("hello sdk kernel module!\n");
    printk("hello sdk kernel module!\n");
    printk("hello sdk kernel module!\n");
    return 0;
}

void cleanup_module(void)
{
    printk("Goodbye sdk kernel module!\n");
}

MODULE_LICENSE("MIT");
