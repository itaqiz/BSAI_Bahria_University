// CP-LAB-11.CPP
// Computer Programming Lab
// Lab Journal - 11
// Name: Muhammad Taqui
// Enrollment #: 01-136221-021
// Class: BSAI(1A)
// Topic: Structures

#include <iostream>
#include <iomanip>
#include <string>
using namespace std;

// ----------------------------
// Task 1 - Code Fragments
// ----------------------------

// 1. Declare a structure 'Time' with fields hour, minute, second.
struct Time {
    int hours;
    int minutes;
    float seconds;
};

// 2. Declare a variable of type 'Time'
void declareTimeVar() {
    Time t;
}

// 3. Declare a variable, a pointer, and an array of Time objects.
void declareTimePointers() {
    Time t;
    Time *ptr = &t;
    Time arr[10];
}

// 4. Set values using the pointer
void setTimeValues() {
    Time t;
    Time *ptr = &t;
    ptr->hours = 5;
    ptr->minutes = 10;
    ptr->seconds = 50;
}

// ----------------------------
// Task 2 - Exercise 1
// ----------------------------

struct Rectangle {
    int length;
    int width;
};

int computeArea(int x, int y) {
    return x * y;
}

void rectangleArea() {
    Rectangle point;
    cout << "Enter the length of rectangle: ";
    cin >> point.length;
    cout << "Enter the width of rectangle: ";
    cin >> point.width;
    cout << "Area of rectangle = " << computeArea(point.length, point.width) << endl;
}

// ----------------------------
// Task 2 - Exercise 2
// ----------------------------

struct TimeSimple {
    int hrs;
    int mins;
};

struct Flight {
    string Flight_ID;
    TimeSimple Arrival_time;
    TimeSimple Departure_time;
};

void input(Flight* F) {
    cout << "Enter flight ID: ";
    cin >> F->Flight_ID;
    cout << "Arrival Time of flight:" << endl;
    cout << "Enter hrs: ";
    cin >> F->Arrival_time.hrs;
    cout << "Enter mins: ";
    cin >> F->Arrival_time.mins;
    cout << "Departure Time of flight:" << endl;
    cout << "Enter hrs: ";
    cin >> F->Departure_time.hrs;
    cout << "Enter mins: ";
    cin >> F->Departure_time.mins;
}

void display(const Flight* f1) {
    cout << "Data for flight:" << endl;
    cout << "Flight ID: " << f1->Flight_ID << endl;
    cout << "Departure Time: " << f1->Departure_time.hrs << ":" << f1->Departure_time.mins << endl;
    cout << "Arrival Time: " << f1->Arrival_time.hrs << ":" << f1->Arrival_time.mins << endl;
}

// ----------------------------
// Main Function
// ----------------------------

int main() {
    // Task 1 tests (Uncomment if needed)
    // declareTimeVar();
    // declareTimePointers();
    // setTimeValues();

    // Task 2 - Exercise 1
    // rectangleArea();

    // Task 2 - Exercise 2
    Flight f;
    input(&f);
    display(&f);

    return 0;
}
