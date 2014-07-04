Template.postComments.likeCount = ->
	Likes.find(this._id).count()

Template.postComments.postComments = ->
	Posts.find parent: this._id 

Template.postComments.events
	'keyup .comment': (evt,tmpl) ->
		if(evt.which is 13)
			commenttext = tmpl.find('.comment').value
			options = text:commenttext, parent:this._id
			Meteor.call 'addPost', options
			$('.comment').val('').select().focus()