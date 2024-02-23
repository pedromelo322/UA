function calculate(){

    var x = document.getElementById("op1");
    var y = document.getElementById("op2");

    soma = parseFloat(x.value) + parseFloat(y.value);
    sub = parseFloat(x.value) - parseFloat(y.value);

    resultado = [soma,sub]

    return resultado

}


function operation(){

    var op = document.getElementById("operation");
    var signal = document.getElementById("op-view")
    switch(op.value){
        case "-":
            signal.innerText = "-";
            resultado = calculate()[1]
            break;
        case "+":
            signal.innerText = "+";   
            resultado = calculate()[0]      
            break;     
    }
    var e = document.getElementById("res");
    e.value = resultado;
}
