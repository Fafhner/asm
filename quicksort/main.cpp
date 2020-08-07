#include <iostream>
#include <vector>
#include <algorithm>    
#include <gtest\gtest.h>
#include <random>

extern "C" void quicksort(int* arr, int start, int end);


int main(int* argc, char** argv) {
	testing::InitGoogleTest();
	
	RUN_ALL_TESTS();

	return 0;
}