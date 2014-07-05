Template.layout.loggedIn = ->
	Meteor.userId()?
###
Template.searchform.events 
	'click #search': (e,t) ->
		unless key = $('#searchKey').val()?
			return
		else
			Meteor.go "searchResults"
###

###
Template.posts.rendered = ->
	Deps.autorun ->
		Meteor.subscribe "posts", Meteor.userId()
		Meteor.subscribe "likes"
		Meteor.subscribe "appusers", Meteor.userId()
###

Template.posts.posts = ->
	Posts.find parent:null, 
		sort: lastCommentDate:-1	



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
		title = t.find('#title').value?.trim()
		content = t.find('#content').value?.trim()
		unless title 
			unless content
				return
			#console.log this, 'clicked'
		
		Meteor.call "addPost",
			parent: @_id 
			title: title
			content: content
			#comments:[]
		
		$('#content').val('')
		$('#title').val('').select().focus()
				
			

	'click #cancel': (e,t)->
		$('#content').val ''
		$('#title').val('').select().focus()
		