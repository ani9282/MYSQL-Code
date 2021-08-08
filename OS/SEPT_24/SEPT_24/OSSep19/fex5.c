#include<stdio.h>
  	#include <sys/types.h>
       #include <unistd.h>


	void main()
	{
		int x,y,z;

		x=fork();
		if(x > 0){
			y=fork();
			if(y>0)
			{
			  fork();
			  fork();
			}
		}
		else
		{
			z=fork();
			if(z>0) printf("\nHi");
			else printf("\nbye");
		}
	printf("\nHello\n");

	}
