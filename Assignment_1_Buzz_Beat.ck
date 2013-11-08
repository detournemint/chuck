// Buzz Beat
// 
// 10/24/13

<<< "Buzz Beat!" >>>;

now + 30::second => time end; //only play for 30 seconds
//Define the Osc vars
SinOsc s => dac;
TriOsc f => dac;
SawOsc  w => dac;
SqrOsc q => dac;
// init everything to zero
0 => s.gain;
0 => q.gain;
0 => w.gain;
0 => f.gain;

//start a while loop for 30 seconds
while(now < end){
    // turn up volume for the first osc
    0.5 => s.gain;
    //for loop for a three time run through
    for(1 => int j; j < 3; j++){
        //turn up volume for 2nd osc
        0.5 => f.gain;
        //set the freq in relation to j
        60*j => f.freq;    
        //a loop that does a little increasing wobble
        for(80 => int i; i < 90; i++){
            //turn down volume for the 3rd osc
            0 => q.gain;
            //making the wobble sound
            i => s.freq;
            0.05::second => now;
            i - 20 => s.freq;
            0.05::second => now;
            i - 50 => s.freq;
            0.05::second => now;
            i - 20 => s.freq;
            0.05::second => now; 
            //only on numbers that divide evenly by three, do you play this note. 
            if (i%3 == 0){
                i/2 => q.freq;
                0.2 => q.gain;
                0.05::second => now;
            }  
            
        }
    }
    //a little boop after every for loop
    0.2 => w.gain;
    80 => w.freq;
    0.5::second => now;
    0 => w.gain;
    
    
}