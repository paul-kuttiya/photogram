var $input = $('.user-profile .button_to').find('input[type="submit"]');

var toggleFollow = {
  unfollow: '<%= @unfollow %>' === 'true',
  followToggle: function() {
    console.log(this.unfollow)
    if (this.unfollow) {
      this.toggleButton('Follow', 'btn-default', 'btn-primary');
    } else {
      this.toggleButton('Following', 'btn-primary', 'btn-default');
    }
  },
  toggleButton: function(text, remove_class, add_class) {
    $input.val(text).removeClass(remove_class).addClass(add_class);
  },
  init: function() {
    this.followToggle();
  },
}

toggleFollow.init();

// if ('<%= @unfollow %>' === 'true') {
//   $input.val('Follow').removeClass('btn-default').addClass('btn-primary');
// } else {
//   $input.val('Following').removeClass("btn-primary").addClass('btn-default');
// }