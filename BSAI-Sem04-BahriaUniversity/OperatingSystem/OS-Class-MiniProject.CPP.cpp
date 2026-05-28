#include <iostream>
#include <queue>

using namespace std;

// ** Muhammad Taqui **
// ** OS CLASS MINI PROJECT **
// ** Deadline: 1 January 2024-11:30 pm **

// Define a struct to represent a process
struct Process {
    int id; // Process ID
    int burstTime; // Burst time required by the process
    int remainingTime; // Remaining burst time for the process
};

// Function to perform Round Robin scheduling on a queue of processes
void roundRobinScheduler(queue<Process>& processes, int timeQuantum) {
    while (!processes.empty()) {
        Process currentProcess = processes.front(); // Get the front process
        processes.pop(); // Remove the front process from the queue

        int executionTime = min(timeQuantum, currentProcess.remainingTime); // Determine execution time

        // Execute the process for the determined execution time
        cout << "Executing Process " << currentProcess.id << " for time: " << executionTime << " units." << endl;

        currentProcess.remainingTime -= executionTime; // Update remaining time for the process

        // If the process still has remaining time, add it back to the queue
        if (currentProcess.remainingTime > 0) {
            processes.push(currentProcess);
        }
        else {
            // Process has completed execution
            cout << "Process " << currentProcess.id << " completed." << endl;
        }
    }
}

int main() {
    int n;
    cout << "Enter the number of processes: ";
    cin >> n;

    queue<Process> processes; // Create a queue to store processes

    // Input burst time for each process and add it to the queue
    for (int i = 0; i < n; ++i) {
        Process p;
        cout << "Enter burst time for Process " << i + 1 << ": ";
        cin >> p.burstTime;
        p.id = i + 1;
        p.remainingTime = p.burstTime;
        processes.push(p);
    }

    int timeQuantum;
    cout << "Enter time quantum for Round Robin scheduling: ";
    cin >> timeQuantum;

    // Call the Round Robin scheduler function
    roundRobinScheduler(processes, timeQuantum);

    return 0;
}
