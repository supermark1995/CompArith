#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <string.h>

int main()
{
	char alphabet[16] = {'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};
	char radix16_string[2][33] = {0};
	srand(time(0)); 

	int i,j;
	char t[2] = {0};
	for(i = 0; i < 2; i++)
	{
		for(j = 0; j < 32; j++)
		{
			strncpy(t,&(alphabet[rand()%16]),1);
			strcat(radix16_string[i], t);
		}
	}	
	
	printf("First:  %s\n",radix16_string[0]);
	printf("Second: %s\n",radix16_string[1]);

	return 0;
}

