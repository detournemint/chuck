Impulse imp => ResonZ filt => dac;

SndBuf kick => dac;

[50, 52, 53, 55, 57, 59, 60, 62] @=> int midi_notes[];



me.dir() + "/audio/kick_02.wav"  => kick.read;

now + 30::second => time end;
Math.srandom(100);

while (now < end){
	0 => kick.pos;
	Math.random2f(500,2000) => filt.freq;
	Math.random2f(0.05,0.02)::second => now;
	
}