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
		printf("***������ѧ������һ����ҽԺ***\n") ;
		printf(" _____________________________\n") ;
		printf("|                             |\n") ;
		printf("|       ��ѡ���û����ͣ�      |\n") ;
		printf("|       1.����                |\n") ;
		printf("|       2.ҽ����Ա            |\n") ;
		printf("|       3.����Ա              |\n") ;
		printf("|     ������������˳���      |\n") ;
		printf("|_____________________________|\n") ;
		j = getchar() ;
		system("cls") ;
		
		switch (j) {
	// menu2.1 
			case '1' :
				while (1) {
					printf(" _____________________________\n") ;
					printf("|                             |\n") ;
					printf("|    ��ѡ��������Ҫ�ķ���   |\n") ;
					printf("|       1.����Һ�            |\n") ;
					printf("|       2.����Һ�            |\n") ;
					printf("|       3.ס/��Ժ����         |\n") ;
					printf("|       4.��ҩ                |\n") ;
					printf("|    ��������������أ�       |\n") ;
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
							printf("|     ��ѡ��Һſ��ң�        |\n") ;
							printf("|       1.�ڿ�                |\n") ;
							printf("|       2.���                |\n") ;
							printf("|       3.������              |\n") ;
							printf("|       4.����                |\n") ;
							printf("|    ��������������أ�       |\n") ;
							printf("|_____________________________|\n") ;
							fflush(stdin) ;
							j = getchar() ;
							
							switch (j) {
								case '1' :
									strcpy(pp->in_office, "�ڿ�") ;
									break ;
								case '2' :
									strcpy(pp->in_office, "���") ;
									break ;
								case '3' :
									strcpy(pp->in_office, "������") ;
									break ;
								case '4' :
									strcpy(pp->in_office, "����") ;
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
								printf("�Һųɹ�������������أ�") ;
								fflush(stdin) ;
								getchar() ;
							}
							else
								o = 0 ;							
							break ;
			// menu2.1.2
						case '2' :
							pp = add_1(headp) ;
							strcpy(pp->in_office, "����" ) ;
							price = 20 ;
							collect(price) ;
							pp->treat[1] = price ;
							pp->treat[0] = 0 ;
							pp->next = (Patient*)malloc(sizeof(Patient));
							pp = pp->next ; 
							pp->next = NULL ;
							flag1 = 0 ; 
							printf("�Һųɹ�������������أ�") ;
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
								printf("|       1.����סԺ����        |\n") ;
								printf("|       2.�����Ժ����        |\n") ;
								printf("|     ��������������أ�      |\n") ;
								printf("|_____________________________|\n") ;
								fflush(stdin) ;
								j = getchar() ;
								
								switch (j) {
									case '1' :
										if (pf_1->in_hos == 1) {
											printf("�Բ��𣬸ò����Ѱ���סԺ����������������أ�\n") ;
											fflush(stdin) ;
											getchar() ;
										}
										else{
											price = 50 ;
											printf("������סԺ������") ;
											scanf("%d", &day) ;
											price = ((double)day) * price ;
											collect(price) ;
											pf_1->in_hos = 1 ;
											printf("סԺ��������ɹ����밴��������أ�\n") ;
											fflush(stdin) ;
											getchar() ;
										}
										break ;
									case '2' :
										if (pf_1->in_hos == 1) {
											pf_1->in_hos = 0 ;
											printf("��Ժ��������ɹ�\n") ;
										}
										else
											printf("�Բ��𣬸ò���δ����Ժ��\n") ;
										break ;
								}	
							}
							else
								printf("�Բ���û����ز��˵���Ϣ������������أ�\n") ;
								fflush(stdin) ;
								getchar() ; 
							break ;
						case '4' :
							fflush(stdin) ;
							printf("��ѡ����ҩ�Ĳ��ˣ�\n") ;
							pf_1 = search_1(&headp) ; 
							if (pf_1) {
								pf_1 = pf_1->next ;
								printf("��ѡ��ҩƷ��\n") ;
								pf_3 = search_3(&headm) ;
								if(pf_3) {
									pf_3 = pf_3->next ;
									buy(pf_1, pf_3) ;
								}
								else
									printf("�Բ���û������Ҫ�����ҩƷ���밴��������أ�") ;
									fflush(stdin) ;
									getchar() ; 
							}
							else{
								printf("�Բ���û����ز��˵���Ϣ�������������\n") ;
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
					printf("��Ǹ��û��ע��ҽ����Ա��Ϣ������������ء�\n") ;
					getchar();
					break ;
				}
				pf_2 = search_2(&heads) ; 
				if (pf_2){
					pf_2 = pf_2->next ;
					system("cls") ;
					printf("���������룺\n") ;
					if (password(pf_2->key)) {
						while (1){
							system("cls");
							printf(" _____________________________\n") ;
							printf("|                             |\n") ;
							printf("|      ��ѡ������Ŀ��       |\n") ;
							printf("|       1.д����������        |\n") ;
							printf("|       2.��ѯ����������Ϣ    |\n") ;
							printf("|       3.�鿴���в�����Ϣ    |\n") ;
							printf("|       4.ҩƷ��ѯ            |\n") ;
							printf("|    ��������������أ�       |\n") ;
							printf("|_____________________________|\n") ;
							fflush(stdin) ;
							j = getwchar() ;
							
							switch (j) {
			// menu2.2.1
								case '1' :
							 		printf("��ѡ�񲡻���\n") ;
							 		pf_1 = search_1(&headp) ;
									if (pf_1) {
										pf_1 = pf_1->next ;
										writecase(pf_1) ;
										printf("������д��ɣ�����������أ�\n") ; 
									} 
									else
										printf("������Ϣ�����ڣ�����������أ�\n");
									fflush(stdin) ;
									getchar() ;
									break ;
			// menu2.2.2
								case '2' :
									printf("��ѡ�񲡻���\n") ;
									pf_1 = search_1(&headp) ;
									if (pf_1) {
										pf_1 = pf_1->next ;
										sum = pf_1->treat[0] + pf_1->treat[1] + pf_1->cost + pf_1->transfusion + pf_1->cost + pf_1->surgery + pf_1->room ;
										printf("���� \t֤���� \t�Ա� \t���� \t���� \t����Һŷ� \t����Һŷ� \t����� \t������ \tҩ�� \tסԺ�� \t�ܹ����� \t����\n") ;
										printf("%s \t%s \t%s \t%d \t%s \t%g \t%g \t%g \t%g \t%g \t%g \t%g \t%s;\n", pf_1->name, pf_1->id, pf_1->gender, pf_1->age, pf_1->in_office, pf_1->treat[0], pf_1->treat[1], pf_1->transfusion, pf_1->surgery, pf_1->cost, pf_1->room, sum, pf_1->casehistory) ;
										printf("\n\n����������أ�\n") ;
									} 
									else
										printf("������Ϣ�����ڣ������������\n") ;
									fflush(stdin) ;
									getchar() ; 
									break ;
			// menu2.2.3
								case '3' :
									if(!flag1){
										listall_1(headp) ;
										printf("\n\n����������أ�") ;
									}
									else
										printf("�����ڲ�����Ϣ������������أ�") ;
									fflush(stdin) ;
									getchar() ; 
									break ;
			// menu2.2.4
								case '4' :
									listall_3(headm) ;
									printf("\n\n����������أ�");
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
					printf("���Ż��������󣡰���������أ�") ;
					fflush(stdin);
					getchar(); 
				break ;
	// menu2.3
			case '3' :
					while(1) {
					key = findkey() ;
					printf("����Ա��¼��\n");
					printf("���������룺") ; 
					if (password(key)) {
							system("cls");
							printf(" _____________________________\n") ;
							printf("|                             |\n") ;
							printf("|       ��ѡ�������Ŀ��      |\n") ;
							printf("|       1.ҩƷ����            |\n") ;
							printf("|       2.ҽ����Ա��Ϣ����    |\n") ;
							printf("|       3.������Ϣ����        |\n") ;
							printf("|       4.����Ա�����޸�      |\n") ;
							printf("|     ��������������أ�      |\n") ;
							printf("|_____________________________|\n") ;
							fflush(stdin) ;
							j = getchar() ;
							system("cls") ;
							
							switch (j) {
			// menu2.3.1
								case '1' :
									printf(" ___________________________\n") ;
									printf("|                           |\n") ;
									printf("|        1.����ҩƷ         |\n") ;
									printf("|        2.ɾ��ҩƷ         |\n") ;
									printf("|        3.�޸�ҩƷ��Ϣ     |\n") ;
									printf("|      ��������������أ�   |\n") ;
									printf("|___________________________|\n") ;
									fflush(stdin) ;
									j = getchar() ;
									
									switch (j) {
										case '1' :
											pm = add_3(headm) ;
											pm->next = (Storage*)malloc(sizeof(Storage)) ;
											pm = pm->next ; 
											pm->next = NULL;
										 	printf("����ҩƷ��ϣ������������\n") ;
										 	fflush(stdin) ;
										 	getchar() ;
										 	break ;
									 	case '2' :
									 		printf("��ѡ��ҩƷ��\n") ;
									 		pf_3 = search_3(&headm) ;
									 		if (pf_3){
			 									delete_3(pf_3) ;
			 									printf("ɾ���ɹ�������������أ�\n") ; 
			 								}
			 								else
			 									printf("û���ҵ����ҩƷ������������أ�\n") ;
		 									fflush(stdin) ;
		 									getchar() ;
		 									break ;
	 									case '3' :
	 										printf("��ѡ��ҩƷ��\n") ;
	 										pf_3 = search_3(&headm) ;
									 		if (pf_3){
									 			pf_3 = pf_3->next ;
									 			system("cls") ;
												printf(" ___________________________\n") ;
												printf("|                           |\n") ;
												printf("|        1.�޸�ҩ��         |\n") ;
												printf("|        2.�޸ı���         |\n") ;
												printf("|        3.�޸Ŀ����       |\n") ;
												printf("|        3.�޸ļ۸�         |\n") ;
												printf("|      ��������������أ�   |\n") ;
												printf("|___________________________|\n") ;
												fflush(stdin) ;
												
												switch (j) {
													case '1' :
														printf("������ҩ����") ;
														scanf("%s", pf_3->name) ;
														printf("�޸ĳɹ�������������أ�\n") ; 
														fflush(stdin) ;
														getchar() ;
														break ;
													case '2' :
														printf("��������룺") ;
														scanf("%d", &pf_3->id) ;
														printf("�޸ĳɹ�������������أ�\n") ;
														fflush(stdin) ;
														getchar() ;
														break ;
												 	case '3' :
												 		printf("������������") ;
														scanf("%d", &pf_3->amount) ;
														printf("�޸ĳɹ�������������أ�\n") ;
														fflush(stdin) ;
														getchar() ;
														break ;
												 	case '4' :
												 		printf("�����뵥�ۣ�") ;
														scanf("%f", &pf_3->price) ;
														printf("�޸ĳɹ�������������أ�\n") ;
														fflush(stdin) ;
														getchar() ;
														break ;
												 	default :
												 		break ;
												}
			 								}
			 								else
			 									printf("û���ҵ����ҩƷ��") ;
		 									break ;
	 									default :
	 										break ;
									}
									break ;
			// menu2.3.2
								case '2' :
									printf(" ____________________________\n") ;
									printf("|                            |\n") ;
									printf("|      1.����ҽ����Ա        |\n") ;
									printf("|      2.ɾ��ҽ����Ա��Ϣ    |\n") ;
									printf("|      3.�޸�ҽ����Ա��Ϣ    |\n") ;
									printf("|      4.�鿴����ҽ����Ա��Ϣ|\n") ;
									printf("|      ��������������أ�    |\n") ;
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
										 	printf("����ҽ����Ա��ϣ�����������أ�\n") ;
										 	fflush(stdin) ;
										 	getchar() ;
										 	break ;
									 	case '2' :
									 		printf("��ѡ��ҽ����Ա��\n") ;
									 		pf_2 = search_2(&heads);
									 		if (pf_2){
			 									delete_3(pf_2) ;
			 									printf("ɾ���ɹ�!����������أ�\n") ; 
			 								} 
			 								else
			 									printf("û���ҵ����ҩƷ������������أ�\n") ;
		 									fflush(stdin) ;
		 									getchar() ;
		 									break ;
	 									case '3' :
	 										printf("��ѡ��ҽ����Ա��\n") ;
	 										pf_2 = search_2(&heads) ;
									 		if (pf_2) {
									 			pf_2 = pf_2->next ;
												printf(" ___________________________\n") ;
												printf("|                           |\n") ;
												printf("|        1.�޸�����         |\n") ;
												printf("|        2.�޸Ĺ���         |\n") ;
												printf("|        3.�޸�����         |\n") ;
												printf("|      ��������������أ�   |\n") ;
												printf("|___________________________|\n") ;
												fflush(stdin) ;
												
												switch (j) {
													case '1' :
														printf("������������") ;
														scanf("%s", pf_2->name) ;
														printf("�޸ĳɹ�������������أ�\n") ;
														fflush(stdin) ;
														getchar() ; 
														break ;
													case '2' :
														printf("�����빤�ţ�") ;
														scanf("%d", &pf_2->id) ;
														printf("�޸ĳɹ�������������أ�\n") ;
														fflush(stdin) ;
														getchar() ;
														break ;
												 	case '3' :
												 		pf_2->key = changekey() ; 
														printf("�޸ĳɹ�������������أ�\n") ;
														fflush(stdin) ;
														getchar() ;
														break ;
												 	default :
												 		break ;
												}
			 								}
			 								else
			 									printf("û���ҵ������Ա��") ;
		 									break ;
	 									case '4':
	 										if (!flag2) {
										 		listall_2(heads) ;
										 		printf("\n\n����������أ�") ; 
										 	}
										 	else
										 		printf("û�еǼ�ҽ����Ա��Ϣ������������أ�\n") ;
									 		fflush(stdin) ;
									 		getchar() ;
									 		break ;
	 									default :
	 										break ;
									}
									break ;
			// menu2.3.3
								case '3' :
							 		printf("�Ƿ�Ҫɾ������������Ϣ����1�����ǣ�������������أ�") ;
							 		fflush(stdin) ;
							 		if (getchar() == 1){
			 							printf("��ѡ��Ҫɾ���Ĳ�����\n") ;
			 							fflush(stdin) ;
			 							pf_1 = search_1(&headp) ;
			 							if (pf_1){
								 			delete_1(pf_1);
								 			printf("ɾ���ɹ�������������أ�\n") ;
								 		}
								 		else
								 		 printf("�Բ��𣡲��޴��ˣ�����������أ�\n") ;
							 		 fflush(stdin) ;
							 		 getchar() ;
			 						}
									break ;
								case '4' : 
									key = changekey () ;
									FILE * fp1 = fopen("key.txt", "w") ;
									fprintf(fp1, "%d", key) ;
									fclose(fp1) ;
									printf("�����޸ĳɹ�\n") ;
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
	printf("�����Ƴ������Ƿ񱣴浱ǰ������Ϣ����1�����ǣ����������������\n");
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
		strcpy(p->name, "���׶�");
		p->id = 1;
	 	p->amount = 20;
	 	p->price = 5;
	 	fwrite(p, sizeof(Storage), 1, fp);
	 	
	 	p->next = (Storage*)malloc(sizeof(Storage));
	 	p = p->next;
		strcpy(p->name, "��ð��");
		p->id = 2;
	 	p->amount = 20;
	 	p->price = 9;
	 	fwrite(p, sizeof(Storage), 1, fp);
	 	
	 	p->next = (Storage*)malloc(sizeof(Storage));
	 	p = p->next;
		strcpy(p->name, "������");
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
	printf("��ɷѣ�%lgԪ����",price);
	scanf("%lf",&money);
	while(money<price){
		printf("�ɷѽ��㣬������ɷѣ�");
		scanf("%lf",&supple);
		money=money+supple;
	}
	change=money-price;
	printf("��ȡRMB %lg Ԫ������ %lg Ԫ��\n",money,change);
}