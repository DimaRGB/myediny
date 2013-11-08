(($) ->

	$iframe = null
	$formBody = null

	$ ->
		$iframe = $('.content#form').find 'iframe'
		$iframe.on 'load', ->
			# console.log @
			# $formBody = $(@).contents().find 'body'
			# console.log $iframe.contents()
			# console.log $formBody
			# $formBody.css
			# 	backgroundColor: 'transparent'

) jQuery
