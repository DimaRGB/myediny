number = 20
fadeIn = 1000

jQuery ->
	setInterval(updateInstagram, 5 * 60 * 1000)
	updateInstagram()

updateInstagram = ->
	$.get 'php/instagram.php', (data) ->
		if data && data.channel && data.channel.item
			printImgs data.channel.item

printImgs = (imgs) ->
	$instagram = $('#instagram')
	$instagram.empty()

	n = if number <= imgs.length then number else imgs.length
	i = -1
	imgWidth = $instagram.width() / n - 10

	while( --n >= 0 && ++i < imgs.length )
		if( imgs[i].description )
			$img = $ imgs[i].description
			$img.addClass 'instagram-img'
			$img.outerWidth imgWidth
			$instagram.append $img
