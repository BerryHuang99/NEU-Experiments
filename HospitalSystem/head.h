/* Hospital System
** by Berry Wong
** neu SE1507 20155108
*/

#ifndef FIRST
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
typedef struct staff{
	long int id;
	char name[10];
	int key;
	struct staff *next;
}Staff; 
typedef struct storage{
	char name[20];
	int id; 
	int amount;
	float price;
	struct storage*next;
}Storage;
typedef struct patient{
	char id[30];
	char gender[2];
	char name[10];
	int age;
	char in_office[10];
	char casehistory[300];
	int in_hos;
	float treat[2];
	float cost;
	float transfusion;
	float surgery;
	float room;
	struct patient *next;
}Patient;

int flag1,flag2;// 标记有无初始化文件 
Patient * headp, * pp;
Staff * heads, * ps;
Storage * headm, * pm; 

void test();
Patient * load_1();
Staff * load_2();
Storage * load_3();
void save_1(Patient * head);
void save_2(Staff * head);
void save_3(Storage * head);
void delete_1(Patient * p);
void delete_2(Staff * p);
void delete_3(Storage * p);
Patient * addp_1(Patient * p);
Staff * add_2(Staff * p);
Storage * add_3(Storage * p);
void writecase(Patient * p);
void buy(Patient * p,Storage * q);
Patient * search_1(Patient ** head);
Staff * search_2(Staff ** head);
Storage * search_3(Storage ** head);
void listall_1(Patient * head);
void listall_3(Storage * head);
void collect(double price);
int findkey();
int password(int key);
int changekey();
#define FIRST
#endif