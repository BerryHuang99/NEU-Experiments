/* Hospital System
** by Berry Wong
** neu SE1507 20155108
*/

#include "head.h" 
main(){
	int i = 0, j = 0, k = 0, l = 0, m = 0, o = 0, n = 0, a = 0, key = 0, day = 0; 
	double price = 0, sum = 0;
	Patient* pf_1;
	Staff* pf_2;
	Storage* pf_3;
	system("color 1f");
	test();
	headp = load_1();
	heads = load_2();
	headm = load_3();
// menu1.0 
	while (1) {
		printf("***东北大学附属第一人民医院***\n") ;
		printf(" _____________________________\n") ;
		printf("|                             |\n") ;
		printf("|       请选择用户类型：      |\n") ;
		printf("|       1.病患                |\n") ;
		printf("|       2.医护人员            |\n") ;
		printf("|       3.管理员              |\n") ;
		printf("|     （其他任意键退出）      |\n") ;
		printf("|_____________________________|\n") ;
		j = getchar() ;
		system("cls") ;
		
		switch (j) {
	// menu2.1 
			case '1' :
				while (1) {
					printf(" _____________________________\n") ;
					printf("|                             |\n") ;
					printf("|    请选择您所需要的服务：   |\n") ;
					printf("|       1.门诊挂号            |\n") ;
					printf("|       2.急诊挂号            |\n") ;
					printf("|       3.住/出院手续         |\n") ;
					printf("|       4.买药                |\n") ;
					printf("|    （其他任意键返回）       |\n") ;
					printf("|_____________________________|\n") ;
					fflush(stdin) ;
					j = getchar() ; 
					system("cls") ; 
					
					switch (j) {
			// menu2.1.1
						case '1' :
							pp = add_1(headp) ; 
							printf(" _____________________________\n") ;
							printf("|                             |\n") ;
							printf("|     请选择挂号科室：        |\n") ;
							printf("|       1.内科                |\n") ;
							printf("|       2.外科                |\n") ;
							printf("|       3.妇产科              |\n") ;
							printf("|       4.儿科                |\n") ;
							printf("|    （其他任意键返回）       |\n") ;
							printf("|_____________________________|\n") ;
							fflush(stdin) ;
							j = getchar() ;
							
							switch (j) {
								case '1' :
									strcpy(pp->in_office, "内科") ;
									break ;
								case '2' :
									strcpy(pp->in_office, "外科") ;
									break ;
								case '3' :
									strcpy(pp->in_office, "妇产科") ;
									break ;
								case '4' :
									strcpy(pp->in_office, "儿科") ;
									break ;
								default :
									o = 1 ;
									break ;
							}
							
							if (!o){
								system("cls") ;
								price = 5.5 ;
								collect(price) ;
								pp->treat[0] = price ;
								pp->treat[1] = 0 ;
								pp->next = (Patient*)malloc(sizeof(Patient)) ;
								pp = pp->next ; 
								pp->next = NULL ;
								flag1 = 0 ;
								printf("挂号成功！按任意键返回！") ;
								fflush(stdin) ;
								getchar() ;
							}
							else
								o = 0 ;							
							break ;
			// menu2.1.2
						case '2' :
							pp = add_1(headp) ;
							strcpy(pp->in_office, "急诊" ) ;
							price = 20 ;
							collect(price) ;
							pp->treat[1] = price ;
							pp->treat[0] = 0 ;
							pp->next = (Patient*)malloc(sizeof(Patient));
							pp = pp->next ; 
							pp->next = NULL ;
							flag1 = 0 ; 
							printf("挂号成功！按任意键返回！") ;
							fflush(stdin) ;
							getchar() ;
							break ;
			// menu2.1.3
						case '3' :
							fflush(stdin) ;
							pf_1 = search_1(&headp) ;
							if (pf_1) {
								pf_1 = pf_1->next ;
								printf(" _____________________________\n") ;
								printf("|                             |\n") ;
								printf("|       1.办理住院手续        |\n") ;
								printf("|       2.办理出院手续        |\n") ;
								printf("|     （其他任意键返回）      |\n") ;
								printf("|_____________________________|\n") ;
								fflush(stdin) ;
								j = getchar() ;
								
								switch (j) {
									case '1' :
										if (pf_1->in_hos == 1) {
											printf("对不起，该病人已办理住院手续！按任意键返回！\n") ;
											fflush(stdin) ;
											getchar() ;
										}
										else{
											price = 50 ;
											printf("请输入住院天数：") ;
											scanf("%d", &day) ;
											price = ((double)day) * price ;
											collect(price) ;
											pf_1->in_hos = 1 ;
											printf("住院手续办理成功！请按任意键返回！\n") ;
											fflush(stdin) ;
											getchar() ;
										}
										break ;
									case '2' :
										if (pf_1->in_hos == 1) {
											pf_1->in_hos = 0 ;
											printf("出院手续办理成功\n") ;
										}
										else
											printf("对不起，该病人未曾入院！\n") ;
										break ;
								}	
							}
							else
								printf("对不起，没有相关病人的信息！按任意键返回！\n") ;
								fflush(stdin) ;
								getchar() ; 
							break ;
						case '4' :
							fflush(stdin) ;
							printf("请选择买药的病人：\n") ;
							pf_1 = search_1(&headp) ; 
							if (pf_1) {
								pf_1 = pf_1->next ;
								printf("请选择药品！\n") ;
								pf_3 = search_3(&headm) ;
								if(pf_3) {
									pf_3 = pf_3->next ;
									buy(pf_1, pf_3) ;
								}
								else
									printf("对不起！没有您所要购买的药品！请按任意键返回！") ;
									fflush(stdin) ;
									getchar() ; 
							}
							else{
								printf("对不起，没有相关病人的信息！按任意键返回\n") ;
						 		fflush(stdin) ;
								getchar() ;
							}
							break ;
						default :
							a = 1 ;
							break ; 
					}
					if (a)
						break ;
				}
				break ;
	// menu2.2
			case '2' :
				fflush(stdin) ;
				if (flag2) {
					printf("抱歉，没有注册医护人员信息！按任意键返回。\n") ;
					getchar();
					break ;
				}
				pf_2 = search_2(&heads) ; 
				if (pf_2){
					pf_2 = pf_2->next ;
					system("cls") ;
					printf("请输入密码：\n") ;
					if (password(pf_2->key)) {
						while (1){
							system("cls");
							printf(" _____________________________\n") ;
							printf("|                             |\n") ;
							printf("|      请选择工作项目：       |\n") ;
							printf("|       1.写病历、处方        |\n") ;
							printf("|       2.查询单个病患信息    |\n") ;
							printf("|       3.查看所有病患信息    |\n") ;
							printf("|       4.药品查询            |\n") ;
							printf("|    （其他任意键返回）       |\n") ;
							printf("|_____________________________|\n") ;
							fflush(stdin) ;
							j = getwchar() ;
							
							switch (j) {
			// menu2.2.1
								case '1' :
							 		printf("请选择病患：\n") ;
							 		pf_1 = search_1(&headp) ;
									if (pf_1) {
										pf_1 = pf_1->next ;
										writecase(pf_1) ;
										printf("病例填写完成！按任意键返回！\n") ; 
									} 
									else
										printf("病患信息不存在！按任意键返回！\n");
									fflush(stdin) ;
									getchar() ;
									break ;
			// menu2.2.2
								case '2' :
									printf("请选择病患：\n") ;
									pf_1 = search_1(&headp) ;
									if (pf_1) {
										pf_1 = pf_1->next ;
										sum = pf_1->treat[0] + pf_1->treat[1] + pf_1->cost + pf_1->transfusion + pf_1->cost + pf_1->surgery + pf_1->room ;
										printf("姓名 \t证件号 \t性别 \t年龄 \t科室 \t门诊挂号费 \t急诊挂号费 \t化验费 \t手术费 \t药费 \t住院费 \t总共花费 \t病历\n") ;
										printf("%s \t%s \t%s \t%d \t%s \t%g \t%g \t%g \t%g \t%g \t%g \t%g \t%s;\n", pf_1->name, pf_1->id, pf_1->gender, pf_1->age, pf_1->in_office, pf_1->treat[0], pf_1->treat[1], pf_1->transfusion, pf_1->surgery, pf_1->cost, pf_1->room, sum, pf_1->casehistory) ;
										printf("\n\n按任意键返回！\n") ;
									} 
									else
										printf("病患信息不存在！按任意键返回\n") ;
									fflush(stdin) ;
									getchar() ; 
									break ;
			// menu2.2.3
								case '3' :
									if(!flag1){
										listall_1(headp) ;
										printf("\n\n按任意键返回！") ;
									}
									else
										printf("不存在病人信息！按任意键返回！") ;
									fflush(stdin) ;
									getchar() ; 
									break ;
			// menu2.2.4
								case '4' :
									listall_3(headm) ;
									printf("\n\n按任意键返回！");
									fflush(stdin);
									getchar();
									break ;
								default :
									n = 1 ;
							}
							if (n)
									break ;
								else ;
						}
					}
					else ;
				}
				else
					printf("工号或姓名错误！按任意键返回！") ;
					fflush(stdin);
					getchar(); 
				break ;
	// menu2.3
			case '3' :
					while(1) {
					key = findkey() ;
					printf("管理员登录：\n");
					printf("请输入密码：") ; 
					if (password(key)) {
							system("cls");
							printf(" _____________________________\n") ;
							printf("|                             |\n") ;
							printf("|       请选择管理项目：      |\n") ;
							printf("|       1.药品管理            |\n") ;
							printf("|       2.医护人员信息管理    |\n") ;
							printf("|       3.病患信息管理        |\n") ;
							printf("|       4.管理员密码修改      |\n") ;
							printf("|     （其他任意键返回）      |\n") ;
							printf("|_____________________________|\n") ;
							fflush(stdin) ;
							j = getchar() ;
							system("cls") ;
							
							switch (j) {
			// menu2.3.1
								case '1' :
									printf(" ___________________________\n") ;
									printf("|                           |\n") ;
									printf("|        1.新增药品         |\n") ;
									printf("|        2.删除药品         |\n") ;
									printf("|        3.修改药品信息     |\n") ;
									printf("|      （其他任意键返回）   |\n") ;
									printf("|___________________________|\n") ;
									fflush(stdin) ;
									j = getchar() ;
									
									switch (j) {
										case '1' :
											pm = add_3(headm) ;
											pm->next = (Storage*)malloc(sizeof(Storage)) ;
											pm = pm->next ; 
											pm->next = NULL;
										 	printf("新增药品完毕！按任意键返回\n") ;
										 	fflush(stdin) ;
										 	getchar() ;
										 	break ;
									 	case '2' :
									 		printf("请选择药品：\n") ;
									 		pf_3 = search_3(&headm) ;
									 		if (pf_3){
			 									delete_3(pf_3) ;
			 									printf("删除成功！按任意键返回！\n") ; 
			 								}
			 								else
			 									printf("没有找到相关药品！按任意键返回！\n") ;
		 									fflush(stdin) ;
		 									getchar() ;
		 									break ;
	 									case '3' :
	 										printf("请选择药品：\n") ;
	 										pf_3 = search_3(&headm) ;
									 		if (pf_3){
									 			pf_3 = pf_3->next ;
									 			system("cls") ;
												printf(" ___________________________\n") ;
												printf("|                           |\n") ;
												printf("|        1.修改药名         |\n") ;
												printf("|        2.修改编码         |\n") ;
												printf("|        3.修改库存量       |\n") ;
												printf("|        3.修改价格         |\n") ;
												printf("|      （其他任意键返回）   |\n") ;
												printf("|___________________________|\n") ;
												fflush(stdin) ;
												
												switch (j) {
													case '1' :
														printf("请输入药名：") ;
														scanf("%s", pf_3->name) ;
														printf("修改成功！按任意键返回！\n") ; 
														fflush(stdin) ;
														getchar() ;
														break ;
													case '2' :
														printf("请输入编码：") ;
														scanf("%d", &pf_3->id) ;
														printf("修改成功！按任意键返回！\n") ;
														fflush(stdin) ;
														getchar() ;
														break ;
												 	case '3' :
												 		printf("请输入库存量：") ;
														scanf("%d", &pf_3->amount) ;
														printf("修改成功！按任意键返回！\n") ;
														fflush(stdin) ;
														getchar() ;
														break ;
												 	case '4' :
												 		printf("请输入单价：") ;
														scanf("%f", &pf_3->price) ;
														printf("修改成功！按任意键返回！\n") ;
														fflush(stdin) ;
														getchar() ;
														break ;
												 	default :
												 		break ;
												}
			 								}
			 								else
			 									printf("没有找到相关药品！") ;
		 									break ;
	 									default :
	 										break ;
									}
									break ;
			// menu2.3.2
								case '2' :
									printf(" ____________________________\n") ;
									printf("|                            |\n") ;
									printf("|      1.新增医护人员        |\n") ;
									printf("|      2.删除医护人员信息    |\n") ;
									printf("|      3.修改医护人员信息    |\n") ;
									printf("|      4.查看所有医护人员信息|\n") ;
									printf("|      （其他任意键返回）    |\n") ;
									printf("|____________________________|\n") ;
									fflush(stdin) ;
									j = getchar() ;
									system("cls") ;
									
									switch (j) {
										case '1' :
											ps = add_2(heads) ;
											ps->next = (Staff*)malloc(sizeof(Staff)) ;
											ps = ps->next ;
											ps->next = NULL ;
											flag2 = 0 ;
										 	printf("新增医护人员完毕！按任意键返回！\n") ;
										 	fflush(stdin) ;
										 	getchar() ;
										 	break ;
									 	case '2' :
									 		printf("请选择医护人员：\n") ;
									 		pf_2 = search_2(&heads);
									 		if (pf_2){
			 									delete_3(pf_2) ;
			 									printf("删除成功!按任意键返回！\n") ; 
			 								} 
			 								else
			 									printf("没有找到相关药品！按任意键返回！\n") ;
		 									fflush(stdin) ;
		 									getchar() ;
		 									break ;
	 									case '3' :
	 										printf("请选择医护人员：\n") ;
	 										pf_2 = search_2(&heads) ;
									 		if (pf_2) {
									 			pf_2 = pf_2->next ;
												printf(" ___________________________\n") ;
												printf("|                           |\n") ;
												printf("|        1.修改姓名         |\n") ;
												printf("|        2.修改工号         |\n") ;
												printf("|        3.修改密码         |\n") ;
												printf("|      （其他任意键返回）   |\n") ;
												printf("|___________________________|\n") ;
												fflush(stdin) ;
												
												switch (j) {
													case '1' :
														printf("请输入姓名：") ;
														scanf("%s", pf_2->name) ;
														printf("修改成功！按任意键返回！\n") ;
														fflush(stdin) ;
														getchar() ; 
														break ;
													case '2' :
														printf("请输入工号：") ;
														scanf("%d", &pf_2->id) ;
														printf("修改成功！按任意键返回！\n") ;
														fflush(stdin) ;
														getchar() ;
														break ;
												 	case '3' :
												 		pf_2->key = changekey() ; 
														printf("修改成功！按任意键返回！\n") ;
														fflush(stdin) ;
														getchar() ;
														break ;
												 	default :
												 		break ;
												}
			 								}
			 								else
			 									printf("没有找到相关人员！") ;
		 									break ;
	 									case '4':
	 										if (!flag2) {
										 		listall_2(heads) ;
										 		printf("\n\n按任意键返回！") ; 
										 	}
										 	else
										 		printf("没有登记医护人员信息！按任意键返回！\n") ;
									 		fflush(stdin) ;
									 		getchar() ;
									 		break ;
	 									default :
	 										break ;
									}
									break ;
			// menu2.3.3
								case '3' :
							 		printf("是否要删除单个病患信息？（1——是，其他任意键返回）") ;
							 		fflush(stdin) ;
							 		if (getchar() == 1){
			 							printf("请选择要删除的病患：\n") ;
			 							fflush(stdin) ;
			 							pf_1 = search_1(&headp) ;
			 							if (pf_1){
								 			delete_1(pf_1);
								 			printf("删除成功！按任意键返回！\n") ;
								 		}
								 		else
								 		 printf("对不起！查无此人！按任意键返回！\n") ;
							 		 fflush(stdin) ;
							 		 getchar() ;
			 						}
									break ;
								case '4' : 
									key = changekey () ;
									FILE * fp1 = fopen("key.txt", "w") ;
									fprintf(fp1, "%d", key) ;
									fclose(fp1) ;
									printf("密码修改成功\n") ;
									break ;
								default :
									m = 1 ;
									break ;
							}
							system("cls") ;
							}
							else m = 1;
							if (m) break ;
					}
				break ;
			default :
				k = 1 ;
				break ;
		} 
		fflush (stdin) ;
		if (k) break ;
		system ("cls") ;
	}
	printf("即将推出程序！是否保存当前所有信息？（1——是，其他任意键——否）\n");
	j = getchar();
	if (j == '1'){
		save_1(headp);
		save_2(heads);
		save_3(headm);
	}
	else{
		remove("data1");
		remove("data2");
		remove("storage");
	}
}
// test for the patient & staff & storage
void test(){
	FILE * fp = fopen("data1", "rb");
	if (!fp) {
		fp = fopen("data1", "wb");
		flag1 = 1;
	}
	else flag1 = 0;
	fclose(fp);
	
	fp = fopen("data2", "rb");
	if (!fp) {
		fp = fopen("data2", "wb");
		flag2 = 1;
	}
	else flag2 = 0;
	fclose(fp);
	
	fp = fopen("storage", "rb");
	if (!fp) {
		fp = fopen("storage", "wb");
		Storage * head = (Storage*)malloc(sizeof(Storage));
		head->next = (Storage*)malloc(sizeof(Storage));
		Storage * p = NULL;
		p = head->next;
		strcpy(p->name, "巴米尔");
		p->id = 1;
	 	p->amount = 20;
	 	p->price = 5;
	 	fwrite(p, sizeof(Storage), 1, fp);
	 	
	 	p->next = (Storage*)malloc(sizeof(Storage));
	 	p = p->next;
		strcpy(p->name, "感冒灵");
		p->id = 2;
	 	p->amount = 20;
	 	p->price = 9;
	 	fwrite(p, sizeof(Storage), 1, fp);
	 	
	 	p->next = (Storage*)malloc(sizeof(Storage));
	 	p = p->next;
		strcpy(p->name, "病毒唑");
		p->id = 3;
	 	p->amount = 10;
	 	p->price = 16;
	 	fwrite(p, sizeof(Storage), 1, fp);
	 	
	 	p->next = NULL;
	 	p = head ;
	 	while (p) {
	 		head = p->next ;
	 		free(p) ;
	 		p = head ;
	 	}
	}
	fclose(fp);
}
// collect fees
void collect(double price){
	double money=0;
	double change=0;
	double supple=0;
	printf("请缴费（%lg元）：",price);
	scanf("%lf",&money);
	while(money<price){
		printf("缴费金额不足，请继续缴费：");
		scanf("%lf",&supple);
		money=money+supple;
	}
	change=money-price;
	printf("收取RMB %lg 元，找零 %lg 元。\n",money,change);
}