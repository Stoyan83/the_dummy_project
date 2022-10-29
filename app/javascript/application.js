// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// Toggle navbar
document.addEventListener("turbo:load", function() {
$(document).ready(function () {
  $(".nav-toggler").each(function (_, navToggler) {
    var target = $(navToggler).data("target");
    $(navToggler).on("click", function () {
      $(target).animate({
        height: "toggle",
      });
    });
  });
});
});

// Hide alerts
$(document).ready(function() {
  $(document).on('click','.error', function() {
      $(this).remove();
  });
});

// Confimration on delete user

window.confirmDestroy = ("turbolinks:load", function(message) {
  if (!confirm(message)) {
    return false;
  }
})