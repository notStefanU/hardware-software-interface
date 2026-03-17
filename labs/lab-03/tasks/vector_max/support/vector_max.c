// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>

#include "vector_max.h"

int vector_max(int *v, int len)
{
    int max;
    unsigned int i;

    i = 0;
    max = v[0];

my_loop:
    if (max < v[i]) {
        max = v[i];
    }
    i++;

    if (i < len) {
        goto my_loop;
    }
    return max;

    return -1;
}
