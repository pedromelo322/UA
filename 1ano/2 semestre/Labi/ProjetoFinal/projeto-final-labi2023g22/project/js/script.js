const wrapper = document.querySelector('.wrapper');
const pergunta = document.querySelector('.reglog-pergunta');
const topdec = document.getElementById('top-dec');
const nome = document.getElementById('nome');
const email = document.getElementById('email');
const password = document.getElementById('password');
const sendados = document.getElementById('sendados');
let bin = 1;

$(document).ready(function() {
  toggleReglog();

});






pergunta.addEventListener('click', (event) => {
    const target = event.target;

    if (target.classList.contains('reglog')) {
        toggleReglog();
    }
});


function handleEmailInput(input) {
    input.removeAttribute('data-invalid');
  }
  
  function handleEmailBlur(input) {
    if (!email.checkValidity()) {
        email.value = ''; // Limpar o conteúdo do input
    }
  }
  



function toggleReglog() {
    const nome = document.querySelector('.nome-lock');
    const reglog = document.querySelector('.reglog');

    console.log(bin);

    if (bin === 0) {
        console.log('registar');
        topdec.innerText = 'Registar';
        nome.classList.add('active');
        reglog.innerHTML = 'Entrar';
        pergunta.innerHTML = 'Já tem conta? <a href="#" class="reglog">Entrar</a>';
        bin = 1;
    } else {
        console.log('login');
        nome.value = '';
        topdec.innerText = 'Entrar';
        nome.classList.remove('active');
        reglog.innerHTML = 'Registrar';
        pergunta.innerHTML = 'Não tem conta? <a href="#" class="reglog">Criar Conta</a>';
        bin = 0;
    }
}

sendados.addEventListener('click', function() {
  
    mandardados();
  });


  function mandardados() {
    var xhr = new XMLHttpRequest();
    xhr.open('POST', '/login', false);
    xhr.setRequestHeader('Content-Type', 'application/json');
  
    var dataToSend = {
        nome: nome.value,
        email: email.value,
        password: password.value,
    };
  
    console.log(dataToSend);
  
    xhr.onreadystatechange = function() {
      if (xhr.readyState === XMLHttpRequest.DONE) {
        if (xhr.status === 200) {
          console.log('Dados enviados com sucesso!');
          var response = xhr.responseText;
          console.log(response);

          dividida = response.split(";")


          mensagem = dividida[0];
          caminho = dividida[1];

          if (mensagem != "") {

            alert(mensagem);

          }

          window.open(caminho, '_self');
        } else {
          console.log('Erro ao enviar os dados:', xhr.status);
        }
      }
    };
  
    xhr.send(JSON.stringify(dataToSend));
  }

