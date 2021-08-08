
#include <sys/ipc.h> 
#include <sys/shm.h> 
#include <stdio.h> 

  
int main() 
{ 
	int x=0;
    // ftok to generate unique key 
    key_t key = 65;
  
    // shmget returns an identifier in shmid 
    int shmid = shmget(key,1024,0666); 
  
    // shmat to attach to shared memory 
    char *str = (char*) shmat(shmid,(void*)0,0); 
  
    while(1)
    {
    	printf("Data read from memory: %s\n",str); 
        scanf("%d",&x);
    }
      
    //detach from shared memory  
    shmdt(str); 
    
    // destroy the shared memory 
    //shmctl(shmid,IPC_RMID,NULL); 
     
    return 0; 
} 

