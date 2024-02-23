let id;

$(document).ready(function() {
    const foto = document.getElementById('foto');
    console.log("ready!");
    imageid();  
    console.log("ok");
    $.get("/mudartemp", { idimg: id}, function(response) {
        console.log(response);
    });
  
});


function salvar(){
    console.log("salvar");
    $.get("/salvar", { idimg: id}, function(response) {
        console.log(response);
        window.close();
    });
}

function imageid() {
    console.log("ok");
    var queryString = window.location.search;
    var urlParams = new URLSearchParams(queryString);
    id = parseInt(urlParams.get('id'));
    console.log(id);
    
    // Agora você pode fazer a chamada $.get aqui, com o valor correto de `id`
    $.get("/dados", { idimg: id}, function(response) {
        showimages(response);
    });
}

function showimages(response) {

    const foto = document.getElementById('foto');
    const author = document.querySelector('.author');
    const tempo = document.querySelector('.upload-time');
    const nome = document.querySelector('.nome');


    console.log("ola");
    console.log(response.id);
    console.log(response.autor);
    console.log(response.data);
    console.log(response.nome);


    foto.src = "../uploads/" + response.id + ".png";
    author.innerHTML = response.autor;
    tempo.innerHTML = response.data;
    nome.innerHTML = response.nome;
  
}

function tipoImagem(tipoImg) {
    $.get("/alterarImg", { idimg: id, tipo : tipoImg}, function(response) {
        console.log(response);
        if (response == "ok") {
            console.log("alterar imagem");
            var timestamp = Date.now();
            foto.src = "../temp/" + id + ".jpg?" + timestamp;
        }
    });
}



/*--------------------------    Eventos    --------------------------*/

function intensidadeMais() {
    tipoImg = "intensidadeMais";
    console.log(tipoImg);
    tipoImagem(tipoImg);
}

function intensidadeMenos() {
    tipoImg = "intensidadeMenos";
    console.log(tipoImg);
    tipoImagem(tipoImg);
}

function saturacaoMais() {
    tipoImg = "saturacaoMais";
    console.log(tipoImg);
    tipoImagem(tipoImg);
}

function saturacaoMenos() {
    tipoImg = "saturacaoMenos";
    console.log(tipoImg);
    tipoImagem(tipoImg);
}

function pretoBranco() {
    tipoImg = "pretoBranco";
    console.log(tipoImg);
    tipoImagem(tipoImg);
}

function sepia() {
    tipoImg = "sepia";
    console.log(tipoImg);
    tipoImagem(tipoImg);
}

function trocaCores() {
    tipoImg = "trocaCores";
    console.log(tipoImg);
    tipoImagem(tipoImg);
}

function negativa() {
    tipoImg = "negativa";
    console.log(tipoImg);
    tipoImagem(tipoImg);
}