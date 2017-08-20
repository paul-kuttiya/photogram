var $profile = $('body'),
    $input = $profile.find('.button_to input[data-id="<%= @user.id %>"]'),
    $follower = $profile.find('#follower'),
    $following = $profile.find('#following');

var toggleFollow = {
  unfollow: '<%= @unfollow %>' === 'true',
  followToggle: function() {
    if (this.unfollow) {
      this.toggleButton('Follow', 'btn-default', 'btn-primary');
    } else {
      this.toggleButton('Following', 'btn-primary', 'btn-default');
    }
  },
  toggleButton: function(text, remove_class, add_class) {
    $input.val(text).removeClass(remove_class).addClass(add_class);
  },
  updateFollowText: function($follower) {
    var value = parseInt($follower.text(), 10),
        update_value;
    
    update_value = (this.unfollow) ? value - 1 : value + 1;

    return $follower.text(update_value); 
  },
  init: function() {
    this.followToggle();
    this.updateFollowText($follower);
  },
}

toggleFollow.init();