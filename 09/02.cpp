#include <iostream>
#include <fstream>
#include <string>
#include <set>

using namespace std;

int main()
{
    string line;
    ifstream myfile;
    int tails[10][2] = {};
    set<string> visitedPlaces;

    myfile.open("9.txt");
    while (getline(myfile, line))
    {
        char pos = line[0];
        int count = stoi(line.substr(2));

        for (int i = 0; i < count; i++)
        {
            if (pos == 'U')
            {
                tails[0][1] += 1;
            }
            else if (pos == 'D')
            {
                tails[0][1] -= 1;
            }
            else if (pos == 'R')
            {
                tails[0][0] += 1;
            }
            else if (pos == 'L')
            {
                tails[0][0] -= 1;
            }

            for (int j = 1; j < 10; j++)
            {
                int xdistance = tails[j - 1][0] - tails[j][0];
                int ydistance = tails[j - 1][1] - tails[j][1];

                if (xdistance > 1 || xdistance < -1)
                {
                    tails[j][0] += (xdistance / 2);

                    if (ydistance % 2 == 0)
                        tails[j][1] += (ydistance / 2);
                    else
                        tails[j][1] += ydistance;
                }
                else if (ydistance > 1 || ydistance < -1)
                {
                    tails[j][1] += (ydistance / 2);
                    tails[j][0] += (xdistance);
                }
                else
                {
                    break;
                }
            }
            visitedPlaces.insert(to_string(tails[9][0]) + "," + to_string(tails[9][1]));
        }
    }

    cout << visitedPlaces.size() << '\n';
    myfile.close();
    return 0;
}
