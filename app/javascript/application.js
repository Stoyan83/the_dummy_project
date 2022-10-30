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



// Showing and hiding edit forms in edit profile
document.addEventListener("turbo:load", function() {
  $('#hid').click(function () {
      if ($('#hidden').is(':hidden')) {
          $('#hidden').show();
          $('#hid').text('Hide').button("refresh");
      } else {
          $('#hidden').hide();
          $('#hid').text('Edit').button("refresh");
      }
    }); 
  });


  document.addEventListener("turbo:load", function() {
    $('#ph').click(function () {
        if ($('.hid').is(':hidden')) {
            $('.hid').show();
            $('#ph').text('Hide password fields').button("refresh");
        } else {
            $('.hid').hide();
            $('#ph').text('Change password').button("refresh");
        }
      }); 
    });

// Preview avatar picture 

window.preview = ("turbolinks:load", function() {
      frame.src=URL.createObjectURL(event.target.files[0]);
 });

