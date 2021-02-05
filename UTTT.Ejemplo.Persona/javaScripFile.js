function myFunction() {
    document.getElementById("demo").innerHTML = "My First JavaScript Function";
}


//function ejecutarFunctions() {
//    validarForm();
//    validarEdad();
//}

//OnClientClick = "return ejecutarFunctions()"

function validarForm() {

    var clave, nombre, apellidoP, apellidoM, sexo, fecha, correo;
    clave = document.getElementById("txtClaveUnica").value;
    nombre = document.getElementById("txtNombre").value;
    apellidoP = document.getElementById("txtAPaterno").value;
    apellidoM = document.getElementById("txtAMaterno").value;
    sexo = document.getElementById("ddlSexo").value;
    fecha = document.getElementById("dateCalendar").value;
    correo = document.getElementById("txtEmail").value;


    //if (sexo.value == -1) {
    //    alert("Falta seleccionar el campo sexo");
    //    return false;
    //}

    // Ningun campo vacío 
     if (clave == "" || nombre == "" || apellidoP == "") {
        //alert("Llene todos los campos");
        return false;
    }
    // Clave
    else if (clave == "" || /^\s+$/.test(clave)) {
        alert("No haz escrito la clave unica");
        return false;
    }

    else if (clave.length < 3 || /^\s+$/.test(clave)) {
        alert("La clave unica debe ser mayor a 3 numeros");
        return false;
     }

     else if (clave < 100 || clave > 1000) {
         //("La clave unica debe ser mayor a 3 numeros")
         return false;
     }

    else if (isNaN(clave)) {
        alert("Escriba solo números para la clave unica");
        return false;
    }


    ///Nombre 

    else if (nombre == "" || /^\s+$/.test(nombre)) {
        alert("No haz escrito tu nombre");
        return false;
    }

    else if (nombre.length < 3 || /^\s+$/.test(nombre)) {
        alert("El nombre debe ser mayor a 3 letras");
        return false;
     }

    //else if (/^[A-Z]+$/i.test(nombre)) {
    //     alert("Escriba solo letras");
    //     return false; 
    // }

    //ApellidoP
    else if (apellidoP == "" || /^\s+$/.test(apellidoP)) {
        alert("No haz escrito tu apellido paterno");
        return false;
    }

    else if (apellidoP.length < 3 || /^\s+$/.test(apellidoP)) {
        alert("El apellido paterno debe ser mayor a 3 letras");
        return false;
    }

    //ApellidoM

    else if (apellidoM.length < 3 || /^\s+$/.test(apellidoM)) {
        alert("El apellido materno debe ser mayor a 3 letras");
        return false;
    }
   

     

    return true;

}







