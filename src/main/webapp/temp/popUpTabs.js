(function() {
	var $tabs = $('.mainpanel ul.tabs'),
		$tabContent = $('.mainpanel div.tabContent');
	$('.leftpanel ul li').click(function(){
		var This = $(this),
			mName = This.attr('name'),
			mText = This.text();
		$tabs.find('li').removeClass('active');
		if($tabs.find('li[name="'+mName+'"]').length) {
			$tabs.find('li[name="'+mName+'"]').addClass('active');
		}else {
			$tabs.append(['<li class="active" name="',mName,'"><a href="javascript:;">',mText,'</a></li>'].join(''));
		}
		showTabContent(mName);
	});
	
	$tabs.delegate('li','click',function(){
		$tabs.find('li').removeClass('active');
		$(this).addClass('active');
		showTabContent($(this).attr('name'));
	});
	
	var showTabContent = function(n) {
		//ajax load data
		$tabContent.find('div').removeClass('active');
		if($tabContent.find('div[name="'+n+'"]').length){
			$tabContent.find('div[name="'+n+'"]').addClass('active');
		}else {
			$tabContent.append(['<div class="tab-pane active" name="',n,'">',n,'</div>'].join(''))
		}
//		
	}
})();