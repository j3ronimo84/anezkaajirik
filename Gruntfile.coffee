module.exports = (grunt) ->
	grunt.initConfig
		coffee: 
			compile: 
				files:
					'files/all.js': ['coffee/*.coffee']
					# 'js/all.js': ['coffee/*.coffee']
				options:
					bare: yes	
		uglify:
			my_target:
				files:
					'files/all.js': ['files/all.js']				 
		less:
			develop:
				options:
					compress: no 
					yuicompress: no 
				 
				files:
					"files/styles.css": ["styles/*.less"]
			production: 
				options: 
					compress: yes 
					yuicompress: yes 
					optimization: 2
				files: 
					"files/styles.css": ["styles/ext/*.less","styles/*.less"]
		watch:
			app: 
				files: ["coffee/**",'styles/**']
				tasks: ['dev'] 
				options: 
					livereload: yes

	grunt.loadNpmTasks 'grunt-contrib-coffee'
	grunt.loadNpmTasks 'grunt-contrib-uglify'
	grunt.loadNpmTasks 'grunt-contrib-less'
	grunt.loadNpmTasks 'grunt-contrib-watch'
	
	grunt.registerTask "default", ["dev"]
	grunt.registerTask "dev", ["coffee", "less:develop", "watch"]
	grunt.registerTask "prod", ["uglify", "less:production"]
