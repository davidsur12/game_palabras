class Palbras{

  static Map<int, List<String>> palabras = {
    1: ["Brisa ", "Viento suave y ligero."],
    2: ["Dardo", "Proyectil pequeño con punta aguda."],
    3: ["Fango", "Barro espeso y húmedo."],
    4: ["Gota", "Pequeña porción de líquido con forma esférica."],
    5: ["Manso", "Tranquilo, dócil o sin agresividad."],
    6: ["Nube", "Masa de vapor de agua suspendida en el aire."],
    7: ["Risco", "Peñasco alto y escarpado."],
    8: ["Trama", "Conjunto de hechos en una historia."],
    9: ["Zanja", "Excavación larga y estrecha en la tierra."],
    10: ["Crisma", "Dignidad, carácter o unción sagrada."],
    11: ["Truco", "Habilidad o estrategia para lograr algo."],
    12: ["Barco", "Medio de transporte que navega por el agua."],
    13: ["Fuego", "Combustión que produce luz y calor."],
    14: ["Golpe", "Choque repentino y violento contra algo."],
    15: ["Roca", "Piedra grande y dura."],
    16: ["Sombra", "Oscuridad producida por un objeto que bloquea la luz."],
    17: ["Truco", "Habilidad o estrategia para lograr algo."],
    18: ["Grito", "Voz fuerte y aguda."],
    19: ["Lista ", "Conjunto de elementos organizados."],
    20: ["Tiempo", "Dimensión en la que ocurren los eventos."],
    21: ["Rayo", " Descarga eléctrica en una tormenta."],
    22: ["Trapo", "rozo de tela usado para limpiar."],
    23: ["Monte", "Elevación natural del terreno."],
    24: ["Plaza ", "Espacio público en una ciudad o lugar vacante."],
    25: ["Tinta", " Sustancia líquida usada para escribir o imprimir."],
    26: ["Brillo ", "Reflejo intenso de la luz."],
    27: ["Trozo", "Parte de algo que se ha separado."],
    28: ["Gruta", "Cueva natural o excavada en roca."],
    29: ["Fardo", "Paquete grande y atado de mercancía."],
    30: ["Faro", "Torre alta con luz para guiar a los barcos."],
    31: ["Hielo", "Agua congelada."],
    32: ["Llave", "Objeto metálico usado para abrir cerraduras."],
    33: ["Dique ", "Barrera construida para contener el agua."],
    34: ["Manto", "Capa o cobertura sobre una superficie."],
    35: ["Freno ", "Mecanismo para detener un vehículo o reducir su velocidad."],
    36: ["Ruta", " Camino o dirección para llegar a un lugar."],
    37: ["Grieta", "Abertura o fisura en una superficie."],
    38: ["Rombo", "Figura geométrica de cuatro lados iguales."],
    39: ["Hueso", "Parte dura del esqueleto de los vertebrados."],
    40: ["Tallo", "Parte de una planta que sostiene hojas y flores."],
    41: ["Balsa", "Plataforma flotante hecha de madera."],
    42: ["Gorro", "Prenda para cubrir la cabeza."],
    43: ["Luna", "Satélite natural de la Tierra."],
    44: ["Opacarofilia", "Amor o Atracción por los amaneceres."],
    45: ["Diente", "Pieza dura de la boca, usada para masticar."],
    46:["Isla", "Terreno rodeado de agua por todos lados."],
    47:["Juez", "Persona que tiene la autoridad para juzgar y dictar sentencias."],
    48:["Cama", "Mueble para descansar o dormir."],
    49:["Alga", "Planta acuática que crece en el agua."],
    50:["Aguja", "Instrumento delgado y puntiagudo utilizado para coser."],
    51:["Asta", "mástil de una bandera."],
    52:["Hacha", "Herramienta con filo usada para cortar madera."],
    53:["Gesto ", "Movimiento del rostro o las manos para expresar algo."],
    54:["Norte", "Punto cardinal situado en la parte superior de un mapa."],
    55:["Crisma", " Aceite consagrado usado en ceremonias religiosas."],
    56:["Horma", "Molde usado para dar forma a objetos."],
    57:["Muelle", "Estructura en la orilla para el embarque de barcos."],
    58:["Hucha", "Recipiente para guardar dinero."],
    59:["Limos ", "Depósito de partículas finas arrastradas por el agua."],
    60:["Molar", "Tipo de diente ubicado en la parte trasera de la boca."],
    61:["Cabo", "Extremo de una cuerda."],
    62:["Rama", " Parte de un árbol que crece desde el tronco."],
    63:["Bruma ", "Niebla ligera que reduce la visibilidad."],
    64:["Lince", "Mamífero felino ágil y de gran vista."],
    65:["Bache ", "oyo o desnivel en el suelo o una carretera."],
    66:["Cetro", "Vara adornada que simboliza poder o autoridad."],
    67:["Morro ", "Parte saliente de la cara de un anima."],
    68:["Brasa", "Residuo incandescente de un material en combustión."],
    69:["Cisma", " División o desacuerdo dentro de un grupo o institución."],
    70:["Drone", "Aeronave no tripulada que se controla a distancia."],
    71:["Fusta", "Vara delgada usada para estimular a los caballos."],
    72:["Greda", "Tipo de arcilla utilizada en cerámica o construcción."],
    73:["Linde", "Límite o frontera entre terrenos o propiedades."],
    74:["Toldo", "Cubierta de tela usada para dar sombra o protección"],
    75:["Brega", "Esfuerzo intenso o lucha constante."],
    76:["Criba", "Utensilio con agujeros usado para filtrar o separar."],
    77:["Grumo", "Pequeño grupo de partículas aglomeradas en un líquido."],
    78:["Horda", "Grupo desordenado de personas que actúan con violencia."],
    79:["Mugre", "Suciedad acumulada en una superficie."],
    80:["Tizne", "Hollín o suciedad producida por el humo."],
    81:["Riel", "Barra metálica sobre la que circulan trenes o puertas."],
    82:["Brida", "Conjunto de correas usadas para controlar a un caballo."],
    83:["Gavia", "Parte alta de un mástil en un barco."],
    84:["Tanda", "Conjunto de cosas que se hacen en serie o por turnos."],
    85:["Bingo", "Juego de azar con cartones numerados."],
    86:["Dije", "Pequeña joya colgante, usualmente en un collar."],
    87:["Fango", "Mezcla de tierra y agua, similar al barro."],
    88:["Timon", "Pieza usada para dirigir una embarcación o avión."],
    89:["Corteza", "Capa externa de los árboles o ciertos frutos."],
    90:["Flecha", "Proyectil puntiagudo usado con un arco."],
    91:["Rastro", "Señal o huella que deja algo o alguien."],
    92:["Duda", "Incertidumbre o falta de certeza sobre algo."],
    93:["Aliento", "Aire que se expulsa al respirar."],
    94:["Balde", "Recipiente usado para transportar líquidos o sólidos."],
    95:["Dulce", "Sabor agradable y suave, especialmente relacionado con el azúcar."],
    96:["Escoba", "Utensilio usado para barrer."],
    97:["Vela", "Objeto de cera que se enciende para iluminar o para ceremonias."],
    98:["Basto", "Algo de mala calidad o grosero."],
    99:["Dosis", "Cantidad medida de una sustancia."],
    100:["Tacto", "Sentido que permite percibir las sensaciones a través de la piel."],


























  };
}

/*

Map<int, List<String>> mapa = {
  1: ['Hola', 'Mundo'],
  2: ['Flutter', 'Dart'],
  3: ['Mapa', 'Ejemplo'],
};

print(mapa); // {1: [Hola, Mundo], 2: [Flutter, Dart], 3: [Mapa, Ejemplo]}

// Acceder a los valores
print(mapa[1]); // [Hola, Mundo]
print(mapa[1]?[0]); // Hola
print(mapa[1]?[1]); // Mundo

*/