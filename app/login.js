define([
	'require',
	'dojo/ready',
	'dijit/registry',
    'app/views/LoginView',
	'dijit/Dialog'
], function(require, ready, registry, LoginView){
	
	var app = {};
	
	ready(function(){
		//console.log('loaded! baseUrl=' + dojoConfig.baseUrl);
		app.login({
			url: dojoConfig.baseUrl + '/api/login',
			onSuccess: function(response){
				//console.log(response.message);
				this.onExecute(); // Hide dialog.
				location.href = dojoConfig.baseUrl + '/';
			},
			onFailure: function(response){
				console.log(response.message);
				app.alert('Invalid username or password!');
			}
		});
	});
	
	/**
	 * Display alert dialog.
	 */
	app.alert = function(message){
		var dialog = new dijit.Dialog({ title: 'Alert', content: message });
		dialog.show();
	};
	
	/**
	 * Display login dialog.
	 */
	app.login = function(options){
		var dialog = new LoginView(options);
		dialog.show();
	};
	
	return app;
});