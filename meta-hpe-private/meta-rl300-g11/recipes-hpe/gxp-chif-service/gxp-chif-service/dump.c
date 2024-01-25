#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <unistd.h>
#include <search.h>
#include <stdint.h>
#include <string.h>
#include <fcntl.h>
void main()
{
	char file[65536];
	char magic[2];
	char name[32]; // max length is 32
	FILE *fp;
	uint8_t nameSize;
	fp=fopen("uefievs.store", "r");
	fread( &file[0], 1, 65536 , fp);
	for(int i = 0 ; i < 65535 ; i++ )
	{
		strncpy(&magic[0], &file[i], 2);
		if ( strncmp(&magic[0], "CQ", 2) == 0 )
		{
			nameSize = (uint8_t)(file[i-1]);
			for ( int j = 0 ; j < 32 ; j++ )
				name[j] = '\0';
			strncpy(&name[0], &file[i], nameSize);
			puts(name);
			i += nameSize;
		}
	}
	fclose(fp);
}
