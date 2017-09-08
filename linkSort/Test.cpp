// @auther Berry Huang
// @since 2017.04.23

#include "List.h"
using namespace std;

int main()
{
	List<int> testList;
	int num = 0;
	int a = 0;
	cout << "How many integer do you want to put in ?" << endl;
	cin >> num;
	cout << "Please put numbers orderly !" << endl;
	
	// Put numbers in the list
	for (int i = 0; i < num; i++) {
		cin >> a;
		testList.add(a);
	}

	while(1)
	{
		cout << " __________________________________\n"
			 << "|           choose service:        |\n"
			 << "|     1. Get the minimum element   |\n"
			 << "|     2. Reserve with recursion    |\n"
			 << "|     3. Reserve with unrecursion  |\n"
			 << "|__________________________________|"
			 << endl;
			 
		int j = 0;
		cin >> j;
		switch (j) {
			case 1:
				// Get the node which has the minimum value 
			{
				Node<int> *min = NULL;
				min = testList.getMin();
				int m = 0;
				m = min->getValue();
				cout << "\nThe minimum number is:  " << m << endl;
			}
				break;
			
			case 2:
				// Reserve the list with recursion
				testList.reverse_1();
				testList.printList();
				break;
			
			case 3:
		 		// Reverse the list with unrecursion
		 		testList.reverse_2();
		 		testList.printList();
		 		break;
			default :
				return 0;
		}
	}
}
