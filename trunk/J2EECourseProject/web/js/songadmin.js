function onLoadSongAdmin(){
   
    $(".dropdown-menu li a").click(function(){
        var selText = $(this).text();
        $(this).parents('.btn-group').find('.dropdown-toggle').html(selText+' <span class="caret"></span>');
        var page = document.getElementById("curPage").innerText;
        getPage(1);
        $("#btnSearch").click(function(){
            alert($('.btn-select').text()+", "+$('.btn-select2').text());
        });
    });
//    $('#new-song-form').submit(function () {
//        validate();
//        return false;
//    });
}
function deleteSong(id){
    var result = confirm("Want to delete this song?");
    if (result) {
        var table = document.getElementById("table-songs");
        var i = 0;
        for (i = 0; i < table.rows.length; i++) 
        {
            if(table.rows[i].id == id)
                break;
        }
        var xhttp;    
        var params = "task=delete&id="+id;
        xhttp = new XMLHttpRequest();
        xhttp.open("POST", "songs.do", true);
        xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        xhttp.onreadystatechange = function() {
          if (this.readyState == 4 && this.status == 200) {
            if(this.responseText == "success"){
                table.deleteRow(i);
                displaySnackbar("Delete Success!");
            }else{
                displaySnackbar("Can't delete!");
            }
          }
          return false;
        };
        xhttp.send(params);
    }
    return false;
}

function getPage(page){
    var num = parseInt(document.getElementById("btnRegion").innerText);
    var sort = document.getElementById("sort-by-name");
    window.location = 'songs.do?task=retrieve&num=' + num + "&page=" + page + "&sort=" + sort.checked;
}
function validate(){
    var songId = document.getElementById("songid");
    var songName = document.getElementById("songname");
    var file = document.getElementById("file");
    if(songName.value === ""){
        alert("Please input song name!");
        return false;
    }
    if(songId.value === ""){
        if(file.file === ""){
            alert("Please select file!");
            return false;
        }
    }
    return true;
}

function search(){
    key = document.getElementById("srch-term").value;
    if(key === "" || key.length < 2)
    {
        alert("Search key should has more than 1 letter!");
        return false;
    }
    window.location = 'songs.do?task=search&key=' + key;
    return false;
}



