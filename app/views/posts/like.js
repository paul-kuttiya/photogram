
var $heartIcon = $('.post-show section.like-icon .glyphicon-heart'),
    user = "<%= @user.username %>";

if ("<%= @unlike %>" === "true") {
  console.log(`unliked for ${user}`)  
  $heartIcon.toggleClass('active');
} else {
  console.log(`liked for ${user}`)
  $heartIcon.toggleClass('active');
}