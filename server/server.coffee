approved = (name) ->
	name in ['ruru', 'jigme']

Meteor.startup ->
	unless Likes.findOne({id:1000})?
		Likes.insert
			id: 1000 
			posts: 0



Meteor.publish "posts", (user)->
	if approved user 
		Posts.find {}
		

Meteor.methods
	# {content:'',owner:'',date:''}


	'addPost':(options) ->
		#if loggedIn()
		username = Meteor.user().username
		unless approved username
			return
		ps = 1 + Likes.findOne(id:1000).posts
		post = {
			content: options.content
			owner: username 
			date: new Date()
			index: ps
		}
		Likes.update {id:1000},{$set: posts: ps}	
		Posts.insert post

	'removePost':(id)->
		Posts.remove _id:id
	
	'removeAllPosts':()->
		Posts.remove {}
