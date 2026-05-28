// CP-LAB-05.CPP
// Computer Programming Lab
// Lab Journal - 5
// Name: Muhammad Taqui
// Enrollment #: 01-136221-021
// Date: 17-April-2022
// Objective:
// 1) Understanding Looping Statements
// 2) Practicing for repetition structures
// 3) Practicing nested for repetition structures

#include <iostream>
using namespace std;

// Task 1.1 - Power Calculation Using For Loop
void task1_1() {
    int x = 2, y = 3, result = 1;
    for (int i = 0; i < y; i++) {
        result *= x;
    }
    cout << result << endl;
}

// Task 1.2 - For Loop Without Initialization & Increment
void task1_2() {
    int num = 1;
    for (; num <= 10;) {
        cout << num << " ";
        num++;
    }
}

// Task 1.3 - Nested Loop for Rectangle of Stars
void task1_3() {
    for (int i = 1; i <= 3; i++) {
        for (int j = 1; j <= 4; j++)
            cout << "*";
        cout << endl;
    }
}

// Task 1.4 - Triple Nested Loop Example
void task1_4() {
    for (int i = 1; i <= 2; i++) {
        for (int j = 1; j <= 2; j++) {
            for (int k = 1; k <= 3; k++)
                cout << "*";
            cout << endl;
        }
        cout << endl;
    }
}

// Task 1.5 - Cube Calculation Using For Loop (Converted from Do-While)
void task1_5() {
    int cube;
    for (int numb = 1; numb < 30; numb++) {
        cube = numb * numb * numb;
        cout << "Number is: " << numb << " Cube is: " << cube << endl;
    }
}

// Task 1.6 - ASCII to Char
void task1_6() {
    int a = 97;
    cout << (char)a << endl;
}

// Task 2 - Multiplication Table
void task2() {
    int numb;
    cout << "Enter the number: ";
    cin >> numb;
    for (int i = 1; i <= 10; i++) {
        cout << numb << " x " << i << " = " << numb * i << endl;
    }
}

// Task 3 - Even Numbers from Range
void task3() {
    int start, end;
    cout << "Input starting integer: ";
    cin >> start;
    cout << "Input ending integer: ";
    cin >> end;
    cout << "Even numbers are: ";
    for (int i = start; i <= end; i++) {
        if (i % 2 == 0)
            cout << i << " ";
    }
    cout << endl;
}

// Task 4 - Alphabet Pyramid
void task4() {
    for (char i = 'A'; i <= 'E'; i++) {
        for (char j = 'A'; j <= i; j++) {
            cout << i << " ";
        }
        cout << endl;
    }
}

// Task 5 - Number Pyramid
void task5() {
    for (int i = 5; i >= 1; i--) {
        for (int j = 1; j <= i; j++) {
            cout << j << " ";
        }
        cout << endl;
    }
}

// Task 6 - Diamond Pyramid of Stars
void task6() {
    int n;
    cout << "Enter number of rows: ";
    cin >> n;
    for (int i = 0; i < n; i++) {
        for (int s = n; s > i; s--)
            cout << " ";
        for (int j = 0; j < i * 2 - 1; j++)
            cout << "*";
        cout << endl;
    }
    for (int i = n - 1; i > 0; i--) {
        for (int s = 0; s < n - i + 1; s++)
            cout << " ";
        for (int j = 0; j < i * 2 - 1; j++)
            cout << "*";
        cout << endl;
    }
}

// Task 7 - Print Alphabets Based on ASCII Input
void task7() {
    int x;
    cout << "Enter number between 65-90 or 97-122: ";
    cin >> x;
    if (x >= 65 && x <= 90) {
        for (char i = 'A'; i <= 'Z'; i++)
            cout << i << " ";
    } else if (x >= 97 && x <= 122) {
        for (char i = 'a'; i <= 'z'; i++)
            cout << i << " ";
    } else {
        cout << "Invalid input.";
    }
}

int main() {
    // Uncomment the function you want to test below:
    // task1_1();
    // task1_2();
    // task1_3();
    // task1_4();
    // task1_5();
    // task1_6();
    // task2();
    // task3();
    // task4();
    // task5();
    // task6();
    task7(); // Enabled Task 7 by default
    return 0;
}
