Router.configure
  layoutTemplate: 'layout'
  notFoundTemplate: 'notFound'
  loadingTemplate: 'loading'

Router.map -> # => will not work
  @route 'splash', path: '/'
  @route 'new'#, onAfterAction: -> this.render 'posts'
  @route 'posts'
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