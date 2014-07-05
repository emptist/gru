Template.posts.rendered = ->
	Deps.autorun ->
		Meteor.subscribe "posts", Meteor.userId()
		Meteor.subscribe "likes"
		Meteor.subscribe "appusers", Meteor.userId()

Template.posts.posts = ->
	Posts.find {}, 
		sort: date:-1	

Template.layout.loggedIn = ->
	Meteor.userId()?

Template.new.loggedIn = ->
	Meteor.userId()?

Template.new.events
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
