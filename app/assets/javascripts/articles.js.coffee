# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

tinymce.init({
	selector: "textarea",
	plugins: "image link",
	toolbar: [
		"styleselect | bold italic | link image | alignleft aligncenter alignright alignjustify | bullist numlist | outdent indent"
	]
});
