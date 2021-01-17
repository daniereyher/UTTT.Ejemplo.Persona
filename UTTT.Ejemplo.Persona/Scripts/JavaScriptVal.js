
function validarF() {



    var sexo = document.getElementById("ddlSexo").value;
    var clave = document.getElementById("txtClaveUnica").value;
    var nombre = document.getElementById("txtNombre").value;
    var apellidoP = document.getElementById("txtAPaterno").value;
    var apellidoM = documento.getElementById("txtAMaterno").value;


    if (sexo == "0" && clave == "" && nombre == "" && apellidoP == "") {
        alert("Debe llenar todos los campos");
        return false;
    }





      }

