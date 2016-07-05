function createContent() {
	
	// Start by declaring our variables
	var updateDiv; // The div we are putting the new content in
	var trigger; // This is the link that fires the function
	var newParagraph; // The new paragraph tag
	var newText; // The new text
	
	// Check the browser supports getElementById
	if(!document.getElementById) { return; }

	// Find div that holds the content
	updateDiv = document.getElementById("updateDiv");

	// If it isn't there return
	if (!updateDiv) { return;}
	
	// Find the div with the id example
	trigger = document.getElementById("trigger");

	// If it isn't there return
	if (!trigger) { return;}
	
	//It is there so do some stuff
	trigger.onclick = function(){
		// Create a new paragraph element
		newParagraph = document.createElement('p');
		// Create some text
		newText = document.createTextNode('This paragraph was dynamically inserted using the DOM');
		// Put the text in the new paragraph element
		newParagraph.appendChild(newText);
		// Append the new paragraph to the update Div
		document.getElementById('updateDiv').appendChild(newParagraph);
		// Disable the link by returning false			
		return false;
	}
}




    
