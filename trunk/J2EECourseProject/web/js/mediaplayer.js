/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var audioControler;
var UI_playbutton;

var CONST_BUTTON_GLYPHICON_PLAY = 'glyphicon glyphicon-play-circle';
var CONST_BUTTON_GLYPHICON_PAUSE = 'glyphicon glyphicon-pause';

window.addEventListener('load', function () {
    audioControler = document.getElementById('media-controler');
    UI_playbutton = document.getElementById('button-play');

    /* DEMO HARD-CODED */
    audioControler.src = 'res/demo.mp3';
});

function buttonAction_Play() {
    if (audioControler.paused)
    {
        process_Play();
    }
    else
    {
        process_Pause();
    }

    // This return is required to any button action, basically, it will not reload the page.
    return false;
}

function process_Play() {
    audioControler.play();
    UI_playbutton.class = CONST_BUTTON_GLYPHICON_PAUSE;
    UI_playbutton.reload();
}

function process_Pause() {
    audioControler.pause();
    UI_playbutton.class = CONST_BUTTON_GLYPHICON_PLAY;
}