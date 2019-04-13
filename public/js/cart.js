function clearCart() {
    var xhttp = new XMLHttpRequest();
    var url = "/account/clearCart/";
    
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            let response = xhttp.response;
            clearCartDOM();
        }
    }
    xhttp.open("POST", url);
    xhttp.send();                
}

function clearCartDOM() {
    let itemDivs = document.getElementsByClassName("itemContainer");
    while (itemDivs.length > 0) {
        itemDivs[0].remove();
    }
    let newText = document.createElement("p");
    newText.innerText = "Looks empty here!";
    let shopDiv = document.getElementsByClassName("shop")[0];
    shopDiv.insertBefore(newText, shopDiv.childNodes[2]);

    let price = document.getElementById("total");
    price.innerText = "Total: 0 kr"
}
