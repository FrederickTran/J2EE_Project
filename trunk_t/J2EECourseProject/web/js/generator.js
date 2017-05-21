function generateRandomImageThumbnail(href) {
    switch (href) {
        case "src_random_musician":
            var doc = '<img src="';
            doc += getLinkFromHref(href);
            doc += '" class="img-thumbnail"/>';
            return doc;
        default: return '';
    }
}

function createIconButton(iconFont, iconClass, callback) {
    var buttonElement = document.createElement(TAG_BUTTON);
    buttonElement.classList.add(CLASS_BUTTON);
    buttonElement.classList.add(CLASS_BUTTON_DEFAULT);
    buttonElement.classList.add(CLASS_BUTTON_NO_OUTLINE);
    buttonElement.style.margin = '0px';
    buttonElement.style.padding = '5px';
    buttonElement.onclick = callback;
    var iconElement = document.createElement(TAG_I);
    iconElement.classList.add(iconFont);
    iconElement.classList.add(iconClass);

    buttonElement.onclick = function (event){callback(); event.stopPropagation();};

    buttonElement.appendChild(iconElement);
    return buttonElement;
}

function generateSearchSongItem(songName, musician, isBought, isFree, id) {
    var result = document.createElement(TAG_DIV);
    result.classList.add(CLASS_SONG_ITEM);
    result.classList.add(CLASS_UNSELECTABLE_OBJECT);

    // /*Background image*/
    // var imgChild = document.createElement(TAG_IMG);
    // imgChild.src = RESOURCE_SONG_ITEM;
    // imgChild.style.opacity = '0.1';
    // imgChild.style.position = 'absolute';
    // imgChild.width = '100%';
    // imgChild.height = '100%';
    // result.appendChild(imgChild);
    // imgChild.classList.add(CLASS_UNSELECTABLE_OBJECT);

    /*Control buttons*/
    var controlPanel = document.createElement(TAG_DIV);
    controlPanel.classList.add(CLASS_SONG_ITEM_CONTROL_BUTTON);
    controlPanel.id = ID_SONG_ITEM_CONTROL_PANEL;
    controlPanel.classList.add(CLASS_UNSELECTABLE_OBJECT);
    
        /*Sub button 1: Play*/
        controlPanel.appendChild(createIconButton(CLASS_ICON_FONT, CLASS_ICON_NAME_PLAY, function (){playSong(songName, musician, isBought, isFree);}));
        /*Sub button 1: Share*/
        controlPanel.appendChild(createIconButton(CLASS_ICON_FONT, CLASS_ICON_NAME_SHARE, function (){}));
        /*Sub button 1: Bookmark (heart)*/
        controlPanel.appendChild(createIconButton(CLASS_ICON_FONT, CLASS_ICON_NAME_BOOKMARK, function (){}));

    result.appendChild(controlPanel);

    var songNameWrapper = document.createElement(TAG_DIV);
    songNameWrapper.classList.add(CLASS_UNSELECTABLE_OBJECT);

    /*Song name*/
    var songNameElement = document.createElement(TAG_P);
    songNameElement.classList.add(CLASS_SONG_ITEM_NAME);
    songNameElement.classList.add(CLASS_UNSELECTABLE_OBJECT);
    songNameElement.textContent = songName;
    songNameWrapper.appendChild(songNameElement);

    /*Tags*/
    if (isFree == true)
    {
        var freeTag = document.createElement(TAG_P);
        freeTag.classList.add(CLASS_SONG_ITEM_TAG);
        freeTag.classList.add(CLASS_UNSELECTABLE_OBJECT);
        freeTag.classList.add(CLASS_SONG_ITEM_TAG_FREE);
        freeTag.textContent = 'Free';
        songNameWrapper.appendChild(freeTag);
    }
    else
    {
        var tagElement = document.createElement(TAG_P);
        tagElement.classList.add(CLASS_SONG_ITEM_TAG);
        tagElement.classList.add(CLASS_UNSELECTABLE_OBJECT);

        if (isBought == true && isLoggedIn() == true) {
            tagElement.classList.add(CLASS_SONG_ITEM_TAG_OWN);
            tagElement.textContent = 'Own';
        }
        else {
            tagElement.classList.add(CLASS_SONG_ITEM_TAG_SALE);
            tagElement.textContent = '$0.32';
        }

        songNameWrapper.appendChild(tagElement);
    }

    result.appendChild(songNameWrapper);

    /*Musician*/
    var musicianNameElement = document.createElement(TAG_P);
    musicianNameElement.classList.add(CLASS_SONG_ITEM_MUSICIAN);
    musicianNameElement.classList.add(CLASS_UNSELECTABLE_OBJECT);
    musicianNameElement.textContent = musician;
    result.appendChild(musicianNameElement);

    /*Splitbar*/
    var splitbarElement = document.createElement(TAG_HR);
    splitbarElement.classList.add(CLASS_UNSELECTABLE_OBJECT);
    result.appendChild(splitbarElement);

    /*Callback*/
    result.onclick = function () {addSongToPlayList(songName, musician, isBought, isFree, id);};
    result.id = id;

    return result;
}

function generatePlaylistSongItem(songName, musician) {
    var result = document.createElement(TAG_DIV);
    result.classList.add(CLASS_SONG_ITEM);
    result.classList.add(CLASS_UNSELECTABLE_OBJECT);

    /*Control buttons*/
    var controlPanel = document.createElement(TAG_DIV);
    controlPanel.classList.add(CLASS_SONG_ITEM_CONTROL_BUTTON);
    controlPanel.id = ID_SONG_ITEM_CONTROL_PANEL;
    controlPanel.classList.add(CLASS_UNSELECTABLE_OBJECT);

    /*Sub button 1: Remove*/
    controlPanel.appendChild(createIconButton(CLASS_ICON_FONT, CLASS_ICON_NAME_REMOVE, function (){
        result.style.animation = "slideout 0.2s";
        setTimeout(function () {
            document.getElementById("song_list_player").removeChild(result);
        },200);
    }));
    /*Sub button 1: Share*/
    controlPanel.appendChild(createIconButton(CLASS_ICON_FONT, CLASS_ICON_NAME_SHARE, function (){}));
    /*Sub button 1: Bookmark (heart)*/
    controlPanel.appendChild(createIconButton(CLASS_ICON_FONT, CLASS_ICON_NAME_BOOKMARK, function (){}));

    result.appendChild(controlPanel);

    var songNameWrapper = document.createElement(TAG_DIV);
    songNameWrapper.classList.add(CLASS_UNSELECTABLE_OBJECT);

    /*Song name*/
    var songNameElement = document.createElement(TAG_P);
    songNameElement.classList.add(CLASS_SONG_ITEM_NAME);
    songNameElement.classList.add(CLASS_UNSELECTABLE_OBJECT);
    songNameElement.textContent = songName;
    songNameWrapper.appendChild(songNameElement);

    /*Musician*/
    var musicianNameElement = document.createElement(TAG_P);
    musicianNameElement.classList.add(CLASS_SONG_ITEM_MUSICIAN);
    musicianNameElement.classList.add(CLASS_UNSELECTABLE_OBJECT);
    musicianNameElement.textContent = musician;
    songNameWrapper.appendChild(musicianNameElement);

    /*Splitbar*/
    var splitbarElement = document.createElement(TAG_HR);
    splitbarElement.classList.add(CLASS_UNSELECTABLE_OBJECT);
    songNameWrapper.appendChild(splitbarElement);

    result.appendChild(songNameWrapper);

    /*Callback*/
    result.onclick = function () {playSong(songName, musician, true, true);};

    return result;
}