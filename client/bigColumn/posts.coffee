###
Meteor.startup -> 
	Meteor.subscribe "posts", Meteor.userId()
	Meteor.subscribe "likes"
	Meteor.subscribe "appusers", Meteor.userId()
###

Template.layout.loggedIn = ->
	Meteor.userId()?

Template.smallColumn.loggedIn = ->
	Meteor.userId()?

Template.eusers.eusers = -> 
	Meteor.users.find {}

Template.postsList.posts = -> 
	Posts.find parent:null,
		sort: date:-1

Template.posts.rendered = ->
	Deps.autorun ->
		Meteor.subscribe "posts", Meteor.userId()
		Meteor.subscribe "likes"
		Meteor.subscribe "appusers", Meteor.userId()

Template.posts.posts = ->
	Posts.find parent:null, 
		sort: date:-1	

Template.fullPost.rendered = ->
	Deps.autorun ->
		Meteor.subscribe "post", @_id
		Meteor.subscribe "comments", @_id
Template.fullPost.post = ->
	Posts.findOne _id: @_id

Template.commentsList.comments = ->
	Posts.find parent: @_id,
		sort: date: 1

Template.new.loggedIn = ->
	Meteor.userId()?

Template.new.events
	'click #submitNew': (e,t)->
		unless title = t.find('#title').value?.trim()
			alert "title can't be empty"
		else
			content = t.find('#content').value?.trim()
			#console.log this, 'clicked'

			Meteor.call "addPost",
				parent: null 
				title: title
				content: content
				#comments:[]
			Router.go 'posts'
	
	'click #cancel': (e,t)->
		$('#title').val('')
		$('#content').val('')
		Router.go 'posts'

Template.newComment.events
	'click #submit': (e,t) ->
		unless title = t.find('#title').value?.trim()
			alert "title can't be empty"
		else
			content = t.find('#content').value?.trim()
			#console.log this, 'clicked'

			Meteor.call "addPost",
				parent: @_id 
				title: title
				content: content
				#comments:[]
			

	'click #cancel': (e,t)->
		$('#title').val('')
		$('#content').val('')
		