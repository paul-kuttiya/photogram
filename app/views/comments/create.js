var $show_page = $('#content'),
		$comments_container = $show_page.find('.comments#comments_<%= @comment.post.id %>'),
		$form = $comments_container.siblings('form#comment-form'),
		$last_comment = $comments_container.find('li').last(),
		$submit = $show_page.find('input.btn-comment');

var InsertComment = {
	$comment: function() {
		return $([
			"<li>",
			"  <a href='/<%= @comment.user.username %>'><%= @comment.user.username %></a>",
			"  <span><%= process_link(@comment.description) %></span>",
			"</li>"
		].join("\n"));		
	},
	insert: function() {
		this.$comment().insertAfter($last_comment);
	},
	reset: function() {
		$form.get(0).reset();
	},
	disableSubmit: function() {
		$submit.attr('disabled', 'disabled');
	},
	scrollToLastItem: function() {
	},
	init: function() {
		this.insert();
		this.reset();
		this.disableSubmit();
		this.scrollToLastItem();
	},
}

InsertComment.init();
