function clearCart() {
    var xhttp = new XMLHttpRequest();
    var url = "/account/clearCart/";
    
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
        }
    }
    xhttp.open("POST", url);
    xhttp.send();                
}
