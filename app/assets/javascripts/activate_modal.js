$(function() {
  document.addEventListener("turbolinks:load", function() {

    var ipad = !!($(window).width() <= 1025),
        followLinks = $('a#follower-link, a#following-link');
        
    // if width is smaller than desktop
    // will disable ajax and modal
    if (ipad) {
      console.log(followLinks.get(0));
      followLinks.removeAttr('data-toggle').removeAttr('data-remote');
    }
  
  }());
});
