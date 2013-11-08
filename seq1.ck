SndBuf fx => dac;
SndBuf hihat => dac;
SndBuf snare => dac;

me.dir() + "/audio/stereo_fx_03.wav" => fx.read;
me.dir() + "/audio/hihat_01.wav" => hihat.read;
me.dir() + "/audio/snare_01.wav" => snare.read;

fx.samples() => fx.pos;
hihat.samples() => hihat.pos;
snare.samples() => snare.pos;

0 => int counter;

while(true)
{   
    //for(1.0 => float j; j < 0.6; j-0.1){
        for(0 => int i; i< 4; i++){
            counter % 8 => int beat;
            
            if((beat==0) || (beat == 4))
            {
                0 => fx.pos;     
               1 => fx.rate;
            }
            if((beat== 2) || (beat == 6) || (beat == 7))
            {
                0 => snare.pos;
                Math.random2f(.6,1.4) => snare.rate;
            }
            0 => hihat.pos;
            .3 => hihat.gain;
            //Math.random2f(.2,.8) => hihat.rate;
            counter++;
            500::ms => now;
        }
    //}
}