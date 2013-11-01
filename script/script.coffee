number = 8
rows = 2
fadeIn = 1000

jQuery ->
	setInterval updateInstagram, 5 * 60 * 1000
	updateInstagram()
	
	$('header .logo, section.middle .frame').click ->
		updateInstagram this

	$('#concert-list').find('.concert').click (e) ->
		selectCity e

updateInstagram = (el) ->
	$.get 'php/instagram.php', (data) ->
		if data && data.channel && data.channel.item
			items = data.channel.item
			n = if number <= items.length then number else items.length
			i = -1
			imgs = []
			while( --n >= 0 && ++i < items.length )
				link = items[i].link
				if( link )
					imgs.push link

			$el = $ 'header .logo'
			city = $el.data('city')
			cityTitle = $el.data 'cityTitle'
			printImgs imgs, city, cityTitle

printImgs = (imgs, city, cityTitle) ->
	console.log imgs
	$instagram = $ '#instagram'
	$instagram.empty()

	imgWidth = rows * ($instagram.width() / imgs.length) - 30
	for img in imgs
		$img = $ '<img src="' + img + '" />'
		$img.addClass 'instagram-img'
		$img.outerWidth imgWidth
		$instagram.append $img

	# $('section.middle .frame').css
	# 	'backgroundImage': "url('img/frame/" + city + ".png'), url('img/frame/footer.png')"
	$('#title').text(cityTitle || '');
	$(document).scrollTop 400

selectCity = (e) ->
	$el = $ e.target
	city = $el.data 'city'
	cityTitle = $el.data 'cityTitle'
	if !city
		return
	path = 'img/city/' + city + '/'

	imgs = []
	imgs.push(path + i + '.jpg') for i in [0..7]
	
	printImgs imgs, city, cityTitle
