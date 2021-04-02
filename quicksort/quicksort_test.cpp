#include "gtest/gtest.h"
#include <random>
#include "setup.h"

extern "C" void quicksort(int* arr, int start, int end);
TEST(Quicksort_test, validation) {
    

    qsetup::setup();
    EXPECT_NE(qsetup::ground_truth, qsetup::test_array);

    quicksort(qsetup::test_array.data(), 0, qsetup::N-1);

    EXPECT_EQ(qsetup::ground_truth, qsetup::test_array);
    EXPECT_TRUE(true);

}