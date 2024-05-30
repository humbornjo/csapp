#include <stdio.h>

typedef word_t word_t;

word_t src[8], dst[8];

/* $begin ncopy */
/*
 * ncopy - copy src to dst, returning number of positive ints
 * contained in src array.
 */
word_t ncopy(word_t *src, word_t *dst, word_t len)
{
    word_t count = 0;
    word_t val;

    while (len > 0) {
	val = *src++;
	*dst++ = val;
	if (val > 0)
	    count++;
	len--;
    }
    return count;
}
/* $end ncopy */

int main()
{
    word_t i, count;

    for (i=0; i<8; i++)
	src[i]= i+1;
    count = ncopy(src, dst, 8);
    printf ("count=%d\n", count);
    exit(0);
}

word_t ncopys4(word_t *src, word_t *dst, word_t len)
{
    word_t count1 = 0, count2 = 0, count3 = 0, count4 = 0;
    word_t val1, val2, val3, val4;
    while (len > 4) {
        val1 = *src++;
        *dst++ = val1;
        if (val1 > 0)
	        count1++;
        val2 = *src++;
        *dst++ = val2;
        if (val2 > 0)
	        count2++;
        val3 = *src++;
        *dst++ = val3;
        if (val3 > 0)
	        count3++;
        val4 = *src++;
        *dst++ = val4;
        if (val4 > 0)
	        count4++;
        len -= 4;
    }

    while (len > 0) {
        val1 = *src++;
        *dst++ = val1;
        if (val1 > 0)
            count1++;
        len--;
    }
    return count1+count2+count3+count4;
}
