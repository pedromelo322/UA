let id

$(document).ready(function() {
	
	imageslist("all");
  });
  
  function imageslist(id) {
	
	var author;
	if (id == "all") author = "all";
	else {
	  author = $("#authorImg").val();
	  if (author == "") author = "all";
	}
	$.get("/list", { id: author }, function(response) {
	  console.log("response");
	  showimages(response);
	});
  }
  


  function showimages(response) {
	
	$("#showimages").html("");
	for (let i = 0; i < response.images.length; i++) {
	  	

		
		

		$("#showimages").append(
			"<div class='image-container'>" +
			"<img src='../uploads/" + response.images[i][2] + ".png' alt='Foto' onclick='showimagecomments(\"" + response.images[i][2] + "\")'>" +
			"<span>" + response.images[i][1] + "</span>" +
			"</div>"
		  );
		  
	}
  }
  
  function showimagecomments(id) {
	
	window.open("../html/image.html?id=" + id, '_blank');
  }
  