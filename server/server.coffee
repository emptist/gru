Meteor.startup ->
	unless Likes.findOne({id:1000})?
		Likes.insert
			id: 1000 
			posts: 0



Meteor.publish "posts", (userid)->
	if userid? 
		Posts.find {}
		
#Meteor.publish "likes", (postid)->
#	Likes.find post:postid

Meteor.publish "appusers", (userid) ->
	if useriddd?
		Meteor.users.find()

Meteor.methods
	# {content:'',owner:'',date:''}


	'addPost':(options) ->
		#if loggedIn()
		ps = 1 + Likes.findOne(id:1000).posts
		post = {
			content: options.content
			owner: Meteor.user().username 
			date: new Date()
			index: ps
		}
		Likes.update {id:1000},{$set: posts: ps}	
		Posts.insert post

	'removePost':(id)->
		Posts.remove _id:id
	
	'removeAllPosts':()->
		Posts.remove {}
###
	'addNames':()->
		Meteor.users.update 'tgHnK8gQ46GXRAGtv', $set: {'profile.fullname': 'Mike Tyson' }
		Meteor.users.update 'Xr9viZQzp6KbvX6b7', $set: {'profile.fullname': 'Evander Holyfield' }
###	