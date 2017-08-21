var $profile = $('body'),
    currentUserPage = '<%= @user_page %>' === 'true',
    $input = $profile.find('.button_to input[data-id="<%= @user.id %>"]'),
    $follower = currentUserPage ? $profile.find('#follower') : $profile.find('#follower_<%= @user.id %>'),
    $following = currentUserPage ? $profile.find('#following') : $profile.find('#following_<%= @user.id %>');

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
  getValue: function(button) {
    parseInt(button.text(), 10);
  },
  updateFollowText: function(follow) {
    var value = this.getValue(follow),
        update_value;
    
    update_value = (this.unfollow) ? value - 1 : value + 1;

    return this.updateValue(follow, update_value);
  },
  getValue: function(button) {
    return parseInt(button.text(), 10);
  },
  updateValue: function(button, new_value) {
    button.text(new_value)
  },
  init: function() {
    this.followToggle();
    currentUserPage ? this.updateFollowText($following) : this.updateFollowText($follower);
  },
}

toggleFollow.init();