SinOsc s => dac;
SawOsc t => dac;
0 => t.gain;
0 => s.gain;
0 => float hZ;
Math.srandom(20);
now + 30::second => time end;

[50, 52, 53, 55, 57, 59, 60, 62] @=> int midi_notes[];

while(now < end){
    for(0 => int i; i< 20; i++){
        i*.5 => s.gain;       
        Math.random2(0,7) => int i;
        Std.mtof(midi_notes[i]) => hZ;
        hZ/2 => s.freq;
        .25::second => now;
        (hZ/2)-10 => s.freq;
        .50::second => now;
    }
    for(0 => int i; i< 5; i++){
        (hZ/2)-10 => s.freq;
        .25::second => now;
        0 => s.freq;
        .2::second => now;
    }
        
    for(20 => int i; i< 30; i++){
        i*.5 => s.gain;
        Math.random2(0,7) => int i;
        Std.mtof(midi_notes[i]) => float hZ;
        hZ/2 => s.freq;
        .25::second => now;
        (hZ/2)-10 => s.freq;
        .50::second => now;
        Std.mtof(midi_notes[6]/2) => t.freq;
        1.0 => s.gain;
        .25::second => now;       
    }
       Std.mtof(midi_notes[6]/2) => t.freq;
       5::second => now;
}