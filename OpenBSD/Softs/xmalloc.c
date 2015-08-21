/*
 * xmalloc.c
 *
 * Just allocate a chunk of memory
 * and make sure it gets written, so that
 * the demand-paging mechanism of Linux actually
 * has to find physical pages or swap for it
 *
 * Vangelis Koukis <vkoukis@cslab.ece.ntua.gr>
 * July 2007
 */ 
  
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h> 

int main(int argc, char *argv[])
{
	char *p;
	long i;
	size_t n; 

	/* I'm too bored to do proper cmdline parsing */
	if (argc != 2 || atol(argv[1]) <= 0 ) {
		fprintf(stderr, "I'm bored... Give me the size of the memory chunk in KB\n");
		return 1;
	}
	n = 1024 * atol(argv[1]);

	if (! (p = malloc(n))) {
		perror("malloc failed");
		return 2;
	} 

 	/* Temp, just want to check malloc */
	printf("Malloc was successful\n");
	return 0; 

	/* Touch all of the buffer, to make sure it gets allocated */
	for (i = 0; i < n; i++)
		p[i] = 'A';


	printf("Allocated and touched buffer, sleeping for 60 sec...\n");
	sleep(60);
	printf("Done!\n"); 

	return 0;
}
