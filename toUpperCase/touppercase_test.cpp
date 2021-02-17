#include "gtest/gtest.h"
#include <random>
#include "setup.h"

extern "C" char* toUpperCase(char* arr, int n);
TEST(ToUpperCase_test, validation) {
    
    qsetup::setup();
    EXPECT_NE(qsetup::ground_truth, qsetup::test_array);

    // try to uppercase all ascii characters
    // characters 'a'-'z' will be changed to uppercase characters, the rest will be unaffected
    toUpperCase(qsetup::test_array.data(), 255); 

    EXPECT_EQ(qsetup::ground_truth, qsetup::test_array);
}