#include <iostream>
using namespace std;

void sort(int a[], int size);

int main() {
	int a[5];
	int i = 0;
	for (i = 0; i < 5; i++) {
		cin >> a[i];
	}
	sort(a, 5);
	for (i = 0; i < 5; i++) {
		cout << a[i];
	}
	return 0;
} 

void sort(int a[], int size) {
	int t = 0;
	for (int i = 0; i <size; i++) {
		for (int j = i + 1; j < size; j++) {
			if (a[i] > a[j]) {
				t = a[i];
				a[i] = a[j];
				a[j] = t;
			}
		}
	}
}
