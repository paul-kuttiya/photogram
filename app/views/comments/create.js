
var $show_page = $('#content .post-show'),
		$form = $show_page.find('form#comment-form'),
		$comments_container = $show_page.find('.comments'),
		$first_comment = $comments_container.find('li#caption');

var InsertComment = {
	comment: function() {
		return $([
			"<li>",
			"  <a href='/<%= @comment.user.username %>'><%= @comment.user.username %></a>",
			"  <span><%= @comment.description %></span>",
			"</li>"
		].join("\n"));		
	},
	insert: function() {
		this.comment().insertAfter($first_comment);
	},
	reset: function() {
		$form.get(0).reset();
	},
	init: function() {
		this.insert();
		this.reset();
	},
}

InsertComment.init();
