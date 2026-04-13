function Persona(nombre, edad, ciudad) {
    this.nombre = nombre;
    this.edad = edad;
    this.ciudad = ciudad;
    this.visualiza = visualiza;
}

function visualiza() {
    document.write("<li>" + this.nombre + " tiene" +
        this.edad + " años " + " y vive en " +
        this.ciudad + "</li>");
}

