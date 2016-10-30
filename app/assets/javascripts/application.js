// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function($) {

  $("#music").on("submit", "form", function(event) {
    event.preventDefault();
    var songSubmitted = $(this).serialize();
    var urlHolder = $(this).closest('#music').find('#audio-container')

    $.ajax({
      type: "POST",
      url: "/songs/",
      dataType: "json",
      data: songSubmitted
    })
    .done(function(songInfo) {
      console.log(songInfo)
      var urlToUpdate = songInfo['url'];
      urlHolder.empty();
      urlHolder.append("<p>You have chosen to listen to " + songInfo['name'] + "by "+ songInfo['artist'] + "</p>")
      urlHolder.append("<audio controls> <source src=" + urlToUpdate + "> </audio>");
      $("#music").find("input[type=submit]").removeAttr('disabled');
    })
    .fail(function() {
      console.log("error")
    })
    .always(function() {
      console.log("complete");
    });
  });


});
