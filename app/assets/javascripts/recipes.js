$(function () {

	$('#recipe-form').on('submit', function() {
		event.preventDefault();
		$('#search-recipes-results').empty();
		$('#search-recipe-result').empty();
		$('#search-recipe-ingredients').empty();
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

			$('#search-recipes-results').append(html);
		});
	});

	$('#search-recipes-results').on('click', '.recipe', function() {
		$('#search-recipe-result').empty();
		$('#search-recipe-ingredients').empty();
		var recipe = $(this);
		console.log(recipe[0].value)
		var recipeId = recipe[0].value;
		$.when(
			// $.ajax({
			// 	url: '/instructions',
			// 	method: 'get',
			// 	data: {recipe_id: recipeId}
			// })
			// .done(function(response) {
			// 	console.log(response);
			// 	var steps = response.body[0].steps;
			// 	var html = '<ul>';
			// 	for (var i = 0; i < steps.length; i++) {
			// 		html += '<li>' + steps[i].step + '</li>';
			// 	}
			// 	html += '</ul>';
				// $('#search-results').append(html);
			// }),
			$.ajax({
				url: '/ingredients',
				method: 'get',
				data: {recipe_id: recipeId}
			})
			.done(function(response) {
				console.log(response.body.extendedIngredients);
				var ingredients = response.body.extendedIngredients;
				var ingredientList = '<ul>';
				var object = response.body


				for (var i = 0; i < ingredients.length; i++) {
					ingredientList += '<li>' + ingredients[i].originalString + '</li>'
				}
				ingredientList += '</ul>'


				$('#search-recipe-ingredients').append(ingredientList);
				$('#search-recipe-result').append('<p>'+object.instructions+'</p>');
				// var steps = response.body[0].steps;
				// var html = '<ul>';
				// for (var i = 0; i < steps.length; i++) {
				// 	html += '<li>' + steps[i].step + '</li>';
				// }
				// html += '</ul>';
				// $('#search-results').append(html);
			})
		)
		.then(function() {
			console.log('Now finished');
		})


	})


});
