$(document).ready(function($) {

  $("#instagram").on("click", "a", function(event) {
    event.preventDefault();
    console.log("Clicked!");
    var pictureHolder = $(this).closest('#instagram').find('#my-pictures');

    $.ajax({
      type: "POST",
      url: "/instagram/",
      dataType: "json"
    })
    .done(function(infoback) {
      console.log("Back from server!!!")
      console.log(infoBack)
      pictureHolder.empty();
      // urlHolder.append("<p>You have chosen to listen to " + songInfo['name'] + "by "+ songInfo['artist'] + "</p>")
      // urlHolder.append("<audio controls> <source src=" + urlToUpdate + "> </audio>");
      // $("#music").find("input[type=submit]").removeAttr('disabled');
    })
    .fail(function() {
      console.log("error")
    })
    .always(function() {
      console.log("complete");
    });
  });

});

