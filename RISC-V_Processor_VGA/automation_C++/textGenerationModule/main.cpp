#include <iostream>
#include <fstream>
#include <string>
using namespace std;

int main () {
  ofstream myfile;
  bool loop = true;
  int x_pixel_start = 112; //increments of 8
  int y_pixel_start = 112; //must be increments of 16
  int numTimes = 368; //used for duplication of character vertically for monitor
  int offset = 352; //offset of what textgeneration module you are on
  char input1 = '2'; //used for duplication
  string input2= "MADE BY FPGAJEFF"; //used for unique text phrase on same horizontal line
  myfile.open ("code.txt");
 
  int numOfLetters = input2.size();
  cout << numOfLetters;

//d[0] ? d[0] :

for (int i = 0; i < numTimes; i++) {
    myfile << "d[" << i << "] ? a[" << i << "] :";
    myfile << "\n";
 }

//ValueToAscii a0(.in(R0[3:0]), .out(R0_0));

/*
int count = 0;
int numTimesY = 32;
int numTimesX = 8;
for (int i = 0; i < numTimesY; i++) {
   for (int j = 0; j < numTimesX; j++) {
      myfile << "ValueToAscii a" << count << "(.in(R" << i << "[" << 3+4*j << ":" << 4*j << "]), .out(R" << i << "_" << j << "));";
      myfile << "\n";
      count++;
   }
}
*/

/*
wire [6:0] R0_0;
*/

/*
int numTimesY = 32;
int numTimesX = 8;
for (int i = 0; i < numTimesY; i++) {
   for (int j = 0; j < numTimesX; j++) {
      myfile << "R" << i <<"_" << j << ", ";
   }
   myfile << "\n";
}
*/

/*
 textGeneration r0 (.clk(clk),.reset(reset),.asciiData(a[0]), .ascii_In(7'h30), //Semicolon
        .x(x),.y(y), .displayContents(d[0]), .x_desired(10'd40), .y_desired(10'd40)); 
*/

//Vertical character increment
/*
 for (int i = 0; i < numTimes; i++) {
    myfile << "textGeneration r" << i+offset << " (.clk(clk), .reset(reset), .asciiData(a[" << i+offset << "]), .ascii_In(7'd" << '0' + i <<
    "), .x(x), .y(y), .displayContents(d[" << i+offset << "]), .x_desired(10'd" << x_pixel_start << "), .y_desired(10'd" << y_pixel_start + 16*i << "));";
    myfile << "\n";
 }
*/

/*
//Vertical and horizontal character increment R0_7
int count = 0;
 for (int i = 16; i < 32; i++) {
   for (int j = 7; j >= 0; j--) {
      myfile << "textGeneration r" << count+offset << " (.clk(clk), .reset(reset), .asciiData(a[" << count+offset << "]), .ascii_In(R" << i << "_" << j <<
    "), .x(x), .y(y), .displayContents(d[" << count+offset << "]), .x_desired(10'd" << x_pixel_start + 8*(7-j) << "), .y_desired(10'd" << y_pixel_start + 16*(i-16) << "));";
    myfile << "\n";
    count++;
   }
 }
*/

//Vertical character duplication
/*
 for (int i = 0; i < numTimes; i++) {
    myfile << "textGeneration r" << i+offset << " (.clk(clk), .reset(reset), .asciiData(a[" << i+offset << "]), .ascii_In(7'd" << (int) input1 <<
    "), .x(x), .y(y), .displayContents(d[" << i+offset << "]), .x_desired(10'd" << x_pixel_start << "), .y_desired(10'd" << y_pixel_start + 16*i << "));";
    myfile << "\n";
 }
*/

//Phrase put on a horizontal line
/*
 for (int i = 0; i < numOfLetters; i++) {
    myfile << "textGeneration r" << i+offset << " (.clk(clk), .reset(reset), .asciiData(a[" << i+offset << "]), .ascii_In(7'd" << (int) input2[i] <<
    "), .x(x), .y(y), .displayContents(d[" << i+offset << "]), .x_desired(10'd" << x_pixel_start + 8*i << "), .y_desired(10'd" << y_pixel_start << "));";
    myfile << "\n";
 }
*/
  myfile.close();
  return 0;
}



