/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var audioControler;

var UI_playbuttonIcon;
var UI_progressbarCurrentPlay;
var UI_progressbarCurrentBuffer;
var UI_timerLabel;
var UI_songInfo;
var UI_timeNavigator;
var UI_soundNavigator;
var UI_soundLevelBar;
var UI_muteButtonIcon;

var CONST_BUTTON_GLYPHICON_PLAY = 'glyphicon glyphicon-play-circle';
var CONST_BUTTON_GLYPHICON_PAUSE = 'glyphicon glyphicon-pause';
var CONST_BUTTON_GLYPHICON_MUTED = 'glyphicon glyphicon-volume-off';
var CONST_BUTTON_GLYPHICON_UNMUTED = 'glyphicon glyphicon-volume-up';

window.addEventListener('load', function () {
    audioControler = document.getElementById('media-controler');
    UI_timeNavigator = document.getElementById('time-navigate');
    UI_soundNavigator = document.getElementById('sound-navigate-bar');
    UI_soundLevelBar = document.getElementById('sound-navigate-current');
    UI_muteButtonIcon = document.getElementById('button-mute-icon');
    
    UI_playbuttonIcon = document.getElementById('button-play-icon');
    UI_progressbarCurrentPlay = document.getElementById('time-navigate-progress');
    UI_progressbarCurrentBuffer = document.getElementById('time-navigate-downloaded');
    UI_timerLabel = document.getElementById('timer');
    UI_songInfo = document.getElementById('song-info-cell');

    /* DEMO HARD-CODED */
    audioControler.src = 'res/demo.mp3';
});

String.prototype.toHHMMSS = function () {
    var sec_num = parseInt(this, 10);
    var hours   = Math.floor(sec_num / 3600);
    var minutes = Math.floor((sec_num - (hours * 3600)) / 60);
    var seconds = sec_num - (hours * 3600) - (minutes * 60);

    if (hours > 0 && minutes < 10) {minutes = "0"+minutes;}
    if (seconds < 10) {seconds = "0"+seconds;}
    if (hours > 0)
    {
        return hours+':'+minutes+':'+seconds;
    }
    else
    {
        return minutes+':'+seconds;
    }
}

function action_Play() {
    if (audioControler.paused)
    {
        audioControler.play();
        UI_playbuttonIcon.className = CONST_BUTTON_GLYPHICON_PAUSE;
        updateCallback = setInterval(calback_UpdateProgressBar, 50);
    }
    else
    {
        audioControler.pause();
        UI_playbuttonIcon.className = CONST_BUTTON_GLYPHICON_PLAY;
        window.clearInterval(updateCallback);
    }

    // This return is required to any button action, basically, it will not reload the page.
    return false;
}

function action_Skip(ev) {
    var targetTime = ev.pageX - UI_timeNavigator.getBoundingClientRect().left;
    var totalTime = window.getComputedStyle(UI_timeNavigator).getPropertyValue('width');
    totalTime = parseFloat(totalTime.substr(0, totalTime.length - 2));
    audioControler.currentTime = (targetTime / totalTime) * audioControler.duration;
    calback_UpdateProgressBar();
    
    // alert(targetTime.toString() +'/'+ ev.pageX.toString() +'/'+ UI_timeNavigator.offsetLeft.toString()); // DEBUG PURPOSE
}

function action_AdjustVolume(ev) {
    var targetLevel = ev.pageX - UI_soundNavigator.getBoundingClientRect().left;
    var highestLevel = window.getComputedStyle(UI_soundNavigator).getPropertyValue('width');
    highestLevel = parseFloat(highestLevel.substr(0, highestLevel.length - 2));
    
    audioControler.volume = targetLevel / highestLevel;
    UI_soundLevelBar.style.width = audioControler.volume * 100 + '%';
}

function action_Mute() {
    audioControler.muted = !audioControler.muted;
    if (audioControler.muted)
    {
        UI_muteButtonIcon.className = CONST_BUTTON_GLYPHICON_MUTED;
    }
    else
    {
        UI_muteButtonIcon.className = CONST_BUTTON_GLYPHICON_UNMUTED;
    }
}

function calback_UpdateProgressBar() {
    var progressInPercentage = (audioControler.currentTime / audioControler.duration) * 100;
    var bufferInPercentage = (audioControler.buffered.end(audioControler.buffered.length-1) / audioControler.duration) * 100;
    UI_progressbarCurrentPlay.style.width = progressInPercentage + '%';
    UI_progressbarCurrentBuffer.style.width = bufferInPercentage + '%';
    UI_timerLabel.textContent = audioControler.currentTime.toString().toHHMMSS() +' / '+ audioControler.duration.toString().toHHMMSS();
    //UI_timerLabel.textContent = bufferInPercentage + '%'; // DEBUG PURPOSE
    
    if (audioControler.ended) {
        window.clearInterval(updateCallback);
        callback_OnSongEnded();
    }
}

function callback_OnSongEnded()
{
    // TODO: CALLBACK TO END SONG HERE, MAYBE NEXT OR REPLAY OR STOP
}
