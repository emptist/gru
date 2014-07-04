Router.configure
  layoutTemplate: 'layout'
  notFoundTemplate: 'notFound'
  loadingTemplate: 'loading'

Router.map -> # => will not work
  @route 'splash'
  @route 'formNewEdit'
  @route 'articles'
  @route 'new'
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