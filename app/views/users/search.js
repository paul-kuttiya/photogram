console.log('success')
$('#search_results').remove();
$('#search').append('<%= j render "/search/result" %>');
