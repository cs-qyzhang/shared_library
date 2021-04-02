#include <stdio.h>
#include <dlfcn.h>

int (*my_pow)(int, int);

int main(void) {
    void* hdl = dlopen("./libmymath.so", RTLD_LAZY);
    my_pow = dlsym(hdl, "mypow");
    printf("10 ^ 2 = %d\n", my_pow(10, 2));
    dlclose(hdl);
    return 0;
}
