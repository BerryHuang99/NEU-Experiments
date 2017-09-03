/* Hospital System
** by Berry Wong
** neu SE1507 20155108
*/

#include "head.h"
// ��ʼ���������ļ���Ϣд�뵽������,��������ͷ 
Patient * load_1(){
	FILE * fp = fopen("data1", "rb");
	Patient * p = NULL;
	Patient * head =(Patient*)malloc(sizeof(Patient));
	head->next = (Patient*)malloc(sizeof(Patient));
	p = head->next;
	
	if (!flag1) {
			while (fread(p, sizeof(Patient), 1, fp) > 0) {
			p->next = (Patient*)malloc(sizeof(Patient)) ;
			p = p->next ;
		}
	}
	p->next = NULL;
	fclose(fp);
	return head; 
}
// ��ʼ���������ļ���Ϣд�뵽������,��������ͷ 
Staff * load_2(){
	FILE * fp = fopen("data2", "rb");
	Staff * head = (Staff*)malloc(sizeof(Staff));
	head->next = (Staff*)malloc(sizeof(Staff));
	Staff * p = NULL;
	p = head->next;
	
	if (!flag2) {
		while (fread(p, sizeof(Staff), 1, fp)) {
			p->next = (Staff*)malloc(sizeof(Staff)) ;
			p = p->next	;
		}
	}
	p->next = NULL;
	fclose(fp);
	return head; 
}
// ��ʼ���������ļ���Ϣд�뵽������,��������ͷ 
Storage * load_3(){
	FILE * fp = fopen("storage", "rb");
	Storage * head = (Storage*)malloc(sizeof(Storage));
	head->next = (Storage*)malloc(sizeof(Storage));
	Storage * p = NULL;
	p = head->next;
	while (fread(p, sizeof(Storage), 1, fp)) {
			p->next = (Storage*)malloc(sizeof(Storage)) ;
			p = p->next ;
		}
	p->next = NULL;
	fclose(fp);
	return head; 
}
// ��������Ϣ���浽�ļ��У�����Ϊָ��Patient���͵�ָ��
void save_1(Patient * head){
	FILE * fp = fopen("data1", "wb");
	Patient * p = NULL;
	p = head->next;
	for (; p->next; p = p->next) {
		fwrite(p, sizeof(Patient), 1, fp) ;
	}
	p = head;
	for(; head; ){
		head = head->next ;
		free(p) ;
		p = head ;
	}
	printf("������Ϣ����ɹ���\n");
	fclose(fp);
}
// ��������Ϣ���浽�ļ��У�����Ϊָ��Staff���͵�ָ��
void save_2(Staff * head){
	FILE * fp = fopen("data2", "wb");
	Staff * p = NULL;
	p = head->next;
	for (p; p->next; p = p->next) {
		fwrite(p, sizeof(Staff), 1, fp) ;
	}
	printf("ҽ����Ա��Ϣ����ɹ���\n");
	p = head;
	for(; head; ){
		head = head->next ;
		free(p) ;
		p = head ;
	}
	fclose(fp);
}
// ��������Ϣ���浽�ļ��У�����Ϊָ��Storage���͵�ָ��
void save_3(Storage * head){
	FILE * fp = fopen("storage", "wb");
	Storage * p = NULL;
	p = head->next;
	for (p; p->next; p = p->next) {
		fwrite(p, sizeof(Storage), 1, fp) ;
	}
	printf("ҩƷ��Ϣ����ɹ���\n"); 
	p = head;
	for(; head; ){
		head = head->next ;
		free(p) ;
		p = head ;
	}
	fclose(fp);
}