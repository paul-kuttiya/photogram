var $show_page = $('#content .post-show'),
		$form = $show_page.find('form#comment-form'),
		$comments_container = $show_page.find('.comments'),
		$last_comment = $comments_container.find('li').last();
		// $first_comment = $comments_container.find('li#caption');
		console.log('<%= process_link(@comment.description) %>')

var $show_page = $('#content .post-show'),
		$form = $show_page.find('form#comment-form'),
		$submit = $form.find('input[type="submit"]');

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
