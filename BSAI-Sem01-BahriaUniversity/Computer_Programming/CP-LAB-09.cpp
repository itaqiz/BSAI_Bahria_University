
// CP-LAB-09.CPP
// Fundamentals of Programming
// Lab Journal - Lab # 9
// Name: Muhammad Taqui
// Enrollment #: 01-136221-021
// Class: BSAI(1A)
// Objective: This lab introduces user-defined functions in C++.

#include <iostream>
#include <iomanip>
using namespace std;

// ==========================
// Exercise 1
// ==========================

/*
Q1: Write the declaration/prototype of a function named: power. 
This function computes x^n and returns a value.
*/
int power(int a, int n);

/*
Q2: Write the function call for a function whose prototype is: int factorial(int);
*/
int factorial(int x); // Prototype

/*
Q3: Which of these are valid function declarations/prototypes?
a. void function();               // Valid
b. void function(void);          // Valid in C++, invalid in C
c. void function(int);           // Valid
d. void function(int, char);     // Valid
e. function(int);                // Not Valid
f. int function();               // Valid
g. int function(int, float);     // Valid
*/

// ==========================
// Exercise 2
// ==========================

/*
Q1: Function to compute square of a number and print squares of even numbers from 0 to 8
*/
int square(int a) {
    return a * a;
}

/*
Q2: Function to find minimum of two numbers
*/
int minimum(int a, int b) {
    return (a < b) ? a : b;
}

/*
Q3: Call by value demo - No actual change in x and y
*/
void duplicate_val(int a, int b) {
    a *= 2;
    b *= 2;
}

/*
Q4: Call by reference demo - Actual change in x and y
*/
void duplicate_ref(int &a, int &b) {
    a *= 2;
    b *= 2;
}

/*
Q5: Increment by reference to actually change the variable
*/
void increment(int &x) {
    x++;
    cout << "Inside function: " << x << endl;
}

/*
Q6: Show marks using 3 different parameters
*/
void ShowMarks(int marks, float percentage, char grade) {
    cout << "Your marks are : " << marks << endl;
    cout << "Your percentage is : " << percentage << endl;
    cout << "Your grade is : " << grade << endl;
}

/*
Q7: Display info using setw. (Customized for Muhammad Taqui)
*/
void display() {
    cout << setw(10) << "Welcome to my Program!\n";
    cout << "I'm Muhammad Taqui. I'm proud to be a programmer.\n";
    cout << "This is my Computer Programming Lab 11\n";
}

/*
Q8: Modify menu function to return user choice and display it in main
*/
int menu(int a);
void menu1();
void menu2();

// ==========================
// Exercise 3
// ==========================
/*
Program to compute area of rectangle using a function
*/
float Area(float width, float height) {
    return width * height;
}

// ==========================
// Exercise 4
// ==========================
/*
Divide two integers, if denominator is 0 return -1
*/
int safeDivide(int a, int b) {
    if (b == 0)
        return -1;
    return a / b;
}

// ==========================
// Exercise 5
// ==========================
/*
Return smallest of three float values
*/
float smallest(float a, float b, float c) {
    float min = a;
    if (b < min) min = b;
    if (c < min) min = c;
    return min;
}

// ==========================
// Exercise 6
// ==========================
/*
Swap two integers by reference
*/
void swap(int &a, int &b) {
    int temp = a;
    a = b;
    b = temp;
}

// ==========================
// MAIN FUNCTION
// ==========================
int main() {
    // Exercise 1.1 – power prototype already defined above

    // Exercise 1.2 – Factorial function call
    int x = 5;
    cout << "Factorial of " << x << " is: " << factorial(x) << endl;

    // Exercise 2.1 – Square function output
    cout << "Squares of even numbers from 0 to 8:\n";
    for (int i = 0; i < 10; i += 2)
        cout << square(i) << endl;

    // Exercise 2.2 – Minimum of two numbers
    int a = 10, b = 5;
    cout << "Minimum is: " << minimum(a, b) << endl;

    // Exercise 2.3 – Call by value
    int p = 1, q = 3;
    duplicate_val(p, q);
    cout << "After call by value: x=" << p << ", y=" << q << endl;

    // Exercise 2.4 – Call by reference
    duplicate_ref(p, q);
    cout << "After call by reference: x=" << p << ", y=" << q << endl;

    // Exercise 2.5 – Increment by reference
    int z = 10;
    cout << "Before increment: " << z << endl;
    increment(z);
    cout << "After increment: " << z << endl;

    // Exercise 2.6 – Show marks
    ShowMarks(75, 74.7, 'B');

    // Exercise 2.7 – Display with setw
    display();

    // Exercise 2.8 – Menu modification
    int category, choice;
    cout << "Press 1 for Eatables Menu" << endl;
    cout << "Press 2 for Drinks Menu" << endl;
    cin >> category;
    choice = menu(category);
    cout << "You selected option: " << choice << endl;

    // Exercise 3 – Area of rectangle
    float width, height;
    cout << "Enter width and height of rectangle: ";
    cin >> width >> height;
    cout << "Area of rectangle: " << Area(width, height) << endl;

    // Exercise 4 – Safe division
    int num1 = 10, num2 = 0;
    int result = safeDivide(num1, num2);
    if (result == -1)
        cout << "Cannot divide by zero!" << endl;
    else
        cout << "Result of division: " << result << endl;

    // Exercise 5 – Smallest of 3 floats
    float f1 = 5.4, f2 = 3.1, f3 = 7.2;
    cout << "Smallest value: " << smallest(f1, f2, f3) << endl;

    // Exercise 6 – Swap two numbers
    int n1 = 4, n2 = 7;
    cout << "Before swap: n1=" << n1 << ", n2=" << n2 << endl;
    swap(n1, n2);
    cout << "After swap: n1=" << n1 << ", n2=" << n2 << endl;

    return 0;
}

// ==========================
// Additional Function Definitions
// ==========================

// Exercise 1.2 – Factorial function definition
int factorial(int x) {
    if (x <= 1) return 1;
    return x * factorial(x - 1);
}

// Modified menu to return user's choice
int menu(int a) {
    cout << "Welcome to our Cafe!\n";
    int choice;
    if (a == 1) {
        menu1();
    } else {
        menu2();
    }
    cin >> choice;
    return choice;
}

void menu1() {
    cout << "Displaying our first menu.\n";
    cout << "Please choose from following.\n";
    cout << "Press 1 for burgers\n";
    cout << "Press 2 for sandwiches\n";
    cout << "Press 3 for pizza\n";
}

void menu2() {
    cout << "Displaying our second menu.\n";
    cout << "Please choose from following.\n";
    cout << "Press 1 for Cold Drinks\n";
    cout << "Press 2 for Fresh Shakes\n";
    cout << "Press 3 for Fresh Juices\n";
}
