/* Hospital System
** by Berry Wong
** neu SE1507 20155108
*/

#include "head.h"
// 给指针参数制定的病患填写病历及相关信息 
void writecase(Patient * p){
	double price = 0;
	printf("请填写病历内容（不得超过150个字）：\n");
	scanf("%s",p->casehistory); 
	system("cls");
	printf("是否需要抽血化验？（1——是，其他任意键——否）\n");
	fflush(stdin);
	if (getchar() == '1') {
		price = 5;
		collect(price);
		p->transfusion = price ;
	}
	printf("是否需要手术？（1——是，其他任意键——否）\n");
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
// 用于病人的购药消费处理，参数为指向Patient类型的指针与指向Storage的指针
void buy(Patient * p, Storage * q){
	int num = 0;
 	printf("请输入购买数量：");
 	scanf("%d", &num);
 	if (num < q->amount) {
		p->cost += (num*q->price);
		q->amount -= num;
		printf("购买成功！按任意键返回！");	
 	}
	else
		printf("对不起，库存不足！按任意键返回") ; 
	fflush(stdin);
	getchar();
}
