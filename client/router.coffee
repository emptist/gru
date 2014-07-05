Router.configure
  layoutTemplate: 'layout'
  notFoundTemplate: 'notFound'
  loadingTemplate: 'loading'
  waitOn: -> Meteor.subscribe 'posts', Meteor.userId()

Router.map -> # => will not work
  @route 'splash', path: '/'
  @route 'new'#, onAfterAction: -> this.render 'posts'
  @route 'posts'
  @route 'fullPost', path:'/posts/:_id'
###
Router.configure({
  layoutTemplate: 'layout',
  notFoundTemplate: 'notFound',
  loadingTemplate: 'loading'
});
Router.map(function() {
  	@.route('splash', {path: '/'})
  	@.route('messages');
	@.route('events');
	@.route('home');
});
###