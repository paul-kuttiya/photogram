document.addEventListener("turbolinks:load", function() {
  $slide = $('.user-form-wrapper .slideshow .slide-photo');

  var slide_time = 1500,
      i = 2;
  
    setInterval(function() {
      $slide.animate({
        opacity: 0,
      }, slide_time, function() {
        $slide.css('background-image', 'url(/placeholder/slide_' + i + '.jpeg)').animate({
          opacity: 1
        }, slide_time, function() {
          i++;
        });
      });

      i = i >= 5 ? 0 : i
    }, 3000);

  // setInterval(function() { 
  // $slide.css('background', )
  //   .fadeOut(1000)
  //   .next()
  //   .fadeIn(1000)
  //   .end()
  //   .appendTo('#slideshow');
  // },  3000);
});