User.create(first_name: 'Nick', last_name: 'Block', email: 'n@b.com', password: 'pass')

Recipe.create(title: 'Homemade Popcorn', description: 'Ditch the microwave and make this classic snack extra deliciously fresh and healthy!', prep_time: 5, cook_time: 5, user_id: 1)
	Ingredient.create(title: 'unpopped corn kernels', amount: '1 cup', recipe_id: 1 )
	Ingredient.create(title: 'olive oil', amount: '1/4 cup', recipe_id: 1 )
	Ingredient.create(title: 'salt', amount: 'to taste', recipe_id: 1 )
	Instruction.create(step: 'Pour kernels and oil into stockpot. Be sure all the kernels are covered. Turn on the heat onto medium-high. Cover pot with lid', recipe_id: 1)
	Instruction.create(step: "Listen for popping. Occassionally shake pot to even out kernels not yet popped.", recipe_id: 1 )
	Instruction.create(step: 'Once popping slows, turn off the heat.', recipe_id: 1)
	Instruction.create(step: "Pour a little olive oil and the salt over popped popcorn and mix. Then serve!", recipe_id: 1)

