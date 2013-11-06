String.prototype.fileExists = ->
	fileName = this.trim()
	res = jQuery.ajax
		url: fileName
		type: 'HEAD'
		async: false
	+res.status == 200

Array.prototype.shuffle = ->
	return this.sort ->
		Math.random() - 0.5
