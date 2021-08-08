#include<stdio.h>
#include<stdlib.h> 
#include<unistd.h> 

void main()
{

         char *args[]={"ls",NULL}; //the last element should be null 
       
	printf("\nI am testexexec my pid = %d\n",getpid());
	//first arg is the name of the command
	//second arg is the list of the entire command line
	
	//execvp(args[0],args); 
	//execlp("ls","ls","-l",NULL); //NULL terminated

	//execl("/bin/ls","ls","-l",NULL);


	printf("\nI am testexexec ENDING my pid = %d\n",getpid());

}








