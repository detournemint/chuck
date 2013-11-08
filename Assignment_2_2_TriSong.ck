/* TriSong */
SinOsc s => Pan2 c => dac;
TriOsc t => Pan2 p => dac;
SinOsc y => dac;
//set everything to zero
0 => t.gain;
0 => s.gain;
0 => y.gain;
0 => float hZ;
// 30 second piece
now + 30::second => time end;
Math.srandom(100);

//my midi notes
[50, 52, 53, 55, 57, 59, 60, 62] @=> int midi_notes[];

while(now < end){
    for(0 => int j; j< 2; j++){
        //do this for 4 measures
        for(0 => int i; i< 4; i++){
            (i+1)*.5 => s.gain;
            0.5 => t.gain;
            Std.mtof(midi_notes[0]) => hZ;
            hZ => s.freq;
            (hZ/2)+(i*20) => t.freq;            
            -1.0 => p.pan;
            .25::second => now;
            Std.mtof(midi_notes[2]) => hZ;
            hZ => s.freq;
            1.0 => p.pan;
            //half step
            .12::second => now;
            Std.mtof(midi_notes[3]) => hZ;
            hZ => s.freq;
            -1.0 => p.pan;
            .12::second => now;
            Std.mtof(midi_notes[5]) => hZ;
            hZ => s.freq;
            1.0 => p.pan;
            .25::second => now;
            Std.mtof(midi_notes[6-i]) => hZ;
            hZ => s.freq;
            0 => p.pan;
            .25::second => now;        
        }
        
    }
    for(0 => int j; j< 2; j++){
        //do this for 2 measures
        for(0 => int i; i< 2; i++){
            Math.random2(30,80) => int rand;
            rand => y.freq;       
            0.5 => y.gain;
            ((Std.mtof(midi_notes[0])/2)+(rand)) => t.freq;
            1.0 => s.gain;
            Std.mtof(midi_notes[1]) => hZ;
            hZ/2 => s.freq;
            1.0 => c.pan;
            -1.0 => p.pan;
            .25::second => now;
            Std.mtof(midi_notes[2]) => hZ;
            hZ/2 => s.freq;
            .12::second => now;
            Std.mtof(midi_notes[4]) => hZ;
            hZ => s.freq;
            .12::second => now;
            Std.mtof(midi_notes[5]) => hZ;
            hZ => s.freq;
            -1.0 => c.pan;
            1.0 => p.pan;
            .25::second => now;
            Std.mtof(midi_notes[6-i]) => hZ;
            hZ/2 => s.freq;
            .25::second => now;
                    
        }
        for(0 => int i; i< 2; i++){
            Math.random2(30,80) => int rand;
            rand => y.freq;
            ((Std.mtof(midi_notes[0]-2)/2)+(rand)) => t.freq;
            1.0 => s.gain;
            Std.mtof(midi_notes[1]) => hZ;
            hZ/2 => s.freq;
            1.0 => c.pan;
            -1.0 => p.pan;
            .25::second => now;
            Std.mtof(midi_notes[2]) => hZ;
            hZ/2 => s.freq;
            .12::second => now;
            Std.mtof(midi_notes[4]) => hZ;
            hZ => s.freq;
            .12::second => now;
            Std.mtof(midi_notes[6]) => hZ;
            hZ => s.freq;
            -1.0 => c.pan;
            1.0 => p.pan;
            .25::second => now;
            Std.mtof(midi_notes[7-i]) => hZ;
            hZ/2 => s.freq;
            .25::second => now; 
            0 => y.gain;       
        }
        
    }
        for(0 => int i; i< 2; i++){
            (i)*.5 => s.gain;
            0.5 => t.gain;
            Std.mtof(midi_notes[1]) => hZ;
            hZ => s.freq;
            (hZ/2)+(i*20) => t.freq;            
            -1.0 => p.pan;
            .25::second => now;
            Std.mtof(midi_notes[1]) => hZ;
            hZ => s.freq;
            1.0 => p.pan;
            .12::second => now;
            Std.mtof(midi_notes[2]) => hZ;
            hZ => s.freq;
            -1.0 => p.pan;
            .12::second => now;
            Std.mtof(midi_notes[2]) => hZ;
            hZ => s.freq;
            1.0 => p.pan;
            .25::second => now;
            Std.mtof(midi_notes[3-i]) => hZ;
            hZ => s.freq;
            0 => p.pan;
            .25::second => now;        
        }
        
    
    
}