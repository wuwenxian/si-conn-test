module.exports = (grunt)->
	grunt.initConfig 
		coffee:
			complie:
				expand:true
				flatten:true
				cwd:'./'
				src:['*.coffee','!Gruntfile.coffee']
				dest:'./'
				ext:'.js'
		watch:
			files:['*.coffee']
			tasks:['coffee']
			options:
				spawn:false

	grunt.loadNpmTasks 'grunt-contrib-coffee'	
	grunt.loadNpmTasks 'grunt-contrib-watch'

	grunt.registerTask 'default',['coffee','watch']	