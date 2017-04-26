function removeAllChild(id) {
    var node = document.getElementById(id);
    while (node.firstChild)
    {
        node.removeChild(node.firstChild);
    }
}