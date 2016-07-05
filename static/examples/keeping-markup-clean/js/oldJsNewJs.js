function oldJS()
	{
	alert ("Wooo you have found the content. But what if Javascript was turned off?");
	}
	
function modernJS() {
	
	// Check the browser supports getElementById
	if(!document.getElementById) { return; }
	
	// Find the trigger link with the DOM
	var goodJs = document.getElementById("good-js");
	
	// If it isn't there return
	if (!goodJs) { return; }
	
	// Wait for onclick and do something
	goodJs.onclick = function()
		{
		alert("That's better isn't it. No need to make the markup dirty!");
		return false;
		}
}
	
