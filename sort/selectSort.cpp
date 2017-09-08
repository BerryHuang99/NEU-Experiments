#include <iostream>
using namespace std;

void sort(int a[], int size);

int main() {
    int a[5];
    for (int i = 0; i < 5; i++) {
    	cin >> a[i];
    } 
    sort(a, 5);
    for (int i = 0; i < 5; i++) {
    	cout << a[i] << " ";
    } 
    return 0;
}

void sort(int a[], int size) {
    int min = 0;
    int t = 0;
    int i = 0;
    int j = 0;
    for (i = 0; i < size; i++) {
    	t = i;
        min = a[i];
        for (j = i + 1; j < size; j++) {
            if (min > a[j]) {
            	t = j;
                min = a[j];
            }
        }
        a[t] = a[i];
    	a[i] = min;
    }
}
