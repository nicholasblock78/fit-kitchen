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
			console.log(results)
			var html = '<ul>';
			for (var i = 0; i < results.length; i ++) {
				html += '<li><button value=' + results[i].id + ' class="recipe">' + results[i].title + '</button></li>';
			}
			html += '</ul>';

			$('#search-results').append(html);		
		});
	});

	$('#search-results').on('click', '.recipe', function() {
		var recipe = $(this);
		console.log(recipe[0].value)
		var recipeId = recipe[0].value;
		$.ajax({
			url: '/instructions',
			method: 'get',
			data: {recipe_id: recipeId}
		})
		.done(function(response) {
			console.log(response);
			var steps = response.body[0].steps;
			var html = '<ul>';
			for (var i = 0; i < steps.length; i++) {
				html += '<li>' + steps[i].step + '</li>';
			}
			html += '</ul>';
			$('#search-results').append(html);
		})
	})


});

// These code snippets use an open-source library.


