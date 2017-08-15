document.addEventListener("turbolinks:load", function() {
  $main = $('#content .post-show');

  var userShow = {
    mobile: !!($(window).width() <= 415),
    $comments: $main.find('[data-type="comments"]'),
    $likeSection: $main.find('.like p'),
    init: function() {
      this.bindEvents();
    },
    bindEvents: function() {
      this.appendComments();
    },
    //re-organize user show page layout
    appendComments: function() {
      if (this.mobile) { 
        console.log("mobile")
        return this.$comments.insertAfter(this.$likeSection);
      }
    },
  }

  userShow.init();
});

