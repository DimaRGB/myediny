( ($) ->
	$ ->
		$('#logo').on 'click', updateInstagram
		updateInstagram()
		loadPastList()
		setInterval updateInstagram, updateInterval

	cols = 4
	rows = 2
	fadeIn = 1000
	updateInterval = 2 * 60 * 1000
	imgPath = '../img/'

	loadPastList = ->
		$('#past-list').find('.concert').each ->
			city = $(this).data('city')
			$(this).css 'background-image', 'url(' + imgPath + 'list/' + city + '.png)'
			$(this).on 'click', selectCity

	setCity = (imgs, $city) ->
		city = $city.data 'city'
		headerPath = imgPath + 'frame/' + city + '.png'
		headerExists = headerPath.fileExists()
		headerPath = headerPath.replace(city, 'header') if !headerExists
		cityTitle = if headerExists then '' else $city.data 'cityTitle'

		$frame = $ 'section.middle .frame'
		$frame.css 'background-image', "url('" + headerPath + "'), url('" + imgPath + "frame/footer.png')"
		$frame.toggleClass 'header-empty', !headerExists
		$frame.find('#title').text(cityTitle);
		$frame.show()

		imgs = imgs.shuffle().slice(0, cols * rows)
		$imgs = $frame.find '#imgs'
		$imgs.empty()
		imgWidth = $imgs.width() / cols - 30
		for img in imgs
			$img = $ '<img src="' + img + '" />'
			$img.addClass 'img'
			$img.outerWidth imgWidth
			$imgs.append $img

		$(document).scrollTop $frame.position().top - 8

	updateInstagram = () ->
		$.get 'php/instagram.php', (data) ->
			if data && data.channel && data.channel.item
				items = data.channel.item
				imgs = []
				for item in items
					if item.link
						imgs.push item.link
				setCity imgs, $('#logo')

	selectCity = (e) ->
		$city = $ e.target
		city = $city.data 'city'
		path = imgPath + 'city/' + city + '/'
		if !(path + '0.jpg').fileExists()
			return
		imgs = []
		imgs.push(path + i + '.jpg') for i in [0..7]
		setCity imgs, $city

) jQuery
