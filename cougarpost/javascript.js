function checkLogin()
{
	
	var email = document.forms["loginForm"]["email"].value; //grab name
	var password = document.forms["loginForm"]["password"].value; //grab password
	var result = verifyLogin(email,password);
	if (result != "false")
	{	
		
		var index = result;
		
		window.open("welcome.html");

		//function fillInfo(index);
	}
	else
		alert("Access Denied");
	
}
function signout()
{
	gapi.auth.signOut();
	window.open("signout.html", "_self");	
}
function fillInfo(indexValue)
{
	document.getElementById("userName").innerHTML = loginInfor.acceptedList[indexValue].name;
}

function previewImage(index)
{
	var imageIndex = index;
	
	if (index == 0)
	{
		var imageURL = document.getElementById("urlinput").value;
		document.getElementById("imagePreview").src = imageURL;	
	}
	if (index == 1)
	{
		var imageURL = document.getElementById("urlinput1").value;
		document.getElementById("imagePreview1").src = imageURL;
		document.getElementById("imagePreview1").style.display = "block";
	}
	if (index == 2)
	{
		var imageURL = document.getElementById("urlinput2").value;
		document.getElementById("imagePreview2").src = imageURL;
		document.getElementById("imagePreview2").style.display = "block";
	}
	if (index == 3)
	{
		var imageURL = document.getElementById("urlinput3").value;
		document.getElementById("imagePreview3").src = imageURL;
		document.getElementById("imagePreview3").style.display = "block";
	}
	
}

function onSignInCallback(authResult) {
  if (authResult['access_token']) {
    // Successfully authorized
    window.location.replace("welcome.html");
    //document.getElementById('g-signin').setAttribute('style', 'display: none');


  } else if (authResult['error']) {
    // There was an error.
    // Possible error codes:
    //   "access_denied" - User denied access to your app
    //   "immediate_failed" - Could not automatically log in the user
    // console.log('There was an error: ' + authResult['error']);
  }
}

//Function: postCommen()
//Funtionality: When a user posts a comment we will pull Name, Image, and Comment.
// 				This will be saved to the database and then the page will be refreshed.
//				When reloading the database will include the new comment and all
//				updates will be up to date.
function postComment()
{
	var postID = window.location.search.substring(1); //grabbing URL variable 
	var splitVariables = postID.split('='); //split at = and store in array
	postID = splitVariables[1]; //we want index 2 because list should be: 'name', variableNeeded

	var posterName = document.getElementById('name').value;
	var posterEmail = document.getElementById('email').value;
	var posterImage = document.getElementById('imageURLbox').value;
	var posterComment = document.getElementById('comment').value;
	var posterDate = "Just now!";

	//==============================TEMPORARY COMMENTS - DELETES ON REFRESH =====================
	stringBody = stringBody + "<li><div class='comment-img'><img src='" + posterImage + "0'/></div><div class='comment-text'><strong><a href=''>" + posterName +
            "</a></strong><p>" + posterComment + "</p> <span class='date sub-text'>on "
            + posterDate + "</span></div></li>";
    document.getElementById('comments').innerHTML = "<b>Comments:</b>" + stringHeader + stringBody + stringFooter;
    //=======================SAVE TO DATABASE HERE ===============================

	//Add to database!!!		
	xmlhttp=new XMLHttpRequest();
	xmlhttp.onreadystatechange=function() {
		if (xmlhttp.readyState==4 && xmlhttp.status==200) {//executed when state = done and status = OK
			response=xmlhttp.responseText;
			console.log('Insert comment response: ' + response);
		}
	}
	xmlhttp.open("GET","comment.php?id="+postID+"&text="+posterComment+"&email="+posterEmail, true);
	xmlhttp.send();
	posterComment = document.getElementById('comment').value = ""; //erase comment from box
}
function addUser(n,e,i)
{
	
	var name = n;
	var email = e;
	var image = i;
	
	xmlhttp=new XMLHttpRequest();
	xmlhttp.onreadystatechange=function() {
		if (xmlhttp.readyState==4 && xmlhttp.status==200) {//executed when state = done and status = OK
			response=xmlhttp.responseText;
			console.log('Insert User response: ' + response);
		}
	}
	
	xmlhttp.open("GET","addUser.php?name="+name+"&email="+email+"&image="+image, true);
	xmlhttp.send();


}
var postPerson;
function loadViewPostData()
{
	xmlhttp=new XMLHttpRequest();
	xmlhttp.onreadystatechange=function() {
		if (xmlhttp.readyState==4 && xmlhttp.status==200) {//executed when state = done and status = OK
			response=xmlhttp.responseText;
			console.log('Update Post response: ' + response);
			
			splitResponse = response.split('__comments__');
			postInfo = splitResponse[0].split('-_-');
			
			document.getElementById('postTitle').innerHTML = postInfo[1];
			document.getElementById('viewPostMainImage').src = postInfo[0];
			document.getElementById('postFullDescription').innerHTML = postInfo[2];
			document.getElementById('showPostImage1').src = postInfo[3];
			document.getElementById('showPostImage2').src = postInfo[4];
			document.getElementById('showPostImage3').src = postInfo[5];
			document.getElementById('showPosterName').innerHTML = postInfo[6];
			document.getElementById('showposterImage').src = postInfo[7];
			

			postPerson = postInfo[6];
			//set default picture if left blank
			var blankPicture1 = postInfo[3];
			var blankPicture2 = postInfo[4];
			var blankPicture3 = postInfo[5];

			if (blankPicture1 == "undefined")
			{
				document.getElementById('showPostImage1').src = "http://vector-magz.com/wp-content/uploads/2013/07/cougar-paw-vector.jpg";
			}
			if (blankPicture2 == "undefined")
			{
				document.getElementById('showPostImage2').src = "http://vector-magz.com/wp-content/uploads/2013/07/cougar-paw-vector.jpg";
			}
			if (blankPicture3 == "undefined")
			{
				document.getElementById('showPostImage3').src = "http://vector-magz.com/wp-content/uploads/2013/07/cougar-paw-vector.jpg";
			}
			//=====================================  LOADING COMMENTS =====================================================
			commInfo = splitResponse[1].split('-_-');
			numComments = commInfo.length-1;
			
			stringHeader = "<ul class='img-comment-list' id='img-comment-list'>";
			stringFooter = "</ul>"
			stringBody = "";
			var commenterName;
			var commenterPicture;
			var commenterComment;
			var commenterDate;
			//grabbing required variables from database
			while (numComments) {
				commenterName = commInfo[numComments-3];
				commenterPicture = commInfo[numComments];
				commenterComment = commInfo[numComments-2];
				commenterDate = commInfo[numComments-1];
				
				numComments -= 4;

				var listItem = "<li><div class='comment-img'><img src='" + commenterPicture + "'/></div><div class='comment-text'><strong><a href=''>" + commenterName +
									 "</a></strong><p>" + commenterComment + "</p> <span class='date sub-text'>on "
					+ commenterDate + "</span></div></li>";

				stringBody = stringBody + listItem;
			}

			document.getElementById('comments').innerHTML = "<b>Comments:</b>" + stringHeader + stringBody + stringFooter;
			

		}

	}
	xmlhttp.open("GET","viewPost.php?q="+getPostId(),true);
	xmlhttp.send();
}

function PostEditGetData()
{
	postID = getPostId();
	
	xmlhttp=new XMLHttpRequest();
	xmlhttp.onreadystatechange=function() {
		if (xmlhttp.readyState==4 && xmlhttp.status==200) {//executed when state = done and status = OK
			response=xmlhttp.responseText;
			console.log('Edit Post Get Data response: ' + response);
			postInfo = response.split('-_-');
			
			document.getElementById('postTitle').innerHTML = "Edit " + postInfo[1];
			document.getElementById('urlinput').value = postInfo[0];
			document.getElementById('nameinput').value = postInfo[1];
			document.getElementById('postBriefDesc').value = postInfo[2];
			document.getElementById('postFullDesc').value = postInfo[3];
			document.getElementById('urlinput1').value = postInfo[4];
			document.getElementById('urlinput2').value = postInfo[5];
			document.getElementById('urlinput3').value = postInfo[6];
		}
	}
	xmlhttp.open("GET","editPost.php?q="+postID,true);
	xmlhttp.send();
}

function PostEditSaveData()
{
	
	var postPicture = document.getElementById("urlinput").value;
    var  postTitle = document.getElementById("nameinput").value;
    var postBriefDescription = document.getElementById("postBriefDesc").value;
    var postFullDescription = document.getElementById("postFullDesc").value;
    var postAltImg1 = document.getElementById("urlinput1").value;
    var postAltImg2 = document.getElementById("urlinput2").value;
    var postAltImg3 = document.getElementById("urlinput3").value;
	
	xmlhttp=new XMLHttpRequest();
	xmlhttp.onreadystatechange=function() {
		if (xmlhttp.readyState==4 && xmlhttp.status==200) {
			response=xmlhttp.responseText;
			console.log('Update Post response: ' + response);
			openWindow = window.open("welcome.html", "_self");
		}
	}
	xmlhttp.open("POST", "updatePost.php", true);
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttp.send("thumb="+postPicture+"&title="+postTitle+"&sDesc="+postBriefDescription+
			"&lDesc="+postFullDescription+"&img1="+postAltImg1+"&img3="+postAltImg3+
			"&img2="+postAltImg2+"&email="+email+"&id="+getPostId());
	
}

function getPostId()
//returns the first variable from URL.
{
	var postID = window.location.search.substring(1); 
	var splitVariables = postID.split('=');
	return(splitVariables[1]);
}
//Log Out
$( '#revokeButton' ).click( function() {
	if( $( this ).data( 'loggedInWith' ) === 'g+' ) 
	{		
		alert("Signout Function");	
		disconnectUser( gapi.auth.getToken().access_token );
		gapi.auth.signOut();
		window.open("signout.html", "_self");
	}
});

function loadPostsToWelcome()
{
	//get dropdown menu values
	var age = document.getElementById("dropdownAge");
	var a = age.options[age.selectedIndex].value;
	var sort = document.getElementById("dropdownSort");
	var s = sort.options[sort.selectedIndex].value;
	
	xmlhttp=new XMLHttpRequest();
	xmlhttp.onreadystatechange=function() {
		if (xmlhttp.readyState==4 && xmlhttp.status==200) {
			document.getElementById("isotope-demo").innerHTML=xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET","getPosts.php?s="+s+"&a="+a,true);
	
	xmlhttp.send();
}
function saveNewPost()
{

    var postPicture = document.getElementById("urlinput").value;
    var postTitle = document.getElementById("nameinput").value;
    var postBriefDescription = document.getElementById("postBriefDesc").value;
    var postFullDescription = document.getElementById("postFullDesc").value;
    var postAltImg1 = document.getElementById("urlinput1").value;
    var postAltImg2 = document.getElementById("urlinput2").value;
    var postAltImg3 = document.getElementById("urlinput3").value;
	
	/*
	if ((postPicture == "") || (postTitle == "") || (postBriefDescription = "") || (postFullDescription == "") || (postAltImg1 == "") || (postAltImg2 == "") || (postAltImg3 == ""))
	{
		alert("Please fill out all Fields");
		return;
	}
	//alert("Oops");
	*/
	var posterName = document.getElementById('name').value;
	var posterImage = document.getElementById('imageURLbox').value;
	var email = document.getElementById('email').value;
	
	xmlhttp=new XMLHttpRequest();
	xmlhttp.onreadystatechange=function() {
		if (xmlhttp.readyState==4 && xmlhttp.status==200) {//executed when state = done and status = OK
			response=xmlhttp.responseText;
			console.log('Insert Post response: ' + response);
			openWindow = window.open("welcome.html", "_self");
		}
	}
	xmlhttp.open("POST", "createPost.php", true);
	xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlhttp.send("thumb="+postPicture+"&title="+postTitle+"&sDesc="+postBriefDescription+
			"&lDesc="+postFullDescription+"&img1="+postAltImg1+"&img3="+postAltImg3+"&img2="+postAltImg2+"&email="+email);
	
	//xmlhttp.open("GET","createPost.php?thumb="+postPicture+"&title="+postTitle+"&sDesc="+postBriefDescription+
	//		"&lDesc="+postFullDescription+"&img1="+postAltImg1+"&img3="+postAltImg3+"&img2="+postAltImg2+"&email="+email, true);
	//xmlhttp.send();
}
function loadSinglePost(pID)
{
	var postID = pID;
	openWindow = window.open("viewPost.html" + '?name=' + postID, "_self");

}
function editPost()
{
	var postID = window.location.search.substring(1); //grabbing URL variable 
	var splitVariables = postID.split('='); //split at = and store in array
	postID = splitVariables[1]; //we want index 2 because list should be: 'name', variableNeeded

	openWindow = window.open("editPost.html" + '?name=' + postID, "_self");
}



function hideButton()
{
	var currentUser_edit = document.getElementById("name").value; 
	if (postPerson == currentUser_edit)
		var isEqual = "true";

			
	if (postPerson != currentUser_edit)
	{
		document.getElementById("editButtonDisplay").style.display = "none";
	}
	if (isEqual == "true")
	{
		document.getElementById("editButtonDisplay").style.display = "block";	
	}
}