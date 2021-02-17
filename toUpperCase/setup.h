#pragma once

#include <vector>
#include <algorithm>    
#include <random>
#include <functional>

// Setup quicksort data
namespace qsetup { 

	int N = 256; // run through all ascii characters

	std::vector<char> ground_truth;
	std::vector<char> test_array;

	void setup(){

		ground_truth = std::vector<char>(N);
		test_array = std::vector<char>(N);

		for (auto i = 1; i < N; i++) {
			test_array[i] = i;
			ground_truth[i] = (i < 'a' || i > 'z') ? i : i-32;
		}
	}



}