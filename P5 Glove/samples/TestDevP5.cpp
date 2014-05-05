#include <iostream>
#include <stdlib.h>
#include "p5dll.h"
#include <windows.h>

// Make sure the p5dll.lib file is included, with the correct path, in:
// Project (menu) | Project Options | Parameters (tab) | Linker (box)

using namespace std;

int main(int argc, char *argv[])
{
  // Initialise the gloves
  // This initialises and starts the driver, it is essential.
  P5_Init();

  // get the number of gloves
  int count = P5_GetCount();
  cout << "You have " << count << " gloves." << endl;

  // get the state data structure pointer for glove #0 (the first glove)
  // this data structure is updated automatically.
  P5State *state = P5_GetStatePointer(0);

  // Set the units to centimetres
  P5_SetUnits(P5_CM);
  
  // In the previous BETA 1 version you had to call this
  // before you could use FilterPos. Now it is the default, so it isn't needed.
  // P5_SetFilterMode(P5_FILTER_AVERAGE | P5_FILTER_DEADBAND);

  // remember what the previous frame was, so we can wait for the next one
  int lastframe = 0;

  // loop for a thousand frames
  for (int j=0; j<1000; j++) {

      // wait for the next frame of data
      while (state->Frame == lastframe) {
          Sleep(24);
      }    
      lastframe = state->Frame;

      // display the coordinates
      cout << "(" << state->x << ", " << state->y << ", " << state->z << ")" << endl;      

      // Use this line instead if you want filtering
      // cout << "(" << state->FilterPos[0] << ", " << state->FilterPos[1] << ", " << state->FilterPos[2] << ")" << endl;      

  }
  
  // Close the gloves
  P5_Close();  

  // Run the DOS command PAUSE so the window doesn't close
  system("PAUSE");	
  return 0;
}
