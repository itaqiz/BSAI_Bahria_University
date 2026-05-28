// Muhammad Taqui
// Deadline: June 26, 2022 - 12:00 AM

#include<iostream>
#include<string>
#include<cstdlib> // For rand() and srand() functions
#include<ctime> // For time() function
using namespace std;

// Q1: Convert alphabet to uppercase or lowercase
void U_Case(char);
void L_Case(char);

// Q2: Structure for student data
struct Student {
	char name[20];
	int roll_no;
	int age;
};

void add_info(Student*);
void display_info(Student*);

// Q3: Magic 8 Ball game
void magic_8_ball();

int main()
{
    // Q1: Convert alphabet to uppercase or lowercase
	char ch;
	cout << "Q1: Enter an alphabet: ";
	cin >> ch;

	if (ch >= 97 && ch <= 122)
	{
		U_Case(ch);
	}
	else if (ch >= 65 && ch <= 90)
	{
		L_Case(ch);
	}

    // Q2: Structure for student data
	Student student;
	add_info(&student);
	display_info(&student);

    // Q3: Magic 8 Ball game
	magic_8_ball();

	return 0;
}

// Q1: Convert alphabet to uppercase or lowercase
void U_Case(char ch)
{
	char upper_case = ch - 32;
	cout << "Q1: Alphabet in uppercase: " << upper_case << endl;
}

void L_Case(char ch)
{
	char lower_case = ch + 32;
	cout << "Q1: Alphabet in lowercase: " << lower_case << endl;
}

// Q2: Structure for student data
void add_info(Student* ptr)
{
	cout << "Q2: Enter student name: ";
	cin.get(ptr->name, 20);
	cin.ignore(); // Ignore the newline character in the input buffer
	cout << "Q2: Enter student roll number: ";
	cin >> ptr->roll_no;
	cout << "Q2: Enter student age: ";
	cin >> ptr->age;
}

void display_info(Student* ptr)
{
	cout << "Q2: =============================================" << endl << endl;
	cout << "Q2: Student name: " << ptr->name << endl;
	cout << "Q2: Student age: " << ptr->age << endl;
	cout << "Q2: Student roll number: " << ptr->roll_no << endl;
}

// Q3: Magic 8 Ball game
void magic_8_ball()
{
	string question;
	string answer[8] = {
		"No Comments",
		"Next Question Please",
		"Yeah!",
		"You are right",
		"Right",
		"Interesting",
		"Leave it",
		"Okay"
	};

	cout << "\nQ3: Ask your question: ";
	cin.ignore(); // Ignore newline left by previous cin
	getline(cin, question);

	srand(time(0)); // Seed the random number generator

	int num = rand() % 8;
	cout << "\nQ3: =====================================" << endl;
	cout << "Q3: Question: " << question << endl;
	cout << "Q3: Answer: " << answer[num] << endl;
	cout << "Q3: =====================================" << endl;
}
