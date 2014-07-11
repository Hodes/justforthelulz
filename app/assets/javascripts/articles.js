hljs.initHighlightingOnLoad();
$(function() {
	if ($('textarea').val()) {
		livePreview();
	}

	$('textarea').on('keyup', function() {
		livePreview();
	});
});

function livePreview() {
	$.ajax({
		url: '/admin/articles/preview',
		data: { text: $('textarea').val() },
		type: 'POST'
	}).
	done(function(html) {
		$('#preview').html(html);
		$('pre code').each(function(i, block) {
			hljs.highlightBlock(block);
		});
	});
}
