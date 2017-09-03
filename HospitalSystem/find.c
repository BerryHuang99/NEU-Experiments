/* Hospital System
** by Berry Wong
** neu SE1507 20155108
*/

#include "head.h"

// 按ID查找Patient链表中的节点并返回该节点前一个节点的指针 
Patient * search_1(Patient** head){ 
	Patient * p = (*head)->next;
	Patient * prev = * head;
	char id[30];
	printf("请输入病人证件号：");
	scanf("%s", id);
	while (p) {
		if (!strcmp(p->id, id)){
			return prev;
		}
		p = p->next ;
		prev = prev->next ;
	}
	return NULL;
}
// 按ID查找Staff链表中的节点并返回该节点前一个节点的指针 
Staff * search_2(Staff ** head){ 
	Staff * p = (*head)->next;
	Staff * prev = *head;
	int id;
	printf("请输入医护人员工号：");
	scanf("%d", &id);
	while (p) {
		if (p->id == id){
			return prev ;
		}
		p = p->next ;
		prev = prev->next ;
	}
	return NULL;
}
// 按name查找Storage链表中的节点并返回该节点前一个节点的指针 
Storage	* search_3(Storage ** head){
	Storage * p = (*head)->next;
	Storage * prev = *head;
	char name[20];
	printf("请输入药品名：");
	scanf("%s",name);
	while (p) {
		if (!strcmp(p->name, name)){
			return prev ;
		}
		p = p->next ;
		prev = prev->next ;
	}
	return NULL;
}
// 列出所有病患的信息 
void listall_1(Patient * head){
	printf("姓名 \t证件号 \t性别 \t年龄 \t科室 \t门诊挂号费 \t急诊挂号费 \t化验费 \t手术费 \t药费 \t总共花费 \t病历\n");
	Patient * p = NULL;
	p = head->next;
	float sum = 0;
	for(p; p->next; p = p->next){
		sum = p->treat[0] + p->treat[1] + p->cost + p->transfusion + p->cost + p->surgery + p->room ;
		printf("%s \t%s \t%s \t%d \t%s \t%g \t%g \t%g \t%g \t%g \t%g \t%g \t%s;\n", p->name, p->id, p->gender, p->age, p->in_office, p->treat[0], p->treat[1], p->transfusion, p->surgery, p->cost, p->room, sum, p->casehistory) ;
	}
}
// 列出所有医护人员信息 
void listall_2(Staff * head){
	printf("姓名 \t工号 \t科室\n");
	Staff * p = NULL;
	p = head->next;
	for (p; p->next; p = p->next){
		printf("%s \t%d\n", p->name, p->id) ;
	}
}
// 列出所有药品信息 
void listall_3(Storage * head){
	printf("编号 \t药名 \t价格 \t库存量\n");
	Storage * p =NULL;
	p = head->next;
	for (p; p->next; p = p->next) {
		printf("%d \t%s \t%g \t%d\n", p->id, p->name, p->price, p->amount) ;
	}
}