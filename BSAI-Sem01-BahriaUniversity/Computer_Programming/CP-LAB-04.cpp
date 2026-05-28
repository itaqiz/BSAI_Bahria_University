
// CP-LAB-04.CPP
// Introduction to Computer Programming Lab
// Lab Journal - 4
// Name: Muhammad Taqui
// Enrollment #: 01-136221-021
// Date: 07-April-2022
// Objective:
// 1) Understanding Looping Statements
// 2) Practicing while repetition structures
// 3) Practicing do-while repetition structures

#include <iostream>
#include <cstdlib>
using namespace std;

// Task 1.1
void task1_1() {
    int start = 1, end = 10;
    while (start <= end) {
        cout << start << endl;
        start++;
    }
}

// Task 1.2
void task1_2() {
    int start = 10, end = 1;
    do {
        cout << start << endl;
        start--;
    } while (start >= end);
}

// Task 1.3 - Loop runs once because do-while runs body before condition check
void task1_3() {
    int n = 6, i = 7;
    do {
        cout << i << endl;
        i++;
    } while (i <= n);
}

// Task 1.4 - Corrected codes
void task1_4_fixed() {
    int x = 0;
    do {
        cout << x << endl;
        x++;
    } while (x <= 10);

    int i = 0;
    while (i < 10) {
        cout << i << endl;
        i++;
    }
}

// Task 1.5 - Squares of first 10 natural numbers
void task1_5() {
    int j = 0;
    while (j < 10) {
        cout << "Square is: " << j * j << endl;
        j++;
    }
}

// Task 1.6 - Cubes less than 4-digit numbers
void task1_6() {
    int cube = 1, numb = 1;
    while (cube < 1000) {
        cube = numb * numb * numb;
        if (cube >= 1000) break;
        cout << "Number is: " << numb << " Cube is: " << cube << endl;
        numb++;
    }
}

// Task 1.7 - Division loop with user confirmation
void task1_7() {
    int dividend, divisor, quotient, remainder;
    char ch;
    do {
        cout << "Enter dividend: ";
        cin >> dividend;
        cout << "Enter divisor: ";
        cin >> divisor;
        quotient = dividend / divisor;
        remainder = dividend % divisor;
        cout << "Quotient is: " << quotient << endl;
        cout << "Remainder is: " << remainder << endl;
        cout << "Do another Division Calculation? (Press y/n): ";
        cin >> ch;
    } while (ch != 'n');
}

// Task 1.8 - Infinite loop until user exits
void task1_8() {
    char ch;
    while (1) {
        cout << "


***************************" << endl;
        cout << "Welcome to my program" << endl;
        cout << "It will not exit" << endl;
        cout << "Until you ask for it" << endl;
        cout << "Press 'e' to exit or any other key to continue: ";
        cin >> ch;
        if (ch == 'e')
            exit(0);
    }
}

// Task 2 - Fahrenheit to Celsius conversion loop
void task2() {
    int C, F;
    char ch;
    do {
        cout << "Enter temperature in Fahrenheit: ";
        cin >> F;
        C = (F - 32) * 5 / 9;
        cout << "Temperature in Celsius is: " << C << endl;
        cout << "To terminate program press N: ";
        cin >> ch;
    } while (ch != 'N');
}

// Task 3 - Average of numbers 1 to N using do-while
void task3() {
    int sum = 0, i = 1, n;
    float avg;
    cout << "Enter the value of N: ";
    cin >> n;
    do {
        sum += i;
        i++;
    } while (i <= n);
    avg = (float)sum / n;
    cout << "Sum is: " << sum << "
Average is: " << avg << endl;
}

// Task 4 - Class average using while loop
void task4() {
    int students, i = 1;
    float marks, total = 0, averageMarks;
    cout << "Enter total number of students: ";
    cin >> students;
    while (i <= students) {
        cout << "Enter marks for student " << i << ": ";
        cin >> marks;
        total += marks;
        i++;
    }
    averageMarks = total / students;
    cout << "
Average Marks = " << averageMarks << endl;
}

// Task 5 - Factorial using while loop
void task5() {
    int n, Fact = 1;
    cout << "Enter a number: ";
    cin >> n;
    while (n >= 1) {
        Fact *= n;
        n--;
    }
    cout << "Factorial is: " << Fact << endl;
}

// Task 6 and 7 - Calculator with menu, infinite loop and exit
void task6_7() {
    int x, y;
    char op;
    while (1) {
        system("cls");
        cout << "Enter two numbers: ";
        cin >> x >> y;
        cout << "Choose your operation:
";
        cout << "1. Addition
2. Subtraction
3. Multiplication
4. Division
5. Remainder
6. Exit
";
        cin >> op;
        switch (op) {
            case '1':
                cout << x << " + " << y << " = " << x + y << endl;
                break;
            case '2':
                cout << x << " - " << y << " = " << x - y << endl;
                break;
            case '3':
                cout << x << " * " << y << " = " << x * y << endl;
                break;
            case '4':
                cout << x << " / " << y << " = " << x / y << endl;
                break;
            case '5':
                cout << x << " % " << y << " = " << x % y << endl;
                break;
            case '6':
                exit(0);
            default:
                cout << "Invalid choice!" << endl;
        }
        system("pause");
    }
}

int main() {
    // Uncomment any task to test it individually
    // task1_1();
    // task1_2();
    // task1_3();
    // task1_4_fixed();
    // task1_5();
    // task1_6();
    // task1_7();
    // task1_8();
    // task2();
    // task3();
    // task4();
    // task5();
    task6_7(); // Final calculator menu loop
    return 0;
}
