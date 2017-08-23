document.addEventListener("turbolinks:load", function() {
  var SearchInput = {
    checkEmpty: function($target) {
      $target.val().replace(/\W/g, '').length > 0
    },
    bind: function() {
      //...
    }
  }
  
  $('#search input').on('keyup', function(e) {
    e.preventDefault();
    // e.stopImmediatePropagation();
    if ($(e.target).val().replace(/\W/g, '').length > 0) {
      $('#search_results').show();
      $.ajax({
        url: "/users/search",
        type: 'get',
        data : $("#search").serialize(),
      });
    }
  });

  $(document).on('click', function(e) {
    $('#search_results').hide();
    $('#search').get(0).reset();
  });
});