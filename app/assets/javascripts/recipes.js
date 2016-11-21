$(function () {
	$('#recipe-form').on('submit', function() {
		event.preventDefault();
		$('#search-results').empty();
		var searchTerm = $('#recipe-search').val();
		
		$form = $(this);
		$.ajax({
			url: $form.attr('action'),
			method: $form.attr('method'),
			data: {search: searchTerm}
		})
		.done(function(response) {
			var results = JSON.parse(response.raw_body).results;
			
			var html = '<ul>';
			for (var i = 0; i < results.length; i ++) {
				html += '<li>' + results[i].title + '</li>';
			}
			html += '</ul>';
			
			$('#search-results').append(html);
			
			
			
		});
	})
});