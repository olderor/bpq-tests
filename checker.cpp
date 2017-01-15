#include <iostream>
#include <fstream>
#include <vector>
#include <queue>
#include <string>
#include <utility>
#include <algorithm>

#pragma warning(disable:4996) 

const int INF = 2147483647;

using namespace std;


void run_test(int index) {
    ifstream cin("tests/" + to_string(index) + ".txt");
    ofstream cout("answers/" + to_string(index) + "a.txt");


    priority_queue<int> queue;
    string line;
    while (getline(cin, line)) {
        if (line == "pop") {
            if (queue.empty()) {
                cout << "nil\n";
                continue;
            }
            cout << INF - queue.top() << "\n";
            queue.pop();
            continue;
        }
        if (line == "top") {
            if (queue.empty()) {
                cout << "nil\n";
                continue;
            }
            cout << INF - queue.top() << "\n";
            continue;
        }
        queue.push(INF - stoi(line));
    }

    cout << "\n";

    cin.close();
    cout.close();
}

int main() {

    for (int i = 26; i < 50; ++i) {
        run_test(i);
        std::cout << "test #" << i << " done.\n";
    }

    return 0;
}
