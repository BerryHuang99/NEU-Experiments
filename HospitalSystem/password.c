/* Hospital System
** by Berry Wong
** neu SE1507 20155108
*/

#include "head.h"
// �����Ƿ���ڱ������Կ�ļ������������������ļ����ҳ�ʼ������Ϊ123456������ 
int findkey(void){
	int key = 0;
	FILE * fp_0 = fopen("key.txt", "r");
	if (fp_0) {
		fscanf(fp_0, "%d", &key);
		fclose(fp_0);
	}
	else{
		fp_0 = fopen("key.txt", "w");
		key = 123456;
		fprintf(fp_0, "%d", key);
		fclose(fp_0);
	} 
	return key;
}
// �ṩ���μ������������ȷ��� 
int password(int key){
	int k = 0;
	int i = 0;
	int re = 0;
	do {	
		i ++ ; 
		scanf("%d", &k) ;
		if (k == key) {
			re = 1 ;
			break ;
		}
		else{
			printf("������󣬰�����������������룡\n") ;
			getchar() ;
		}
	} while (i < 3);
	
	if (i == 3) {
		printf("�Բ�������������������밴��������أ�");
		getchar();
	}
	return re;
}
// �޸����� 
int changekey(){
	int key1 = 0, key2 = 0;
	while (1) {
		printf("�����������룺") ;
		scanf("%d", &key1) ;
		printf("���ٴ�����ȷ�����룺") ;
		scanf("%d", &key2) ;
		if (key1 != key2) {
			printf("�Բ���������������벻ͬ�����������룺\n") ;
			continue ;
		}
		break ;
	}
	return key1;
} 