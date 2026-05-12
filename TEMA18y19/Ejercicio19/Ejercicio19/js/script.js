function addUser() {
    let username= document.getElementById("username").value;
    let passwd1 = document.getElementById("password").value;
    let passwd2 = document.getElementById("confirmPassword").value;
    let usernameColor= document.getElementById("username");
    let passwd1Color = document.getElementById("password");
    let passwd2Color = document.getElementById("confirmPassword");
    let usuariosRegistrados = document.getElementById("registeredUsers");

    if (passwd1 == false && username == false && passwd2 == false) {

        alert("Escribe algo");

    } else {

        if(passwd1 == passwd2) {
            let nuevoHijo = document.createElement("p");
            nuevoHijo.textContent = "Usuario: " + username + " Contraseña: " + passwd2;

            usuariosRegistrados.appendChild(nuevoHijo);
        } else {
                passwd1Color.style.backgroundColor  = "red";
                passwd2Color.style.backgroundColor = "red";
        }
        
        //IMPORTANTE
        //Con value, se obtiene el valor de un elemento html (en este caso el texto), y sin value, 
        //es el elemento en si para poder aplicar color por ejemplo

        //Con text content se añade contenido a una variable
        //con appendchild se añade un elemento hijo si hay un elemento padre

    }
}