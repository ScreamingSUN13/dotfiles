// Test script for syntax highlighting
#include <iostream>
#include <vector>

class Shape {
public:
    virtual double area() const = 0;
};

int main() {
    std::vector<int> nums = {1, 2, 3};
    for (const auto& n : nums) {
        std::cout << "Value: " << n << std::endl;
    }
    return 0;
}
