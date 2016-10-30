$(document).ready(function($) {
  $("#weather").on("submit", "form", function(event) {
    event.preventDefault();
    var citySubmitted = $(this).serialize();
    var descriptionHolder = $(this).closest('#weather').find('#weather-results')

    $.ajax({
      type: "POST",
      url: "/weather",
      dataType: "json",
      data: citySubmitted
    })
    .done(function(weatherInfo) {
      descriptionHolder.empty();
      descriptionHolder.append("<h4>It is currently " + weatherInfo['description'] + ", with a temperature of " + weatherInfo['temperature'] + " degrees in the city of " + weatherInfo['city'] + ".");
      $("#weather").find("input[type=submit]").removeAttr('disabled');
    })
    .fail(function() {
      console.log("error")
    })
    .always(function() {
      console.log("complete");
    });
  });
});
