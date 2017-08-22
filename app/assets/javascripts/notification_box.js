(function() {
  document.addEventListener("turbolinks:load", function() {

    var $nav = $('nav');

    $nav.find("li").on("click", "a", function(e) {
      //toggle box only if click on notification link
      if (this.id === "notificationLink") {
        e.preventDefault();
        e.stopImmediatePropagation();
        
        // updateCount;
        $.ajax({
          url: "/accounts/mark_notification",
          type: 'put',
          success: function() {
            $(this).siblings("span.count").text("0");
          }.bind(this),
        });

        //fix bootstrap appears with notification box
        $nav.find('li.dropdown').removeClass("open")
        
        $("#notificationContainer").toggle();
      } else {
        $("#notificationContainer").hide();
      }

      //unbind footer to link to activity page
      $("#notificationFooter").click(function(e) {
        $(this).unbind();
      });

      //hide notification when click outside the box
      $(document).on("click", function(e) {
        e.stopImmediatePropagation();

        if ((!$(e.target).parents('#notification_li').length)) {
          $("#notificationContainer").hide();
        }
      });  
    });

  });
}());