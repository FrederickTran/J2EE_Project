var UI_songList;

var DATA_songList = [];

window.addEventListener('load', function () {
    UI_timeNavigator = document.getElementById('song_list_player');
});

function action_AddSong(songName, musician, songId)
{
    if ($("#side_bench_media_player").width() > 0)
    {
        var generatedSongElement = generatePlaylistSongItem(songName, musician);
        var playList = document.getElementById("song_list_player");
        playList.appendChild(generatedSongElement);
        generatedSongElement.style.animation = EFFECT_FADEIN;
        playList.scrollTop = playList.scrollHeight;
    }
    else
    {
        alert('PLAY SONG:' + songName);
        // playSong(songName, musician, isBought, isFree);
    }
}