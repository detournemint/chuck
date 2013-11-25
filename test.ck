// Assignement 3 - Making a 30 secs Techno Sound

// soundchain
SndBuf sound => Pan2 p => dac;
SndBuf reverse => dac;
SqrOsc square => Pan2 p2 => dac;

// declare variables
[50,52,53,55,57,59,60,62] @=> int midiNotes[];
.25 => float pulse;

// array of audio sting path
string samples[3];

// load soundfiles into sndbuf
me.dir() + "/audio/kick_03.wav" => samples[0];
me.dir() + "/audio/snare_03.wav" => samples[1];
me.dir() + "/audio/cowbell_01.wav" => samples[2];
me.dir() + "/audio/stereo_fx_03.wav" => reverse.read;

// get total num of samples
reverse.samples() => int numSamples;

for( 0 => int i; i < 6; i++)
{
	for( 0 => int j; j < 20; j++)
	{   
		// reversing a sample (negative .rate)
		numSamples => reverse.pos;
		-1.0 => reverse.rate;
		if (j % 4 == 0)
		{
			2.5 => reverse.gain;
		}
		else
		{
			0 => reverse.gain;    
		}
		
		// play soundbank audio    
		0.6 => sound.gain;
		Math.random2(0, samples.cap() - 1) => int chosenSound;
		samples[chosenSound] => sound.read; 
		Math.random2f(-1.0, 1.0) => float panPosition;
		panPosition => p.pan;
		
		// play square oscillator audio
		0.02 => square.gain;
		Math.random2(0, midiNotes.cap() - 1) => int randNotes;
		Std.mtof(midiNotes[randNotes]) * 2 => square.freq;
		Math.random2f(-1.0, 1.0) => float panPosition2;
		panPosition2 => p2.pan;
		
		250::ms => now;
	}
	// quarter notes every 5 secs
	0 => square.gain;
	0 => sound.gain;
	pulse::second => now;
}
