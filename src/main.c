#include <ti/screen.h>
#include <ti/getcsc.h>
#include <stdlib.h>
#include <stdio.h>

#include "add.c"

/* Main function, called first */
int main(void)
{
    /* Clear the homescreen */
    os_ClrHome();

    /* Print a string */
    printf("Hello, World.\n");

    /* Initialize the Wasm runtime. */
    wasm_rt_init();

    /* Declare an instance of the `fac` module. */
    w2c_add instance;

    /* Construct the module instance. */
    wasm2c_add_instantiate(&instance);

    /* Call `add`, using the mangled name. */
    u32 result = w2c_add_add(&instance, 1, 2);

    /* Print the result. */
    printf("1 + 2 = %u\n", result);

    /* Free the add module. */
    wasm2c_add_free(&instance);

    /* Free the Wasm runtime state. */
    wasm_rt_free();

    /* Waits for a key */
    while (!os_GetCSC())
        ;

    /* Return 0 for success */
    return 0;
}
