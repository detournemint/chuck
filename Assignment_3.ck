//chill wavin'
//Init all the sounds
SndBuf kick => dac;
SndBuf clap => dac;
SndBuf fx1 => dac;
SinOsc y => dac;
SndBuf snare => dac;


me.dir() + "/audio/kick_02.wav"  => kick.read;
me.dir() + "/audio/clap_01.wav" => clap.read;
me.dir() + "/audio/stereo_fx_03.wav" => fx1.read;
me.dir() + "/audio/snare_01.wav" => snare.read;

//midi notes
[50, 52, 53, 55, 57, 59, 60, 62] @=> int midi_notes[];

//setting everything to zero so it doesn't start right away
0 => clap.pos;
0 => snare.gain;
0 => int counter;
0 => fx1.gain;
0 => clap.gain;
0 => kick.gain;
1.0 => float rt;
0 => y.gain;
now + 30::second => time end;
Math.srandom(100);

while (now < end){
	// start with just kicks and bass line
	1.0 => kick.gain;
	.5 => y.gain;
	for(0 => int i; i< 10; i++){
		Std.mtof(midi_notes[3])/2 => y.freq;
		counter % 8 => int beat;
		if((beat== 0) || (beat== 1)|| (beat== 6))
		{
			0 => kick.pos;
		}
		.25::second => now; 
		counter++;    
	}
	// bring in the claps to get that funky sound, change up the beat a bit
	1.0 => clap.gain;
	for(0 => int i; i< 20; i++){
		Std.mtof(midi_notes[4])/2 => y.freq;
		counter % 8 => int beat;
		if((beat== 0) || (beat== 4) || (beat== 7))
		{
			0 => kick.pos;
		}
		if((beat== 2) || (beat == 6))
		{
			0 => clap.pos;
		}
		.25::second => now; 
		counter++;    
	}
	//Bring in FX sound
	for(0 => int i; i< 40; i++){
		Std.mtof(midi_notes[5])/2 => y.freq;
		1.0 => fx1.gain;
		counter % 8 => int beat;
		if((beat== 0) ||  (beat== 4) || (beat== 7))
		{
			0 => kick.pos;
		}
		if((beat== 2) || (beat == 6))
		{
			0 => clap.pos;
		}
		if((beat== 0) )
		{   
			if (rt == 1.3){
				1.0 => rt;
			} else {
				1.3 => rt;
			}
			rt => fx1.rate;
			0 => fx1.pos;
		}
		.25::second => now; 
		counter++;    
	}
	//add some random snare
	for(0 => int i; i< 40; i++){
		1.0 => snare.gain;
		Std.mtof(midi_notes[4])/2 => y.freq;
		1.0 => fx1.gain;
		counter % 8 => int beat;
		if((beat== 0) ||  (beat== 4) || (beat== 7))
		{
			0 => kick.pos;
		}
		if((beat== 2) || (beat == 6))
		{
			0 => clap.pos;
		}
		if((beat== 0) )
		{   
			if (rt == 1.3){
				1.0 => rt;
			} else {
				1.3 => rt;
			}
			rt => fx1.rate;
			0 => fx1.pos;
		}
		if((beat== 2) || (beat == 6) || (beat == 7))
		{
			0 => snare.pos;
			Math.random2f(.6,1.2) => snare.rate;
		}
		.25::second => now; 
		counter++;    
	}
	0 => fx1.gain; // turn down the fx at then
	//plain bassline wobble for the end
	1.0 => kick.gain;
	.5 => y.gain;
	for(0 => int i; i< 30; i++){
		Std.mtof(midi_notes[2])/2 => y.freq;
		.05::second => now; 
		Std.mtof(midi_notes[4])/2 => y.freq;
		.05::second => now; 
		counter++;    
	}
	
	
}