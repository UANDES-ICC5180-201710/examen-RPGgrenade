/**
 * Created by Jaime on 6/21/2017.
 */

function getPurchase(game_id) {
    var url = "/purchases/" + game_id + "/check";
    console.log(url);
    $.ajax({
        type: "GET",
        url: url,
        dataType: "json",
        success: function (result) {
            var button = $("#purchase-button");
            if (result.ipurchasedIt) {
                button.toggleClass("btn-primary btn-success");
            }
            console.log(result.ipurchasedIt);
        }
    })
}

function addPurchase(game_id){
    $.ajax({
        type:"POST",
        url: "/purchases/" + game_id + "/add",
        dataType: "json",
        success: function (result) {
            var button = $("#purchase-button");
            if (result.ipurchasedIt) {
                button.toggleClass("btn-primary btn-success");
            }
            console.log(result)
        }
    })
}

function removePurchase(game_id){
    $.ajax({
        type:"DELETE",
        url: "/purchases/" + game_id + "/remove",
        dataType: "json",
        success: function (result) {
            var button = $("#purchase-button");
            if (result.ispurchasedIt) {}
            else{ button.toggleClass("btn-primary btn-success"); }
            console.log(result);
        }
    })
}

$(document).ready(function (){
    var purchase_button = $('#purchase-button');
    //Include code relating to reading whether the user purchased this gameument
    //need to add a table for "purchases" of some kind.
    purchase_button.ready(function () {
        var game_id = $("#game_id").attr('data-id');
        getPurchase(game_id);
    });

    purchase_button.click(function () {
        var game_id = $("#game_id").attr('data-id');
        if ($(this).hasClass("btn-success")){
            console.log("removing purchase");
            removePurchase(game_id);
        }
        else if ($(this).hasClass("btn-primary")){
            console.log("adding purchase");
            addPurchase(game_id);
        }
        $(this).blur();
    });
});