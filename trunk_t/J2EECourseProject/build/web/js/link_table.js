const ref_main_page="index_demo2.html";
const ref_e404_page="e404.html";

const src_random_musician="mar/icon.png";

function getLinkFromHref(href) {
    switch (href){
        case "ref_main_page": return ref_main_page;
        case "src_random_musician": return src_random_musician;
        default: return ref_e404_page;
    }
}

function getLink(element) {
    var ref_code=element.getAttribute("href");
    switch (ref_code){
        case "ref_main_page": element.setAttribute("href", getLinkFromHref(ref_code)); return false;
        case "src_random_musician": element.setAttribute("src", getLinkFromHref(ref_code)); return false;
        default: element.setAttribute("href", getLinkFromHref(ref_code)); break;
    }
}