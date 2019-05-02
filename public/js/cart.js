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

// static index needs to be updated between removes
function decrementDOM(index) {
    let itemDivs = document.getElementsByClassName("itemContainer");
    let amounts = document.getElementsByClassName("amount");
    let domIndex = null;
    for (let i = 0; i < itemDivs.length; i++) {
        if (itemDivs[i].firstElementChild.id.split("_").slice(-1)[0]) {
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

function removeFromCart(index) {
    var xhttp = new XMLHttpRequest();
    var url = "/account/removeItem/" + index;
    
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            let response = xhttp.response;
            decrementDOM(index);
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
    let newText = document.createElement("p");
    newText.innerText = "Looks empty here!";
    let shopDiv = document.getElementsByClassName("shop")[0];
    shopDiv.insertBefore(newText, shopDiv.childNodes[2]);

    let price = document.getElementById("total");
    price.innerText = "Total: 0 kr"
}


