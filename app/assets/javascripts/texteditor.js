//= require froala_editor.min.js
//= require plugins/align.min.js
//= require plugins/code_beautifier.min.js
//= require plugins/code_view.min.js
//= require plugins/colors.min.js
//= require plugins/entities.min.js
//= require plugins/font_family.min.js
//= require plugins/font_size.min.js
//= require plugins/help.min.js
//= require plugins/image.min.js
//= require plugins/image_manager.min.js
//= require plugins/inline_style.min.js
//= require plugins/line_breaker.min.js
//= require plugins/link.min.js
//= require plugins/lists.min.js
//= require plugins/paragraph_format.min.js
//= require plugins/paragraph_style.min.js
//= require plugins/quick_insert.min.js
//= require plugins/quote.min.js
//= require plugins/table.min.js
//= require plugins/special_characters.min.js
//= require plugins/url.min.js

$(document).ready(function() {
	$('textarea#furniture_description').froalaEditor({		
      toolbarButtons:
      	['bold', 'italic', 'underline', 'strikeThrough', 'subscript', 'superscript', '|',
				 'fontSize', 'fontFamily', 'color', 'paragraphFormat', 'paragraphStyle', '|', 
      	 'align', 'formatOL', 'formatUL', 'indent', 'outdent', '|',
      	 'insertImage', 'insertLink', 'insertTable', 'insertQuote', 'undo', 'redo'],
	});
});