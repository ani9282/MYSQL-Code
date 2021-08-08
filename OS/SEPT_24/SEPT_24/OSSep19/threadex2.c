
#include<stdio.h>

 void spch()
 {
	while(1) { printf("spellchecker of word ...\n"); }
 }

 void editor()
 {
	while(1) { printf("editor of word ...\n"); }
 }

 void main()
 {
	//sequential execution --single thread execution
	// after first function is over then call second function
	editor();
	spch();
	

 }
