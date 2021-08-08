#include<stdio.h>
#include <sys/types.h>
#include <unistd.h>


	void main()
	{
		printf(" \nthis is the parent process pid = %d\n",getpid());
	fork();
	
	while(1)
	{
		printf(" pid = %d  ppid=%d \n",getpid(),getppid());
		sleep(2);
	}

}
