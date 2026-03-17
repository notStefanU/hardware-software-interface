// SPDX-License-Identifier: BSD-3-Clause

#include "pixels.h"
#include <assert.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include "pixel.h"

#define GET_PIXEL(a, i, j) (*(*((a) + (i)) + (j)))
#define DIE(assertion, call_description)                                       \
    do {                                                                       \
        if (assertion) {                                                       \
            fprintf(stderr, "(%s, %d): ", __FILE__, __LINE__);                 \
            perror(call_description);                                          \
            exit(errno);                                                       \
        }                                                                      \
    } while (0)


void reverse_pic(struct picture *pic)
{
    if (pic == NULL || pic->pix_array == NULL) {
        puts("Error: pic/pix_array uninitialized!");
        return;
    }

    int i, j;
    for (i = 0; i < pic->height / 2; i++) {
        for (j = 0; j < pic->width; j++) {
            struct pixel *up = &GET_PIXEL(pic->pix_array, i, j);
            struct pixel *down =
                &GET_PIXEL(pic->pix_array, pic->height - 1 - i, j);

            struct pixel temp = *up;
            *up = *down;
            *down = temp;
        }
    }
}

void color_to_gray(struct picture *pic)
{
    if (pic == NULL || pic->pix_array == NULL) {
        puts("Error: pic/pix_array uninitialized!");
        return;
    }

    int i, j;
    for (i = 0; i < pic->height; i++) {
        for (j = 0; j < pic->width; j++) {
            struct pixel *pix = &GET_PIXEL(pic->pix_array, i, j);

            pix->R = 0.3 * pix->R;
            pix->G = 0.59 * pix->G;
            pix->B = 0.1 * pix->B;
        }
    }
}
