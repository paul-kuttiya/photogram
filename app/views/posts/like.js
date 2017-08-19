var $like = $('.post-show .like'),
    $heartIcon = $like.find('section.like-icon .glyphicon-heart'),
    $likeCount = $like.find('p .like-count'),
    user = "<%= @user.username %>";

var LikePost = {
  unlike: ("<%= @unlike %>" === "true"),
  toggleHeart: function() {
    $heartIcon.toggleClass('active');
  },
  updateLikes: function(val) {
    $likeCount.text(parseInt($likeCount.text()) + val);
  },
  like: function() {
    this.toggleHeart();
    if (this.unlike) {
      this.updateLikes(-1);
    } else {
      this.updateLikes(1);
    }
  },
  init: function() {
    this.like();
  }
}

LikePost.init();