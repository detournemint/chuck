// Hello Sine Etc.
// 10/24/13

<<< "Hello World" >>>;
SinOsc s => dac;
SawOsc  w => dac;
SqrOsc q => dac;
0.5 => s.gain;
0 => q.gain;
0 => w.gain;

while(true){
    for(0 => int j; j < 2; j++){
    0 => w.gain;    
        for(80 => int i; i < 90; i++){
            0 => q.gain;
            i => s.freq;
            0.05::second => now;
            i - 20 => s.freq;
            0.05::second => now;
            i - 50 => s.freq;
            0.05::second => now;
            i - 20 => s.freq;
            0.05::second => now; 
            
            if (i%3 == 0){
                i - 20 => q.freq;
                0.2 => q.gain;
                0.05::second => now;
            }  
            
        }
    }
    0.2 => w.gain;
    60 => w.freq;
    0.5::second => now;
        
        
    }