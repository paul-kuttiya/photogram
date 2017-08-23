var mobile = !!($(window).width() <= 737);

$('#search_results').remove();
if (mobile) {
  console.log('mobile-search')
  $('#search-mobile').append('<%= j render "/search/result" %>');
} else {
  console.log('desktop search')
  $('#search').append('<%= j render "/search/result" %>');
}
