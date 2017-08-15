$(function() {
  var $show_page = $('#content .post-show'),
      $form = $show_page.find('form#comment-form'),
      $submit = $form.find('input[type="submit"]');

  $submit.attr('disabled', 'disabled');

  $form.find('input[type="text"]').on('keyup', function(e) {
    var val = $(this).val(),
        length = val.length;
    
    if (length >= 1 && val[0] !== '\s') {
      $submit.removeAttr('disabled');
    }
  });
});