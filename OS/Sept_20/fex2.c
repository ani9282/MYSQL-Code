#include<stdio.h>
#include <sys/types.h>
#include <unistd.h>

void main()
{
	
	int ret_val;
	ret_val = fork();
	
	
	if( ret_val >0 )
	{
		while(1) printf("\n I am parent %d  ret_val=%d",getpid(),ret_val);
	}
	else	
	{
		while(1)
		printf(" I an child pid = %d  ppid=%d \n ret_val=%d",getpid(),getppid(),ret_val);
	}
}



