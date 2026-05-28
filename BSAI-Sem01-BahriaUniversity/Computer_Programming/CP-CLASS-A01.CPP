/* CP-CLASS-A01
Submitted by: Muhammad Taqui
Deadline: 10 April 2022 - 12:00 am */

#include <iostream>
using namespace std;

int main() {
    // Task 1: Separate a four-digit number into individual digits and calculate the sum
    int number, a, b, c, sum;

    cout << "Task 1: Enter a four-digit number: ";
    cin >> number;

    a = number % 10;
    number /= 10;

    b = number % 10;
    number /= 10;

    c = number % 10;
    number /= 10;

    sum = a + b + c + number;

    cout << "First digit is " << number << endl;
    cout << "Second digit is " << c << endl;
    cout << "Third digit is " << b << endl;
    cout << "Fourth digit is " << a << endl;
    cout << "Sum is: " << sum << endl << endl;

    // Task 2: Convert letters into their corresponding telephone digits
    char letter;
    int digit;

    cout << "Task 2: Enter a letter (A-Z, a-z) or '#' to exit: ";
    cin >> letter;

    while (letter != '#') {
        if (isalpha(letter)) {
            if (islower(letter)) {
                letter = toupper(letter);
            }

            switch (letter) {
                case 'A': case 'B': case 'C':
                    digit = 2;
                    break;
                case 'D': case 'E': case 'F':
                    digit = 3;
                    break;
                case 'G': case 'H': case 'I':
                    digit = 4;
                    break;
                case 'J': case 'K': case 'L':
                    digit = 5;
                    break;
                case 'M': case 'N': case 'O':
                    digit = 6;
                    break;
                case 'P': case 'Q': case 'R': case 'S':
                    digit = 7;
                    break;
                case 'T': case 'U': case 'V':
                    digit = 8;
                    break;
                case 'W': case 'X': case 'Y': case 'Z':
                    digit = 9;
                    break;
                default:
                    digit = -1;
            }

            if (digit != -1) {
                cout << "Corresponding telephone digit for " << letter << " is " << digit << endl;
            } else {
                cout << "Invalid input. Please enter a valid letter." << endl;
            }
        } else {
            cout << "Invalid input. Please enter a letter (A-Z, a-z) or '#' to exit: ";
        }

        cout << "Enter another letter or '#' to exit: ";
        cin >> letter;
    }

    cout << "Program ended." << endl;

    return 0;
}
