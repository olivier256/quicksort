/* https://www.tutorialspoint.com/data_structures_algorithms/quick_sort_program_in_c.htm */


#include <assert.h>
#include <stdio.h>

#define false 0
#define true 1

#define N 7

void dispArray(int *, int);
void quickSort(int *, int, int);
int partition(int *, int, int, int);
void swap(int *, int, int);
int equalsArray(int *, int *, int);
void testQuickSort();

int main() {
	testQuickSort();
	printf("Tests OK\n");
	int t[N] = {4, 6, 3, 2, 1, 9, 7};
	dispArray(t, N);
	quickSort(t, 0, N-1);
	dispArray(t, N);
}

void dispArray(int *t, int len) {
	int i;
	for(i = 0;i < len;i++) {
		printf("%d ", t[i]);
	}
	printf("\n");
}

void quickSort(int *t, int left, int right) {
	if(right > left) {
		while (right > left) {
			int pivot = t[right];
			int partitionPoint = partition(t, left, right, pivot);
			quickSort(t, left, partitionPoint - 1);
			left = partitionPoint + 1;
		}
	}		  
}

int partition(int *t, int left, int right, int pivot) {
	int rightPointer = right;

	while (true) {
		while (t[left++] < pivot) ;
		left--;

		while (t[--rightPointer] > pivot) ;

		if (left < rightPointer) {
			swap(t, left, rightPointer);
		} else {
			break;
		}
	}
	
   swap(t, left, right);
   
   return left;
}


void swap(int *t, int i, int j) {
	int k = t[i];
	t[i] = t[j];
	t[j] = k;
}

int equalsArray(int *a, int *b, int len) {
	int i;
	for (i = 0; i < len; i++) {
		if (a[i] != b[i]) {
			dispArray(a, len);
			dispArray(b, len);
			return false;
		}
	}
	return true;
}

void testQuickSort() {
	int len = 1;
	int T1[1] = {4};
	int V1[1] = {4};
	quickSort(T1, 0, len - 1);
	assert(equalsArray(T1, V1, len));
	
	len = 2;
	int T2[2] = {4, 6};
	int V2[2] = {4, 6};
	quickSort(T2, 0, len - 1);
	assert(equalsArray(T2, V2, len));
	
	len = 3;
	int T3[3] = {4, 6, 3};
	int V3[3] = {3, 4, 6};
	quickSort(T3, 0, len - 1);
	assert(equalsArray(T3, V3, len));
	
	len = 4;
	int T4[4] = {4, 6, 3, 2};
	int V4[4] = {2, 3, 4, 6};
	quickSort(T4, 0, len - 1);
	assert(equalsArray(T4, V4, len));
	
	len = 5;
	int T5[5] = {4, 6, 3, 2, 1};
	int V5[5] = {1, 2, 3, 4, 6};
	quickSort(T5, 0, len - 1);
	assert(equalsArray(T5, V5, len));
	
	len = 6;
	int T6[6] = {4, 6, 3, 2, 1, 9};
	int V6[6] = {1, 2, 3, 4, 6, 9};
	quickSort(T6, 0, len - 1);
	assert(equalsArray(T6, V6, len));
	
	len = 7;
	int T7[7] = {4, 6, 3, 2, 1, 9, 7};
	int V7[7] = {1, 2, 3, 4, 6, 7, 9};
	quickSort(T7, 0, len - 1);
	assert(equalsArray(T7, V7, len));

}
