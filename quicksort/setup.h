#pragma once

#include <vector>
#include <algorithm>    
#include <random>
#include <functional>

// Setup quicksort data
namespace qsetup { 

	std::default_random_engine generator;
	int r = 100; // range
	int N = 100; // num. of samples

	std::vector<int> ground_truth;
	std::vector<int> test_array;

	void setup(){
		std::uniform_int_distribution<int> distribution(-r, r);
		auto dice = std::bind(distribution, generator);

		ground_truth = std::vector<int>(N);
		test_array = std::vector<int>(N);

		for (auto i = 0; i < N; i++) {
			int d = dice();
			test_array[i] = d;
			ground_truth[i] = d;
		}

		std::sort(ground_truth.begin(), ground_truth.end());
	}



}