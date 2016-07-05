function alterContent() {
	
	var updateDiv, // The div for which the styles are switched	
		trigger, // The link that fires the function
		toggle1 = "View Low Contrast Version", // Text for link to view low contrast
		toggle2 = "View High Contrast Version", // Text for link to view high contrast
		class1  = "low-contrast", // Class name for low contrast
		class2  = "high-contrast"; // Class name for high contrast
	
	// Check the browser supports getElementById
	if(!document.getElementById) { return; }

	// Find the div with the id trigger
	trigger = document.getElementById("trigger");
	
	// If it isn't there return
	if (!trigger) { return;}	
	
	//It is there so do some stuff
	trigger.onclick = function(){
		// Find div that holds the content
		updateDiv = document.getElementById("updateDiv");
		
		// If it isn't there return
		if (!updateDiv) { return;}

		// It is there so switch classes
		// Find out what the link is first
		// If it is class 1 then switch to class 2
		if (updateDiv.className == class1){
			// Switch class
			updateDiv.className = class2;
			// Switch text
			trigger.firstChild.nodeValue= toggle1;
			// Disable the link by returning false		
			return false;
		}
		else{
			// It must be class 2 so switch to class 1
			updateDiv.className = class1;
			// Switch text
			trigger.firstChild.nodeValue= toggle2;
			// Disable the link by returning false
			return false;
		}
	}	
}




    
