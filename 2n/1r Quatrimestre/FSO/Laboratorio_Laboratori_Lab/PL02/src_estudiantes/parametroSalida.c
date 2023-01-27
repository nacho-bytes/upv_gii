#include <stdio.h>

char F(char *c){
	c[0] = 'f';
	return (*c);
}
main () {
	char c;
	c = 'a';
	printf("%c\n",c);
	printf("%c\n", F(&c));
	printf("%c\n", c);
}
