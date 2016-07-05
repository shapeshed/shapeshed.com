$(document).ready(function(){
	/*--------------------------------------
	A very alpha function to fetch images from an API
	via AJAX based on a string.
	--------------------------------------*/
	$("#get-images").click(function () { 
		
		// Empty the Div if there is already result
		 $("#content div").remove();
		
		// Get the text of the sentence we want images for
		var text = $("#words").val();
		
		// Split the words
		var words = text.split(" ");
		
		// Loop through the words getting and outputing images for each word
		$(words).each(function() {

			// Declare the word varialbe so it can be used
			var word = this;
			
			// Having trouble with Yahoo JSON so using Flickr for now
			// var yahoo = "http://search.yahooapis.com/ImageSearchService/V1/imageSearch?query=+this+&appid=4nT1jkDV34Ha9GZlGqYECqf0_jmgBBQ9oEnFZdBWaYDUKu_AUf.0YS76dFDv4LJZ&output=json&results=1&jsoncallback=?"
			
			// Flickr API doesn't require a key 
			var flickr = "http://api.flickr.com/services/feeds/photos_public.gne?tags="+this+"&tagmode=any&format=json&jsoncallback=?";

			// Using JQuery's getJSON to handle response - see http://docs.jquery.com/Ajax/jQuery.getJSON#urldatacallback
			$.getJSON(flickr,
				function(data){	
					
					// Create a new div element
					newDiv = document.createElement('div');
					
					// Attach it to the DOM					
					document.getElementById('content').appendChild(newDiv);															
					
					// Create a new h2
					newh2 = document.createElement('h2');
					
					// Create a text node
					newText = document.createTextNode(word);
					
					// Append the text to the newly created h2
					newh2.appendChild(newText);
					
					// Finally append the h2 to the div
					newDiv.appendChild(newh2);

					// Yahoo - can't get this working yet
					//$("<img/>").attr("src", data.ResultSet[0].Result.thumbnail.url).appendTo(newDiv);

					// Flickr
					$("<img/>").attr("src", data.items[0].media.m).appendTo(newDiv);

			});
		});
	});
});