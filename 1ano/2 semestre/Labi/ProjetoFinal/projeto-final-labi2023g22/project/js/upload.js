// Upload

const fileInput = document.querySelector('#file');
const imageContainer = document.querySelector('.image');
const nome = document.querySelector('.input-container');
const cancelBtn = document.querySelector('.cancel-btn');
const textBtn = document.querySelector('.choose-conf');
const paragraph = document.getElementById('text-upload');
const uploader = document.querySelector('.upload-upper');
const enviar = document.querySelector('.enviar-btn');
const input = document.getElementById('input');

fileInput.addEventListener('change', function() {
  const file = this.files[0];
  

  if (file && file.type.match('image.*')) {
    reader = new FileReader();

    reader.addEventListener('load', function() {
      imageContainer.classList.add('active');
      cancelBtn.classList.add('active');
      document.querySelector('#image').src = reader.result;
      textBtn.classList.remove('active');
      uploader.classList.add('hidden');
      enviar.classList.add('active');
      nome.classList.add('active');
    });

    reader.readAsDataURL(file);
  } else {
    paragraph.style.color = 'red';
    paragraph.textContent = 'Tipo de ficheiro incorreto';
    textBtn.classList.add('active');
  }
});

enviar.addEventListener('click', function() {
  imageContainer.classList.remove('active');
  cancelBtn.classList.remove('active');
  textBtn.classList.remove('active');
  uploader.classList.remove('hidden');
  enviar.classList.remove('active');
  nome.classList.remove('active');

  mandardados();

  input.value = '';
});

function mandardados() {
  var xhr = new XMLHttpRequest();
  xhr.open('POST', '/upload', false);
  xhr.setRequestHeader('Content-Type', 'application/json');

  var dataToSend = {
    nome: input.value,
    imagem: reader.result,
  };

  console.log(dataToSend);

  xhr.onreadystatechange = function() {
    if (xhr.readyState === XMLHttpRequest.DONE) {
      if (xhr.status === 200) {
        console.log('Dados enviados com sucesso!');
        paragraph.style.color = 'green';
        paragraph.textContent = 'Imagem enviada com sucesso';
        textBtn.classList.add('active');
      } else {
        console.log('Erro ao enviar os dados:', xhr.status);
        paragraph.style.color = 'red';
        paragraph.textContent = 'Não foi possivel enviar a imagem';
        textBtn.classList.add('active');
        // Lide com o erro de envio dos dados, se necessário
      }
    }
  };

  xhr.send(JSON.stringify(dataToSend));
}

cancelBtn.addEventListener('click', function() {
  imageContainer.classList.remove('active');
  cancelBtn.classList.remove('active');
  textBtn.classList.remove('active');
  uploader.classList.remove('hidden');
  enviar.classList.remove('active');
  nome.classList.remove('active');
  document.getElementById('input').value = '';
});
