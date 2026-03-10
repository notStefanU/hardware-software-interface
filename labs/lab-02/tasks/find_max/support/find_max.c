// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "find_max.h"

void *find_max(void *arr, int n, size_t element_size,
               int (*compare)(const void *, const void *))
{
    void *max_elem = arr;

    char *p;
    for (p = arr; p - (char *)arr < n; p += element_size) {
        if (compare(p, max_elem) >= 0) {
            max_elem = p;
        }
    }

    return max_elem;
}

int compare(const void *a, const void *b) { return *(int *)a - *(int *)b; }
