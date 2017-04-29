var DemoSongList = ["Virus", "Moonlight Sonata", "No.9 Sonata Seg.2nd", "Cannon in D", "The Four Seasons", "St. John's Passion", "Water Music"];
var DemoBoughtList = [true, false, false, false, true, false, true];
var DemoFreeList = [false, false, true, true, false, true, false];
var DemoMusicianList = ["L.v Beethoven", "L.v Beethoven", "J.S Bach", "J. Pachelbel", "A. Vivaldi", "J.S Bach", "G.F Handel"];

window.onload = onLoad;
function onLoad(){
    $('#search-form').submit(function () {
        searchWithKey();
        return false;
    });
}

function onSearchBoxKeyPress(keyPress)
{
	if (keyPress.keyCode == 13)
	{
		searchWithKey();
	}
}

function onSignInKeyPress(keyPress)
{
	if (keyPress.keyCode == 13)
	{
		loginFormLogin();
	}
}

function relocateSearchBox(seachBenchCall, mediaBenchCall) {
    var searchBenchVisible = $("#side_bench_search_list").width() != 0 || seachBenchCall;
    var mediaBenchVisible = $("#side_bench_media_player").width() != 0 || mediaBenchCall;
    var searchBox = $("#main_search_box");

    if (searchBenchVisible && mediaBenchVisible)
    {
        searchBox.width("128%");
    }
    else if (searchBenchVisible)
    {
        searchBox.width("115%");
    }
    else if (mediaBenchVisible)
    {
        searchBox.width("113%");
    }
}

function searchWithKey()
{
    var searchBench = $("#main_search_box");
    if (searchBench.width() > 0)
    {
        renewSeachListByKey();
    }
    else
    {
        searchBench.width("33%");
        relocateSearchBox(true, false);
        //searchBench.addEventListener("transitioned webkitTransitioned oTransitionEnd MSTransitionEnd", renewSeachListByKey());
        setTimeout(function () {
            renewSeachListByKey();
        }, 400);
    }
    return false;
}

function renewSeachListByKey()
{
    removeAllChild("side_bench_search_list");

    var key = document.getElementById("main_search_box_key_word").value;
    // for demo purpose. below is actual keyword used to search.
    // var key = document.getElementById(generateSearchSongItem"main_search_box_key_word").nodeValue;
    
    
      var xhttp;    
      if (key == "") {
        return;
      }
      xhttp = new XMLHttpRequest();
      xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
          var obj = JSON.parse(this.responseText);
            for (var i = 0; i < obj.length; i++) {
                var songList = generateSearchSongItem(obj[i].songName, obj[i].musician, false, (obj[i].price == 0), i);
                document.getElementById("side_bench_search_list").appendChild(songList);
                songList.style.animation = "fadein 0.4s";
            }
        }
      };
      xhttp.open("GET", "search.do?Key="+key, true);
      xhttp.send();
}

function randomPlaylist()
{
    var mediaBench = $("#side_bench_media_player");
    var gotPlay = false;

    if (mediaBench.width() > 0)
    {
        for (j = 0; j < 5; j++) {
            for (i = 0; i < DemoSongList.length; i++) {
                if ((isLoggedIn() == true && DemoBoughtList[i] == true) ||
                    DemoFreeList[i] == true) {
                    if (Math.floor(Math.random() * 10) % 4 < 3 || gotPlay == false) {
                        if (gotPlay == false) {
                            playSong(DemoSongList[i], DemoMusicianList[i], DemoBoughtList[i], DemoFreeList[i]);
                            gotPlay = true;
                        }
                        else {
                            var songList = addSongToPlayList(DemoSongList[i], DemoMusicianList[i], DemoBoughtList[i], DemoFreeList[i], i);
                            document.getElementById("side_bench_search_list").appendChild(songList);
                            songList.style.animation = "fadein 0.4s";
                        }
                    }
                }
            }
        }
    }
    else
    {
        mediaBench.css("display: block; width: 25%;");
        mediaBench.width("25%");

        var mediaElement = document.getElementById("media_player_UI");
        setTimeout(function () {
            mediaElement.style.display = "block";
            mediaElement.style.animation = "fadein 0.4s";
        }, 400);

        setTimeout(function () {
            mediaElement.style.opacity = "1";
            randomPlaylist();
        },800);

        relocateSearchBox(false, true);
    }
}

function isLoggedIn() {
    return document.getElementById("nav_after_login").style.display == "inherit";
}

function playSong(songName, musician, isBought, isFree)
{
    if (isLoggedIn() == false && isFree == false)
    {
        $("#modal_sign_in").modal('show');
        return;
    }

    if (isBought == true || isFree == true)
    {
        document.getElementById("media_player_demo_sign").style.display = "none";
        /*Play full song*/
    }
    else
    {
        document.getElementById("media_player_demo_sign").style.display = "inherit";
        /*Play demo 10s*/
    }

    var mediaBench = $("#side_bench_media_player");
    var songNameHolder = document.getElementById("playing_song_name");
    var songMusicianHolder = document.getElementById("playing_song_musician");
    
    if (mediaBench.width() > 0)
    {
        songNameHolder.textContent = songName;
        songMusicianHolder.textContent = musician;
    }
    else
    {
        mediaBench.css("display: block; width: 25%;");
        mediaBench.width("25%");

        var mediaElement = document.getElementById("media_player_UI");
        setTimeout(function () {
            mediaElement.style.display = "block";
            mediaElement.style.animation = "fadein 0.4s";
        }, 400);

        setTimeout(function () {
            mediaElement.style.opacity = "1";
            playSong(songName, musician, isBought, isFree);
        },800);

        relocateSearchBox(false, true);
    }
}

function addSongToPlayList(songName, musician, isBought, isFree)
{
//    if (isLoggedIn() == false && isFree == false)
//    {
//        $("#modal_sign_in").modal('show');
//        return;
//    }
//
//    if (isBought == false && isFree == false)
//    {
//        $("#modal_buy_confirm").modal('show');
//        /*display buy confirm*/
//    }
//    else
    {
        if ($("#side_bench_media_player").width() > 0)
        {
            var generatedSongElement = generatePlaylistSongItem(songName, musician);
            var playList = document.getElementById("song_list_player");
            playList.appendChild(generatedSongElement);
            generatedSongElement.style.animation = "slidein 0.5s";
            playList.scrollTop = playList.scrollHeight;
        }
        else
        {
            playSong(songName, musician, isBought, isFree);
        }
    }
}

function onTermOfServiceCheckboxChange(element)
{
    document.getElementById("btn_sign_up").disabled = !element.checked;
}

function signUp() {
    var accountName = document.getElementById("user_input_user_name").value;
    var accountId = document.getElementById("user_input_user_loginid").value;
    var password = document.getElementById("user_input_user_password").value;
    var rePassword = document.getElementById("user_input_user_confirm_password").value;
    // for demo purpose. below is actual keyword used to search.
    // var key = document.getElementById(generateSearchSongItem"main_search_box_key_word").nodeValue;
    if (accountName === "") {
        alert("Please input Account Name!");
        return;
    }
    if (accountId === "") {
        alert("Please input Account Id!");
        return;
    }
    if (password === "") {
        alert("Please input Password!");
        return;
    }
    if (rePassword === "") {
        alert("Please input Confirm Password!");
        return;
    }
    if (password != rePassword) {
        alert("Confirm password is not match!");
        return;
    }
    return true;
//    var loader = document.createElement(TAG_DIV);
//    var button = document.getElementById("btn_sign_up");
//    loader.classList.add(CLASS_LOADER);
//    button.disabled = true;
//    button.appendChild(loader);
//    var xhttp; 
//    xhttp = new XMLHttpRequest();
//    xhttp.onreadystatechange = function() {
//      if (this.readyState == 4 && this.status == 200) {
//        var obj = JSON.parse(this.responseText);
//          for (var i = 0; i < obj.length; i++) {
//              var songList = generateSearchSongItem(obj[i].songName, obj[i].musician, false, (obj[i].price == 0), i);
//              document.getElementById("side_bench_search_list").appendChild(songList);
//              songList.style.animation = "fadein 0.4s";
//          }
//      }
//    };
//    xhttp.open("GET", "search.do?Key="+key, true);
//    xhttp.send();
//    setTimeout(function () {
//      signUpSuccessful(userName);
//      login(userName);
//      button.removeChild(loader);
//      onTermOfServiceCheckboxChange(button);
//      $("#modal_sign_up").modal('hide');
//  }, 4000);
}

function signUpSuccessful(userName) {
    $("#modal_sign_up").modal('hide');
    $("#modal_sign_up_successful").modal('show');
}

function login(userName) {
    document.getElementById("nav_after_login").style.display = "inherit";
    document.getElementById("nav_before_login").style.display = "none";
    renewSeachListByKey();
}

function loginFormLogin() {
    var accountId = document.getElementById("user_input_sign_in_ID").value;
    var password = document.getElementById("user_input_sign_in_password").value;
    if (accountId === "") {
        alert("Please input AccountId!");
        return;
    }
    if (password === "") {
      alert("Please input password!");
      return;
    }
    var loader = document.createElement(TAG_DIV);
    var button = document.getElementById("signin-button");
    loader.classList.add(CLASS_LOADER);
    button.disabled = true;
    button.appendChild(loader);
    var xhttp;    
    xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
        if(this.responseText == "success"){
          setTimeout(function () {
              login(accountId);
              button.removeChild(loader);
              button.disabled = false;
              onTermOfServiceCheckboxChange(button);
              $("#modal_sign_in").modal('hide');
              alert("Login Success!!!");
          }, 1000);
        }else{
            setTimeout(function () {
              button.removeChild(loader);
              button.disabled = false;
              onTermOfServiceCheckboxChange(button);
              alert("Login Fail!!!");
          }, 1000);
        }

      }
    };
    xhttp.open("GET", "login.do?accountId="+accountId+"&"+"password="+password, true);
    xhttp.send();
}

function logout() {
    document.getElementById("nav_after_login").style.display = "none";
    document.getElementById("nav_before_login").style.display = "inherit";
    // renewSeachListByKey();
    location.reload();
}

function openTermOfService() {
    $("#modal_term_of_service").modal('show');
}

function addMySong() {
    var searchBench = $("#side_bench_search_list");

    if (searchBench.width() > 0)
    {
        removeAllChild("side_bench_search_list");

        // for demo purpose. below is actual keyword used to search.
        // var key = document.getElementById("main_search_box_key_word").nodeValue;
        for (j = 0; j < 5; j++)
        {
            for (i = 0; i < DemoSongList.length; i++)
            {
                if (DemoBoughtList[i] == true) {
                    var songList = generateSearchSongItem(DemoSongList[i], DemoMusicianList[i], DemoBoughtList[i], DemoFreeList[i], i);
                    document.getElementById("side_bench_search_list").appendChild(songList);
                    songList.style.animation = "fadein 0.4s";
                }
            }
        }
    }
    else
    {
        searchBench.width("33%");
        relocateSearchBox(true, false);
        //searchBench.addEventListener("transitioned webkitTransitioned oTransitionEnd MSTransitionEnd", renewSeachListByKey());
        setTimeout(function () {
            addMySong();
        }, 400);
    }
}

function addMyList() {
    var searchBench = $("#side_bench_search_list");

    if (searchBench.width() > 0)
    {
        removeAllChild("side_bench_search_list");

        // for demo purpose. below is actual keyword used to search.
        // var key = document.getElementById("main_search_box_key_word").nodeValue;
        for (i = 0; i < DemoSongList.length; i++)
        {
            if (DemoBoughtList[i] == true) {
                var songList = generateSearchSongItem(DemoSongList[i], DemoMusicianList[i], DemoBoughtList[i], DemoFreeList[i], i);
                document.getElementById("side_bench_search_list").appendChild(songList);
                songList.style.animation = "fadein 0.4s";
            }
        }
    }
    else
    {
        searchBench.width("33%");
        relocateSearchBox(true, false);
        //searchBench.addEventListener("transitioned webkitTransitioned oTransitionEnd MSTransitionEnd", renewSeachListByKey());
        setTimeout(function () {
            addMyList();
        }, 400);
    }
}

function moveToSong(index) {

}