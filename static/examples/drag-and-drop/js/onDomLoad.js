$(document).ready( function() {


});

function drag(target, e){
	e.dataTransfer.setData('Text', target.id)
}
function drop(target, e){
	alert('hi');
	var id = e.dataTransfer.getData('Text');
	target.appendChild(document.getElementById(id));
	trashFull();
	alert('hi');
	e.preventDefault();
}

function trashFull{
	alert('trashful');
	var classFull = "trashfull";
	trashDiv = document.getElementById("trash");
	if (!trashDiv) { return;}
	if (trashDiv.className != classFull){
		trashDiv.className = classFull;   
		return false;
	}
}