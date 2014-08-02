loggedIn = ->
	Meteor.userId()?
username = ->
	Meteor.user()?.username

Template.posts.rendered = ->
	Deps.autorun ->
		Meteor.subscribe "posts", username()
		#Meteor.subscribe "likes"

Template.posts.posts = ->
	Posts.find {}, 
		sort: date:-1	

Template.new.events
	'click button': (e,t)->
		e.preventDefault()
		
	'click #submitNew': (e,t)->
		content = t.find('#content').value?.trim()
		unless content?
			return
			#console.log this, 'clicked'
		else
			Meteor.call "addPost",
				content: content
			$('#content').val('').select().focus()

	'click #cancel': (e,t)->
		$('#content').val('').select().focus()
