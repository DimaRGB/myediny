var number = 6, fadeIn = 1000;

jQuery(function($) {
	setInterval(updateInstagram, 5 * 60 * 1000);
	updateInstagram();
});

function updateInstagram() {
	$.get('php/instagram.php', function(data) {
		if( data && data.channel && data.channel.item )
			printImgs(data.channel.item);
	});
}

function printImgs(imgs) {
	var $instagram = $('#instagram');
	$instagram.empty();

	var n = number <= imgs.length ? number : imgs.length;
	var i = -1;
	var imgWidth = $instagram.width() / n - 10;

	while( --n >= 0 && ++i < imgs.length )
		if( imgs[i].description ) {
			$img = $(imgs[i].description);
			$img
				.addClass('instagram-img')
				.outerWidth(imgWidth);
			$instagram.append($img);
		}
}
