module upCounter(sevenSeg, anodes, reset, speed, pause, intClk); 
//You need to know which anode and cathodes you will use according to
//https://digilent.com/reference/basys3/refmanual
//The Anodes and Cathodes are driven low when active

input pause; //stalls counter
input speed; //control the speed at which the counter counts
input intClk; //Basys 3 Clock @ 100 MHz
input reset; //Resets display and counter
reg [14:0] digits; //We need 14 bits to obtain values within 0-9999
reg [14:0] tempDigits;
reg [1:0] an; //2 bits to obtain 4 different states for anodes 0-3
reg [19:0] countSevenSeg; //used as a counter to control refresh period of sevenSeg
reg [27:0] countDigits;  //used as a counter to control digit changing to 1 Hz
output reg [6:0] sevenSeg; //We need 7 bits to decode which cathodes to drive 
output reg [3:0] anodes;
//Assigned as reg since it is in an always block

//Parameters to assign correct binary digits to 7-segment
parameter zero = 7'b0000001; //MSB Cathode A...LSB Cathode G
parameter one = 7'b1001111;
parameter two = 7'b0010010;
parameter three = 7'b0000110;
parameter four = 7'b1001100;
parameter five = 7'b0100100;
parameter six = 7'b0100000;
parameter seven = 7'b0001111;
parameter eight = 7'b0000000;
parameter nine = 7'b0000100;

//DIGIT Decoding
always @ (tempDigits) //anytime digit to decode changes
    begin
    case(tempDigits)
    0: sevenSeg = zero;
    1: sevenSeg = one;
    2: sevenSeg = two;
    3: sevenSeg = three;
    4: sevenSeg = four;
    5: sevenSeg = five;
    6: sevenSeg = six;
    7: sevenSeg = seven;
    8: sevenSeg = eight;
    9: sevenSeg = nine;
    default: sevenSeg = zero;
    endcase
end
    
//ANODE and CATHODE Decoding
always @ (an) //Whenever an changes
    begin
        case (an)
        0: begin
           tempDigits = digits % 10;
           anodes = 4'b1110; //AN0 activate   
           end            
        1: begin
           tempDigits = (digits / 10) % 10;
           anodes = 4'b1101; //AN1 activate
           end   
        2: begin
           tempDigits = (digits / 100) % 10;
           anodes = 4'b1011; //AN2 activate
           end   
        3: begin
           tempDigits = (digits / 1000) % 10;
           anodes = 4'b0111; //AN3 activate
           end   
        endcase
    end

//*Important Basys 3 Internal Clock runs at 100 MHz*

//Digits Counter to increment at a rate of 10 Hz or 2 Hz
always @ (posedge intClk or posedge reset)
    begin
       if (reset) //Reset
       begin
            digits <= 0;
       end
       
       else if (pause)
       begin
            digits <= digits + 1'b0;
       end
       
       else if (speed == 1) //External but captures the speed setting
        begin
            if (countDigits == 10000000) //High speed 
                begin
                digits <= digits + 1'b1;
                countDigits <= 0;
                end
            else countDigits <= countDigits + 1'b1;
            end
        
        else if (speed == 0) //External but captures the speed setting
        begin
            if (countDigits == 50000000) //Low speed 
                begin
                digits <= digits + 1'b1;
                countDigits <= 0;
                end
            else countDigits <= countDigits + 1'b1;
            end
    end
    
//Anode Counter to control refresh period to be within 1-16 ms
//400,000 found from using a 16 ms refresh meaning every 4 ms the anode signal changes
// (1/4ms) is the frequency and we would need to increment every 400,000 clock edges since we have a 100 MHz clock
always @ (posedge intClk or posedge reset)
    begin
       if (reset)
            begin
                an <= 0;
            end
       else if (countSevenSeg == 400000)
            begin
                countSevenSeg <= 0;
                an <= an + 1'b1;
            end
       else countSevenSeg <= countSevenSeg + 1'b1; //increment
    end
endmodule
