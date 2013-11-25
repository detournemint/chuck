Gain master => dac;
Impulse imp => ResonZ filt => master;
SndBuf kick => master;
SndBuf clap => master;
SinOsc s => master;


800.0 => filt.freq;
400 => filt.Q;
[50, 52, 53, 55, 57, 59, 60, 62] @=> int midi_notes[];
0 => int counter;
0 => s.gain;

me.dir() + "/audio/kick_02.wav"  => kick.read;
me.dir() + "/audio/clap_01.wav"  => clap.read;

now + 30::second => time end;

fun void instrument(SndBuf instr)
{
	        0 => instr.pos;
			200.0 => imp.next;
			Math.random2f(1000,12000) => filt.freq;
			.5 => s.gain;
			Std.mtof(midi_notes[Math.random2(0,7)])/4 => s.freq;

}

while (now < end){	
	for(0 => int i; i< 10; i++){
		counter % 8 => int beat;
		if((beat== 0) || (beat == 4) || (beat == 6) )
		{
			instrument(kick);
		}
		.25::second => now; 
		if((beat == 3) || (beat == 7)){
			
			instrument(clap);
		}
		.25::second => now; 
		counter++;    
	}
	
}