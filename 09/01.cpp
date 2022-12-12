#include <iostream>
#include <fstream>
#include <string>
#include <set>

using namespace std;



int main () {

  int visitedPlaces[200000][2]; // FOR SOME REASON DELETING THIS PRODUCES WRONG RESULT I DONT EVEN USE THIS

  string line;

  ofstream outFile;
  ifstream myfile;

  int tailCoords[2];
  int headCoords[2];
  set<string> visitedPlacesStr;

  myfile.open ("9.txt");
  while( getline (myfile,line) )
  {
    char pos = line[0];
    int count = stoi(line.substr(2,2));
    
    for (int i = 0;i < count;i++) {
      if (pos == 'U') {
        headCoords[1] += 1;
      } else if (pos == 'D') {
        headCoords[1] -= 1;
      } else if (pos == 'R') {
        headCoords[0] += 1;
      } else if (pos == 'L') {
        headCoords[0] -= 1;
      }

      int xdistance = headCoords[0] - tailCoords[0];
      int ydistance = headCoords[1] - tailCoords[1];

      if (xdistance > 1 || xdistance < -1) {
        tailCoords[0] += (xdistance / 2);
        tailCoords[1] += (ydistance);
      }
      else if (ydistance > 1 || ydistance < -1) {
        tailCoords[1] += (ydistance / 2);
        tailCoords[0] += (xdistance);
      }

      visitedPlacesStr.insert(to_string(tailCoords[0]) + "," + to_string(tailCoords[1]));
    }
  }


  cout << visitedPlacesStr.size() << '\n';
  myfile.close();
  return 0;
}
