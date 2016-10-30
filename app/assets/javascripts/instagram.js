$(document).ready(function($) {

  $("#instagram").on("click", "#show", function(event) {
    event.preventDefault();
    var pictureHolder = $(this).closest('#instagram').find('#my-pictures');

    $.ajax({
      type: "POST",
      url: "/instagram/",
      dataType: "json"
    })
    .done(function(infoBack) {
      var picUrls = infoBack['urls'];
      pictureHolder.empty();
      pictureHolder.prepend("<h2>Instagram for " + infoBack['username'] + "</h2>");
      for ( i = 0 ; i < picUrls.length; i++) {
        pictureHolder.append("<div class='media ind-picture'><img class='img-thumbnail' src=" + picUrls[i] + ">")
      }
    })
    .fail(function() {
      console.log("error")
    })
    .always(function() {
      console.log("complete");
    });
  });

  $("#instagram").on("click", "#hide", function(event) {
    event.preventDefault();
    var pictureHolder = $(this).closest('#instagram').find('#my-pictures');

      pictureHolder.empty();
      });
});

