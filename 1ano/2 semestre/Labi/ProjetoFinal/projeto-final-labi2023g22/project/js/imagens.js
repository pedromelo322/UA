const foto = document.getElementById('foto');
const author = document.querySelector('.author');
const tempo = document.querySelector('.upload-time');
const nome = document.querySelector('.nome');
const commentList = document.getElementById('comments-list');
const commentForm = document.getElementById('comment-form');
const likeButton = document.getElementById('like-btn');
const dislikeButton = document.getElementById('dislike-btn');
const likesCount = document.getElementById('likes-count');
const dislikesCount = document.getElementById('dislikes-count');

let id;
let likeCount = 0;
let dislikeCount = 0;

$(document).ready(function() {
  console.log("ready!");
  imageid();

  $.get("/dados", { idimg: id}, function(response) {
  autor = response.autor;
  user = response.user;
  
  if (autor === user) {

    console.log("igual")

    $("#votes").append(
    
      "<button onclick='processar(\"" + response.id + "\")'>Editar</button>"
    );


  }else{
    console.log("diferente")
  }
  });
    


});

function processar(id) {
	
  window.open("../html/process.html?id=" + id, '_blank');
  }

function imageid() {
  var queryString = window.location.search;
  var urlParams = new URLSearchParams(queryString);
  id = parseInt(urlParams.get('id'));
  
  // Agora você pode fazer a chamada $.get aqui, com o valor correto de `id`
  $.get("/dados", { idimg: id}, function(response) {
    showimages(response);
  });
}






  

function showimages(response) {

  
  foto.src = "../uploads/" + response.id + ".png";

  author.innerHTML = response.autor;

  tempo.innerHTML = response.data;

  nome.innerHTML = response.nome;

  numberLikes = response.likes.split(";").length - 1;
  numberDislikes = response.dislikes.split(";").length - 1;

  likesCount.innerText = numberLikes;
  dislikesCount.innerText = numberDislikes;

  if (response.comments !== "") {
    
    var comentarios = response.comments.split(";");
    var comString = "";
  
    for (let i = 0; i < comentarios.length; i++) {
      
      comString += "<li>"+comentarios[i] + "<br>"+ "</li>";
      
      
    }
  
    commentList.innerHTML = comString;
  }
  
  
}
// Adicionar comentário


commentForm.addEventListener('submit', function(e) {
  e.preventDefault();

  const commentInput = document.getElementById('comment-input');
  const newComment = commentInput.value;

  


  if (newComment.trim() !== '') {
    const commentItem = document.createElement('li');
    const commentText = document.createElement('p');
    commentText.className = 'comment-text';
    commentText.innerText = newComment;

    $.get("/comment", { idimg : id, comment : newComment}, function(response) {
      showimages(response);
    });

    commentItem.appendChild(commentText);
    commentList.appendChild(commentItem);

    commentInput.value = '';
  }
});

// Votação de popularidade




function likeChoice(likeOption) {
  $.get("/like", {idimg : id , like : likeOption}, function(response) {
    showimages(response);
  });
  
}

likeButton.addEventListener('click', function() {
  
    likeChoice("like");
    
});

dislikeButton.addEventListener('click', function() {
    likeChoice("dislike");
    
 
});
