// CP-LAB-01.CPP
// Computer Programming
// Lab Journal – Lab 1
// Name: Muhammad Taqui
// Enrollment #: 01-136221-021
// Class: BSAI 1A
// Topic: C++ programs using cout statement

#include <iostream>
using namespace std;

// Task 1: Output a simple message
void task1() {
    cout << "This is first  program in C++" << endl;
}

// Task 2: Print a triangle using single cout statement
void task2() {
    cout << "*\n**\n***\n****\n*****" << endl;
}

// Task 3: Display subject marks using tab
void task3() {
    cout << "subject\t\tmarks\n";
    cout << "mathematic\t90\n";
    cout << "computer\t77\n";
    cout << "chemistry\t69\n";
}

// Task 4: Print a hollow square
void task4() {
    cout << "********\n";
    cout << "*      *\n";
    cout << "*      *\n";
    cout << "********\n";
}

// Task 5: Use 'endl' manipulator to format output
void task5() {
    cout << "This is a text message" << endl;
    cout << "This is a" << endl;
    cout << "text message" << endl;
}

int main() {
    // Uncomment the task you want to run:
    // task1();
    // task2();
    // task3();
    // task4();
    task5(); // Task 5 enabled by default
    return 0;
}
