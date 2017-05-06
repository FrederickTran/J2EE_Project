var UI_searchList;

window.addEventListener('load', function () {
    UI_timeNavigator = document.getElementById('song_list_search');
});

function action_addSongToPlayList(songName, musician, isBought, isFree, id)
{
    if (isLoggedIn() == false && isFree == false)
    {
        $("#modal_sign_in").modal('show');
        return;
    }

    if (isBought == false && isFree == false)
    {
        $("#modal_buy_confirm").modal('show');
        /*display buy confirm*/
    }
    else
    {
        action_addSong(songName, musician, id);
    }
}