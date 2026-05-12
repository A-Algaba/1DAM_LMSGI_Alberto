function addUser() {
    let username = document.getElementById("username");
    let passwd1 = document.getElementById("password");
    let passwd2 = document.getElementById("confirmPassword");
    let usuariosRegistrados = document.getElementById("registeredUsers");

    if (passwd1.value == false || username.value == false || passwd2.value == false) {

        alert("Te faltan datos");

    } else {

        if(passwd1.value == passwd2.value) {
            let nuevoHijo = document.createElement("p");
            nuevoHijo.textContent = "Usuario: " + username.value + " Contraseña: " + passwd2.value;

            usuariosRegistrados.appendChild(nuevoHijo);
        } else {
                passwd1.style.backgroundColor  = "red";
                passwd2.style.backgroundColor = "red";

                passwd1.value = "Las contraseñas no coinciden";
                passwd2.value = "Las contraseñas no coinciden";

                passwd1.type = "text";
                passwd2.type = "text";
        }
        
        //IMPORTANTE
        //Con value, se obtiene el valor de un elemento html (en este caso el texto), y sin value, 
        //es el elemento en si para poder aplicar color por ejemplo

        //SUPER IMPORTANTE QUE SI VAMOS A COMPARAR VALORES ESCRITOS, PONER .value PORQUE SINO, ESTARA COMPRARANDO LOS ELEMENTOS, NO EL VALOR ESCRITO

        //Con text content se añade contenido a una variable
        //con appendchild se añade un elemento hijo si hay un elemento padre

    }
}