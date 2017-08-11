$(function() {
  $main = $('#content');

  var CommentForm = {
    $commentIcon: $main.find(`[data-type="comment_icon"]`),
    $commentInput: $('form input#comment-input'),
    jumpToCommentForm: function() {
      var self = this;
      
      this.$commentIcon.on('click', function(e) {
        e.preventDefault();
        self.hideInput();

        var id = $(this).data('id'),
            input = $(this).parents(`.post-wrapper[data-id=${id}]`).find('input#comment-input');

        input.show().focus();
      });
    },
    hideInput: function() {
      this.$commentInput.hide();
    },
    init: function() {
      this.hideInput();
      this.jumpToCommentForm();      
    },
  }
  CommentForm.init();
});