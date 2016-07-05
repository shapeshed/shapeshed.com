$(document).ready(function() {
		
  $("form#mf-url-form").submit(function() {
	
	$(this).attr("value","");
	
	$('form#vcard :input.text').val("");
	
		
	var url = escape($("#mf-url").val());	
	
	$.getJSON("http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20microformats%20where%20url%3D'"+url+"'&format=json&callback=?",
	function(data){
		
		$(data.query.results.result.feed.adjunct).each(function(adjunct){
			if(this.id == "com.yahoo.page.uf.hcard"){

				// Check for no results


				// Parse items
				$(this.item.type.item).each(function(){
					switch(this.rel)
					{
						case "vcard:org":
							$("input#vcard-org").attr("value",this.type.meta.content);
							break;    
						case "vcard:adr":
							$(this.type.meta).each(function(meta) {
								switch(this.property)
								{
									case "vcard:street-address":
										$("input#vcard-street-address").attr("value",this.content);
										break;
									case "vcard:postal-code":
										$("input#vcard-postal-code").attr("value",this.content);
										break;
									case "vcard:locality":
										$("input#vcard-locality").attr("value",this.content);
										break;   
									case "vcard:region":
										$("input#vcard-region").attr("value",this.content);
										break; 
									case "vcard:country-name":
										$("input#vcard-country-name").attr("value",this.content);
										break;
								}
							});
							break;
						case "vcard:org":
							$("input#vcard-org").attr("value",this.type.meta.content);
							break;
					}
		      });

				// Parse meta items
				$(this.item.type.meta).each(function(){
					switch(this.property)
					{
						case "vcard:fn":
							$("input#vcard-fn").attr("value",this.content);
							break;   
						case "vcard:tel":
							$("input#vcard-tel").attr("value",this.content);
							break; 
						case "vcard:email":
							$("input#vcard-email").attr("value",this.content);
							break;
						case "vcard:title":
							$("input#vcard-title").attr("value",this.content);
							break;
					}
		      });
			}
		});
	});	

	return false;
    });

	$("ul li a").click(function () { 
		$("input#mf-url").attr("value",$(this).attr("href"));
		return false;
	});



	
	
});