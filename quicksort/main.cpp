#include <iostream> 
#include <gtest\gtest.h>


extern "C" void quicksort(int* arr, int start, int end);


int main(int* argc, char** argv) {
	testing::InitGoogleTest();
	
	RUN_ALL_TESTS();

	return 0;
}