#include <iostream>
#include <vector>
#include <unordered_set>
#include <set>

using namespace std;


bool hasBingo(const vector<vector<char>>& map, char target) {
    for (int i = 0; i < map.size(); i++) {
        vector<char> rowArr;
        for (int j = 0; j < map[0].size(); j++) {
            if (map[i][j] == target) {
                rowArr.push_back(map[i][j]);
            
            }
        }
        if (rowArr.size() == 3) {
            return true;
        }
    }

    for (int j = 0; j < map[0].size(); j++) {
        vector<char> columnArr;
        for (int i = 0; i < map.size(); i++) {
            if (map[i][j] == target) {
                columnArr.push_back(map[i][j]);
            }
        }
        if (columnArr.size() == 3) {
            return true;
        }
    }

    set<char> diagLeftSet;
    set<char> diagRightSet;

    diagLeftSet.insert(target);
    diagLeftSet.insert(map[0][0]);
    diagLeftSet.insert(map[1][1]);
    diagLeftSet.insert(map[2][2]);
    if (diagLeftSet.size() == 1) {
        return true;
    }

    diagRightSet.insert(target);
    diagRightSet.insert(map[0][2]);
    diagRightSet.insert(map[1][1]);
    diagRightSet.insert(map[2][0]);
    if (diagRightSet.size() == 1) {
        return true;
    }

    return false;
}

int solution(vector<string> board) {
    vector<vector<char>> map;
    for (const string& b : board) {
        vector<char> line(b.begin(), b.end());
        map.push_back(line);
    }
    int dotCount = 0;
    int OCount = 0;
    int XCount = 0;
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            if (map[i][j] == '.') {
                dotCount += 1;
            } else if (map[i][j] == 'O') {
                OCount += 1;
            } else {
                XCount += 1;
            }
        }
    }
    int roundCount = 9 - dotCount;

    if (roundCount % 2 == 0) {
        if (XCount != OCount) {
            return 0;
        } else {
            if (hasBingo(map, 'O')) {
                return 0;
            }
        }
    } else {
        if (XCount + 1 != OCount) {
            return 0;
        } else {
            if (hasBingo(map, 'X')) {
                return 0;
            }
        }
    }

    return 1;
}
