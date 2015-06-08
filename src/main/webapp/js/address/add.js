(function(){
	jQuery(document).ready(function(){
	    "use strict";
	  // Basic Form
	  jQuery("#basicForm").validate({
	    highlight: function(element) {
	      jQuery(element).closest('.form-group').removeClass('has-success').addClass('has-error');
	    },
	    success: function(element) {
	      jQuery(element).closest('.form-group').removeClass('has-error');
	    }
	  });
	  
	  
	});
})();