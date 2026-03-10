// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>
#include <stdlib.h>

#include "delete_first.h"

int main(void)
{
    /**
     * TODO: Is the declaration of the s variable correct considering that
     * we're calling the delete_first function on it? Why? Modify if necessary.
     */

    // The declaration 'char *s = "(some string)"' will segfault since
    // delete_first will try to modify a string literal, which is in RODATA
    char s[] = "She sells seashells by the seashore";
    char *pattern = "se";

    char *res = delete_first(s, pattern);

    res ? puts(res) : puts("Implement function!");

    return 0;
}
