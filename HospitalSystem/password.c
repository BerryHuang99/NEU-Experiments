/* Hospital System
** by Berry Wong
** neu SE1507 20155108
*/

#include "head.h"
// 查找是否存在保存的密钥文件，若不存在则生成文件并且初始化密码为123456并保存 
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
// 提供三次检测输入密码正确与否 
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
			printf("密码错误，按任意键返回重新输入！\n") ;
			getchar() ;
		}
	} while (i < 3);
	
	if (i == 3) {
		printf("对不起，三次输入密码错误！请按任意键返回！");
		getchar();
	}
	return re;
}
// 修改密码 
int changekey(){
	int key1 = 0, key2 = 0;
	while (1) {
		printf("请输入新密码：") ;
		scanf("%d", &key1) ;
		printf("请再次输入确认密码：") ;
		scanf("%d", &key2) ;
		if (key1 != key2) {
			printf("对不起，两次输入的密码不同，请重新输入：\n") ;
			continue ;
		}
		break ;
	}
	return key1;
} 