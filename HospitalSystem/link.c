/* Hospital System
** by Berry Wong
** neu SE1507 20155108
*/

#include "head.h"
// ��ָ������ƶ��Ĳ�����д�����������Ϣ 
void writecase(Patient * p){
	double price = 0;
	printf("����д�������ݣ����ó���150���֣���\n");
	scanf("%s",p->casehistory); 
	system("cls");
	printf("�Ƿ���Ҫ��Ѫ���飿��1�����ǣ����������������\n");
	fflush(stdin);
	if (getchar() == '1') {
		price = 5;
		collect(price);
		p->transfusion = price ;
	}
	printf("�Ƿ���Ҫ��������1�����ǣ����������������\n");
	fflush(stdin);
	if (getchar() == '1') {
		price = 1000;
		collect(price);
		p->surgery = price;
	}
	time_t* t; 
	time(t);
	printf("%s",asctime(gmtime(t)));
}
// ���ڲ��˵Ĺ�ҩ���Ѵ�������Ϊָ��Patient���͵�ָ����ָ��Storage��ָ��
void buy(Patient * p, Storage * q){
	int num = 0;
 	printf("�����빺��������");
 	scanf("%d", &num);
 	if (num < q->amount) {
		p->cost += (num*q->price);
		q->amount -= num;
		printf("����ɹ�������������أ�");	
 	}
	else
		printf("�Բ��𣬿�治�㣡�����������") ; 
	fflush(stdin);
	getchar();
}
