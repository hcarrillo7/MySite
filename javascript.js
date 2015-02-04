
function validateForm()
{
	if(( document.getElementById("name").value == "") ||
		( document.getElementById("email").value == "") ||
		( document.getElementById("message").value == ""))
	{
		alert("Please fill out all text fields");
		return false;
	}
}

function showImage(index)
{
	var imageID = index;

	var imageSource = document.getElementById(imageID).src;

	document.getElementById('imagepreview').src = imageSource;

	$('#imagemodal').modal('show')
}
