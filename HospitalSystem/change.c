/* Hospital System
** by Berry Wong
** neu SE1507 20155108
*/

#include "head.h" 
// 增加Patient链表节点 
Patient	* add_1(Patient * head){
	Patient * p = NULL;
	p = head->next;
	for(; p->next; p = p->next);
	printf("请输入身份证号或者医保号:");
	scanf("%s", p->id);
	printf("请输入姓名：");
	scanf("%s", p->name);
	printf("请输入性别：");
	scanf("%s", p->gender);
	printf("请输入年龄:");
	scanf("%d", &p->age);
	return p;
}
// 增加Staff链表节点 
Staff * add_2(Staff * head){
	Staff * p = NULL;
	p = head->next ;
	for(; p->next; p = p->next);
	printf("请输入姓名：");
	scanf("%s",p->name);
	printf("请输入工号：");
	scanf("%d", &p->id);
	p->key = changekey();
	return p;
}
// 增加Storage链表节点 
Storage	* add_3(Storage * head){
	Storage * p = NULL;
	p = head->next ;
	for(; p->next; p = p->next);
	printf("输入药品名:");
	scanf("%s", p->name);
	printf("请输入编号：");
	scanf("%d", &p->id);
	printf("请输入库存量");
	scanf("%d", &p->amount);
	printf("请输入单价（元）：");
	scanf("%f", &p->price);
	return p;
}
// 删除Patient链表节点 
void delete_1(Patient * p) {
	Patient * q = NULL;
	q = p->next->next;
	free(p->next);
	p->next = q;
}
// 删除Staff链表节点 
void delete_2(Staff * p){
	Staff * q = NULL;
	q = p->next->next;
	free(p->next);
	p->next = q;
}
// 删除Storage链表节点 
void delete_3(Storage * p){
	Storage * q = NULL;
	q = p->next->next;
	free(p->next);
	p->next = q;
}