//post show page comment form
document.addEventListener("turbolinks:load", function() {
  var $show_page = $('#content'),
      $form = $show_page.find('form#comment-form'),
      $submit = $show_page.find('input.btn-comment');

  $submit.attr('disabled', 'disabled');

  $form.find('input[type="text"]').on('keyup', function(e) {
    var val = $(this).val(),
        length = val.length;
    
    if (length >= 1 && val[0] !== '\s') {
      $submit.removeAttr('disabled');
    }
  });
});