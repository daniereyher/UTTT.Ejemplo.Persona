function myFunction() {
    document.getElementById("demo").innerHTML = "My First JavaScript Function";
}



function validarForm() {

    var clave, nombre, apellidoP, apellidoM, sexo, fecha;
    clave = document.getElementById("txtClaveUnica").value;
    nombre = document.getElementById("txtNombre").value;
    apellidoP = document.getElementById("txtAPaterno").value;
    apellidoM = document.getElementById("txtAMaterno").value;
    sexo = document.getElementById("ddlSexo").value;
    fecha = document.getElementById("dateCalendar").value;


    if (sexo.value == 0 || sexo.value == "") {
        alert("Falta seleccionar el campo sexo");
        return false;
    }

    // Ningun campo vacío 
    else if (clave == "" || nombre == "" || apellidoP == "") {
        alert("Llene todos los campos");
        return false;
    }
    // Clave
    else if (clave == "" || /^\s+$/.test(clave)) {
        alert("No haz escrito la clave unica");
        return false;
    }

    else if (clave.length < 3 || /^\s+$/.test(clave)) {
        alert("La clave unica debe ser mayor a 3 letras");
        return false;
    }

    else if (isNaN(clave)) {
        alert("Escriba solo números");
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
        // Fecha nacimiento
    else if (fecha == "") {
        alert("La fecha de nacimeint no ha sido seleccionada");
        return false;
    }

    
    

    return true;

}




