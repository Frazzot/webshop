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

function decrementDOM(index) {
    let itemDivs = document.getElementsByClassName("itemContainer");
    let amounts = document.getElementsByClassName("amount");
    let domIndex = null;
    for (let i = 0; i < itemDivs.length; i++) {
        if (itemDivs[i].firstElementChild.id.split("_").slice(-1)[0] == index) {
            domIndex = i;
            break;
        }
    }

    if (amounts[domIndex].innerText > 1) {
        amounts[domIndex].innerText--;
    } else {
        itemDivs[domIndex].remove();
    }    
}

function updateTotalPrice() {
    let totalPrice = 0;
    let itemDivs = document.getElementsByClassName("itemContainer");
    let sum = 0
    if (itemDivs.length > 0) {
        for (let i = 0; i < itemDivs.length; i++) {
            let current = itemDivs[i];
            let price= parseInt(current.children[2].innerText);
            let amount = parseInt(current.children[1].innerText);
            sum += price * amount
        }
        total = document.getElementById("total");
        total.innerText = "Total: " + sum + "kr"

    } else {
        let totalElement = document.getElementById("total");
        totalElement.innerText = "Total: 0kr"
        if (document.getElementById("clearEmpty") == null) {
            let newText = document.createElement("p");
            newText.innerText = "Looks empty here!";
            newText.id = "clearEmpty";
            let shopDiv = document.getElementsByClassName("shop")[0];
            shopDiv.insertBefore(newText, shopDiv.childNodes[2]);
        }
    }
}

function removeFromCart(index) {
    var xhttp = new XMLHttpRequest();
    var url = "/account/removeItem/" + index;
    
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            let response = xhttp.response;
            decrementDOM(index);
            updateTotalPrice();
        }
    }

    let name = document.getElementById("name_" + index);
    console.log(name);
    let data = {
        "game_name": name.innerText
    };
    xhttp.open("POST", url);
    xhttp.send(JSON.stringify(data));
}

function clearCartDOM() {
    let itemDivs = document.getElementsByClassName("itemContainer");
    while (itemDivs.length > 0) {
        itemDivs[0].remove();
    }
    if (document.getElementById("clearEmpty") == null) {
        let newText = document.createElement("p");
        newText.innerText = "Looks empty here!";
        newText.id = "clearEmpty";
        let shopDiv = document.getElementsByClassName("shop")[0];
        shopDiv.insertBefore(newText, shopDiv.childNodes[2]);
    }


    let price = document.getElementById("total");
    price.innerText = "Total: 0 kr";
}
