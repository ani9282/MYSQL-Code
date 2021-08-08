#include<stdio.h>
#include<pthread.h>

//path of execution
 void * spch()
 {
	while(1) { printf("spellchecker of word ... %ld \n",(long)pthread_self()); 
	sleep(2);
	}
	return NULL;
 }

//path of execution
 void * editor()
 {
	while(1) { printf("editor of word ...%ld \n",(long)pthread_self());

	sleep(2);
		 }
	return NULL;
 }

 void main()
 {
	pthread_t t1, t2; //threads are created but path of execution is not known 
	
	//parallel execution --- multithreaded execution

	//attach the path of execution to the thread

	printf("the id of main thread is %ld\n",(long)pthread_self());
	
	sleep(5);

	pthread_create(&t1,NULL,(void *)editor,NULL);
	
	pthread_create(&t2,NULL,(void *)editor,NULL);
	
	printf("main created two threads and it is terminating\n");
//	while(1);

 }








