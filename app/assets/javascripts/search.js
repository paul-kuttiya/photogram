document.addEventListener("turbolinks:load", function() {

  var $search = $("#search"),
      $input = $search.find('input'),
      $searchResults = $('#search_results');

  var SearchInput = {
    checkEmpty: function(value) {
      return value.replace(/\W/g, '').length > 0
    },
    fetchSearch: function(e) {
      var value = $(e.target).val();

      if (this.checkEmpty(value)) {
        $.ajax({
          url: "/users/search",
          type: 'get',
          data : $search.serialize(),
          success: function() {
            $searchResults.show();
          }
        });
      }
    },
    search: function() {
      $input.on('keyup', function(e) {
        e.preventDefault();
        this.fetchSearch(e)
      }.bind(this));
    },
    inputReset: function() {
      $(document).on('click', function(e) {
        $('#search_results').hide();
        $search.get(0).reset();
      });
    },
    bind: function() {
      this.search();
      this.inputReset();
    }
  }
  
  SearchInput.bind();






  // function fetchSearch(e) {
  //   if ($(e.target).val().replace(/\W/g, '').length > 0) {
  //     $.ajax({
  //       url: "/users/search",
  //       type: 'get',
  //       data : $("#search").serialize(),
  //       success: function() {
  //         $('#search_results').show();
  //       }
  //     });
  //   }
  // }

  // $('#search input').on('keyup', function(e) {
  //   e.preventDefault();
    
  //   if ($(e.target).val().replace(/\W/g, '').length > 0) {
  //     $.ajax({
  //       url: "/users/search",
  //       type: 'get',
  //       data : $("#search").serialize(),
  //       success: function() {
  //         $('#search_results').show();
  //       }
  //     });
  //   }
  // });

  // $(document).on('click', function(e) {
  //   $('#search_results').hide();
  //   $('#search').get(0).reset();
  // });
});