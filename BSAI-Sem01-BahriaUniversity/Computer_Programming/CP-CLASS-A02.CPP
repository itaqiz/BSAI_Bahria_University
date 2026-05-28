// Name: Muhammad Taqui
// Deadline: 6 May 2022 - 12:00 am

// Task 1: Write a C++ program to add the elements of two arrays and store the sum in a third array.
#include<iostream>
using namespace std;

int main()
{
    int size, i, a1[10], a2[10], add[10];

    cout << "Kindly Enter the size of the array: ";
    cin >> size;

    cout << "Kindly Enter the elements of the first array: ";
    for (i = 0; i < size; i++)
    {
        cin >> a1[i];
    }

    cout << "Kindly Enter the elements of the second array: ";
    for (i = 0; i < size; i++)
    {
        cin >> a2[i];
    }

    cout << "Array having the sum of these two arrays is: ";
    for (i = 0; i < size; i++)
    {
        add[i] = a1[i] + a2[i];
        cout << add[i] << " ";
    }

    return 0;
}

// Task 2: Write a C++ program that inputs obtained marks for five subjects of a student in an array and calculates the percentage. Total marks for each subject are 100.
#include<iostream>
using namespace std;

int main()
{
    int CP, FE, ICT, DM, CAL;
    float total, percentage;

    cout << "Kindly enter the marks of all subjects (CP, FE, ICT, DM, CAL): ";
    cin >> CP >> FE >> ICT >> DM >> CAL;

    total = CP + FE + ICT + DM + CAL;
    percentage = (total / (500)) * 100;

    cout << "Total Marks: " << total << endl;
    cout << "Marks Percentage: " << percentage << "%" << endl;

    return 0;
}

// Task 3: Write a program to find the smallest number in an array.
#include<iostream>
using namespace std;

int main()
{
    int arr[100], size, i, smallest;
    cout << "Kindly enter the Size of Array: ";
    cin >> size;
    cout << "Enter the elements of the array: ";
    for (i = 0; i < size; i++)
        cin >> arr[i];
    smallest = arr[0];
    for (i = 1; i < size; i++)
    {
        if (smallest > arr[i])
            smallest = arr[i];
    }
    cout << "\nSmallest Number = " << smallest << endl;
    return 0;
}

// Task 4: Write a program to reverse array elements.
#include <iostream>
using namespace std;

int main() {
    int n = 9;
    int arr[n] = { 2,5,6,4,7,8,3,6,4 };
    int temp;
    for (int i = 0; i < n / 2; i++) {
        temp = arr[i];
        arr[i] = arr[n - i - 1];
        arr[n - i - 1] = temp;
    }
    for (int i = 0; i < n; i++) {
        cout << arr[i] << " ";
    }
    return 0;
}

// Task 5: Write a program to sort an array in ascending order.
#include <iostream>
using namespace std;

int main()
{
    int arr[100];
    int size, i, j, temp;
    cout << "Enter the size of the array: ";
    cin >> size;
    cout << "Enter elements of the array: ";
    for (i = 0; i < size; i++)
    {
        cin >> arr[i];
    }
    for (i = 0; i < size; i++)
    {
        for (j = i + 1; j < size; j++)
        {
            if (arr[j] < arr[i])
            {
                temp = arr[i];
                arr[i] = arr[j];
                arr[j] = temp;
            }
        }
    }
    cout << "Elements in ascending order:" << endl;
    for (i = 0; i < size; i++)
    {
        cout << arr[i] << endl;
    }

    return 0;
}
