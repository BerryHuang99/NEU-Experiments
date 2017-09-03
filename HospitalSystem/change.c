/* Hospital System
** by Berry Wong
** neu SE1507 20155108
*/

#include "head.h" 
// ����Patient����ڵ� 
Patient	* add_1(Patient * head){
	Patient * p = NULL;
	p = head->next;
	for(; p->next; p = p->next);
	printf("���������֤�Ż���ҽ����:");
	scanf("%s", p->id);
	printf("������������");
	scanf("%s", p->name);
	printf("�������Ա�");
	scanf("%s", p->gender);
	printf("����������:");
	scanf("%d", &p->age);
	return p;
}
// ����Staff����ڵ� 
Staff * add_2(Staff * head){
	Staff * p = NULL;
	p = head->next ;
	for(; p->next; p = p->next);
	printf("������������");
	scanf("%s",p->name);
	printf("�����빤�ţ�");
	scanf("%d", &p->id);
	p->key = changekey();
	return p;
}
// ����Storage����ڵ� 
Storage	* add_3(Storage * head){
	Storage * p = NULL;
	p = head->next ;
	for(; p->next; p = p->next);
	printf("����ҩƷ��:");
	scanf("%s", p->name);
	printf("�������ţ�");
	scanf("%d", &p->id);
	printf("����������");
	scanf("%d", &p->amount);
	printf("�����뵥�ۣ�Ԫ����");
	scanf("%f", &p->price);
	return p;
}
// ɾ��Patient����ڵ� 
void delete_1(Patient * p) {
	Patient * q = NULL;
	q = p->next->next;
	free(p->next);
	p->next = q;
}
// ɾ��Staff����ڵ� 
void delete_2(Staff * p){
	Staff * q = NULL;
	q = p->next->next;
	free(p->next);
	p->next = q;
}
// ɾ��Storage����ڵ� 
void delete_3(Storage * p){
	Storage * q = NULL;
	q = p->next->next;
	free(p->next);
	p->next = q;
}