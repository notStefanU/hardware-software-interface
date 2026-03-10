// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "delete_first.h"

char *delete_first(char *s, char *pattern)
{
    int s_len = strlen(s);
    int pat_len = strlen(pattern);

    char *aux = malloc((s_len + 1) * sizeof(char));
    strcpy(aux, s);

    char *found_idx = strstr(aux, pattern);
    if (found_idx) {
        int start = (int)(found_idx - aux);
        int i;

        for (i = start; i < s_len - pat_len + 1; i++) {
            aux[i] = aux[i + pat_len];
        }

        char *deleted = malloc((strlen(aux) + 1) * sizeof(char));
        strcpy(deleted, aux);
        free(aux);
        return deleted;
    }

    free(aux);
    return NULL;
}
