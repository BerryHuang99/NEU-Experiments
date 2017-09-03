/* Hospital System
** by Berry Wong
** neu SE1507 20155108
*/

#include "head.h"

// ��ID����Patient�����еĽڵ㲢���ظýڵ�ǰһ���ڵ��ָ�� 
Patient * search_1(Patient** head){ 
	Patient * p = (*head)->next;
	Patient * prev = * head;
	char id[30];
	printf("�����벡��֤���ţ�");
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
// ��ID����Staff�����еĽڵ㲢���ظýڵ�ǰһ���ڵ��ָ�� 
Staff * search_2(Staff ** head){ 
	Staff * p = (*head)->next;
	Staff * prev = *head;
	int id;
	printf("������ҽ����Ա���ţ�");
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
// ��name����Storage�����еĽڵ㲢���ظýڵ�ǰһ���ڵ��ָ�� 
Storage	* search_3(Storage ** head){
	Storage * p = (*head)->next;
	Storage * prev = *head;
	char name[20];
	printf("������ҩƷ����");
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
// �г����в�������Ϣ 
void listall_1(Patient * head){
	printf("���� \t֤���� \t�Ա� \t���� \t���� \t����Һŷ� \t����Һŷ� \t����� \t������ \tҩ�� \t�ܹ����� \t����\n");
	Patient * p = NULL;
	p = head->next;
	float sum = 0;
	for(p; p->next; p = p->next){
		sum = p->treat[0] + p->treat[1] + p->cost + p->transfusion + p->cost + p->surgery + p->room ;
		printf("%s \t%s \t%s \t%d \t%s \t%g \t%g \t%g \t%g \t%g \t%g \t%g \t%s;\n", p->name, p->id, p->gender, p->age, p->in_office, p->treat[0], p->treat[1], p->transfusion, p->surgery, p->cost, p->room, sum, p->casehistory) ;
	}
}
// �г�����ҽ����Ա��Ϣ 
void listall_2(Staff * head){
	printf("���� \t���� \t����\n");
	Staff * p = NULL;
	p = head->next;
	for (p; p->next; p = p->next){
		printf("%s \t%d\n", p->name, p->id) ;
	}
}
// �г�����ҩƷ��Ϣ 
void listall_3(Storage * head){
	printf("��� \tҩ�� \t�۸� \t�����\n");
	Storage * p =NULL;
	p = head->next;
	for (p; p->next; p = p->next) {
		printf("%d \t%s \t%g \t%d\n", p->id, p->name, p->price, p->amount) ;
	}
}