function addToCart(id) {
    var xhttp = new XMLHttpRequest();
    var url = "/account/addToCart/";
    url += id;
    
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
        }
    }
    xhttp.open("POST", url);
    xhttp.send();                
}
