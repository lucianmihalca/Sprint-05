import { MongoClient } from "mongodb";
import "dotenv/config";

const url = `mongodb://${process.env.DB_USER}:${process.env.DB_PASS}@${process.env.DB_HOST}:${process.env.DB_PORT}/?authSource=admin`;
const dbName = process.env.DB_NAME;

// 1. Escribe una consulta para mostrar todos los documentos en la colección Restaurantes.
export async function consulta_1() {
  const client = new MongoClient(url);
  try {
    await client.connect();
    const db = client.db(dbName);
    const results = await db.collection("Data").find({}).toArray();
    console.log(results);
  } finally {
    await client.close();
  }
}

// 2. Escribe una consulta para mostrar el restaurante_id, name, borough y cuisine de todos los documentos en la colección Restaurantes.
export async function consulta_2() {
  const client = new MongoClient(url);
  try {
    await client.connect();
    const db = client.db(dbName);
    const results = await db
      .collection("Data")
      .find({}, { projection: { restaurant_id: 1, name: 1, borough: 1, cuisine: 1 } })
      .toArray();
    console.log(results);
  } finally {
    await client.close();
  }
}

// 3. Escribe una consulta para mostrar el restaurante_id, name, borough y cuisine, pero excluyendo el campo _id por todos los documentos en la colección Restaurantes.
export async function consulta_3() {
  const client = new MongoClient(url);
  try {
    await client.connect();
    const db = client.db(dbName);
    const results = await db
      .collection("Data")
      .find({}, { projection: { _id: 0, restaurant_id: 1, name: 1, borough: 1, cuisine: 1 } })
      .toArray();
    console.log(results);
  } finally {
    await client.close();
  }
}

// 4. Escribe una consulta para mostrar restaurant_id, name, borough y zip code, pero excluyendo el campo _id por todos los documentos en la colección Restaurantes.
export async function consulta_4() {
  const client = new MongoClient(url);
  try {
    await client.connect();
    const db = client.db(dbName);
    const results = await db
      .collection("Data")
      .find({}, { projection: { _id: 0, restaurant_id: 1, name: 1, borough: 1, "address.zipcode": 1 } })
      .toArray();
    console.log(results);
  } finally {
    await client.close();
  }
}

// 5. Escribe una consulta para mostrar todos los restaurantes que están en el Bronx.
export async function consulta_5() {
  const client = new MongoClient(url);
  try {
    await client.connect();
    const db = client.db(dbName);
    const results = await db.collection("Data").find({ borough: "Bronx" }).toArray();
    console.log(results);
  } finally {
    await client.close();
  }
}

// 5.2  Projection se utiliza para especificar los campos a incluir o excluir en los resultados de una consulta.
// export async function consulta_5() {
//     const client = new MongoClient(url);
//     try {
//         await client.connect();
//         const db = client.db(dbName);
//         const results = await db.collection("Data").find({ borough: "Bronx" }, { projection: { name: 1, _id: 0 } }).toArray();
//         console.log(results);
//     } finally {
//         await client.close();
//     }
// }

// 6.1  Escribe una consulta para mostrar los primeros 5 restaurantes que están en el Bronx.
// 6.2  El método 'limit(5)' restringe la consulta a solo los primeros 5 documentos que cumplan con el criterio de búsqueda.
// 6.3 'limit' es similar a 'TOP' en SQL, limitando el número de resultados devueltos por la consulta.
export async function consulta_6() {
  const client = new MongoClient(url);
  try {
    await client.connect();
    const db = client.db(dbName);
    const results = await db.collection("Data").find({ borough: "Bronx" }).limit(5).toArray();
    console.log(results);
  } finally {
    await client.close();
  }
}

// 7.1 Escribe una consulta para mostrar los 5 restaurantes después de saltar los primeros 5 que sean del Bronx.
// 7.2 El método 'skip(5)' salta los primeros 5 documentos, útil para paginación o para omitir un número específico de resultados.
// 7.3 Después de 'skip', 'limit(5)' se usa para obtener los siguientes 5 restaurantes, mostrando así los restaurantes del 6º al 10º en el Bronx.
export async function consulta_7() {
  const client = new MongoClient(url);
  try {
    await client.connect();
    const db = client.db(dbName);
    const results = await db.collection("Data").find({ borough: "Bronx" }).skip(5).limit(5).toArray();
    console.log(results);
  } finally {
    await client.close();
  }
}

// 8.1 Escribe una consulta para encontrar los restaurantes que tienen algún resultado mayor de 90.
// 8.2 "$gt: 90" se usa para filtrar campos "grades.score" mayores que 90, equivalente al símbolo '>'.
// 8.3 El operador "$gt" (greater than) selecciona aquellos documentos con "score" en "grades" superando el valor de 90.
export async function consulta_8() {
  const client = new MongoClient(url);
  try {
    await client.connect();
    const db = client.db(dbName);
    const results = await db
      .collection("Data")
      .find({ "grades.score": { $gt: 90 } })
      .toArray();
    console.log(results);
  } finally {
    await client.close();
  }
}

// 9.1 Escribe una consulta para encontrar los restaurantes que tienen un resultado mayor que 80 pero menos que 100.
// 9.2 '$gt: 80' selecciona restaurantes cuyo 'score' es mayor que 80 (excluyendo 80). Es un operador "greater than".
// 9.3 '$lt: 100' filtra aquellos con 'score' menor que 100 (excluyendo 100), equivalente a "less than".
// 9.4 La consulta final busca restaurantes cuyos scores están entre 81 y 99, excluyendo los límites.
export async function consulta_9() {
  const client = new MongoClient(url);
  try {
    await client.connect();
    const db = client.db(dbName);
    const results = await db
      .collection("Data")
      .find({ "grades.score": { $gt: 80, $lt: 100 } })
      .toArray();
    console.log(results);
  } finally {
    await client.close();
  }
}

// 10.1 Escribe una consulta para encontrar los restaurantes situados en una longitud inferior a -95.754168.
// 10.2 Utiliza '{ "address.coord.0": { $lt: -95.754168 } }' para filtrar por la longitud en el primer elemento del array 'coord'.
// 10.3 Esta consulta selecciona restaurantes cuya coordenada de longitud es menor que -95.754168.
export async function consulta_10() {
  const client = new MongoClient(url);
  try {
    await client.connect();
    const db = client.db(dbName);
    const results = await db
      .collection("Data")
      .find({ "address.coord.0": { $lt: -95.754168 } })
      .toArray();
    console.log(results);
  } finally {
    await client.close();
  }
}

// 11.1 Consulta para encontrar restaurantes que no cocinan comida "American", con score superior a 70 y longitud inferior a -65.754168.
// 11.2 '$ne: "American"' excluye restaurantes que cocinan comida "American".
// 11.3 '$gt: 70' selecciona aquellos con un score mayor que 70 y '$lt: -65.754168' para longitud menor que -65.754168.
// 11.4 Uso de $and para combinar múltiples condiciones
export async function consulta_11() {
  const client = new MongoClient(url);
  try {
    await client.connect();
    const db = client.db(dbName);
    const results = await db
      .collection("Data")
      .find({
        $and: [{ cuisine: { $ne: "American" } }, { "grades.score": { $gt: 70 } }, { "address.coord.0": { $lt: -65.754168 } }]
      })
      .toArray();
    console.log(results);
  } finally {
    await client.close();
  }
}

// 12.1 Escribe una consulta para encontrar los restaurantes que no preparan comida 'American' y tienen algún resultado superior a 70 y que, además, se localizan en longitudes inferiores a -65.754168.
// 12.2 Nota: Haz esta consulta sin utilizar operador $and.
// 12.3 Se combinan directamente las condiciones en el objeto de consulta para un AND implícito.

export async function consulta_12() {
  const client = new MongoClient(url);
  try {
    await client.connect();
    const db = client.db(dbName);
    const results = await db
      .collection("Data")
      .find({
        cuisine: { $ne: "American" },
        "grades.score": { $gt: 70 },
        "address.coord.0": { $lt: -65.754168 }
      })
      .toArray();
    console.log(results);
  } finally {
    await client.close();
  }
}

// 13.1 Escribe una consulta para encontrar los restaurantes que no preparan comida 'American ', tienen alguna nota 'A' y no pertenecen a Brooklyn.
// 13.2 Se debe mostrar el documento según la cuisine en orden descendente.
// 13.3 'sort({ cuisine: -1 })' ordena los resultados por el campo 'cuisine' de forma descendente (de Z a A).
// 13.4 El operador '$ne' excluye los elementos especificados, aquí se usa para excluir cocina 'American' y restaurantes en 'Brooklyn'.
// 13.5 '"grades.grade": "A"' selecciona restaurantes con una calificación de 'A'.
export async function consulta_13() {
  const client = new MongoClient(url);
  try {
    await client.connect();
    const db = client.db(dbName);
    const results = await db
      .collection("Data")
      .find({
        cuisine: { $ne: "American" },
        "grades.grade": "A",
        borough: { $ne: "Brooklyn" }
      })
      .sort({ cuisine: -1 })
      .toArray();
    console.log(results);
  } finally {
    await client.close();
  }
}

// 14.1 Escribe una consulta para encontrar el restaurante_id, name, borough y cuisine para aquellos restaurantes que contienen 'Wil' en las tres primeras letras en su nombre.
// 14.2 La expresión regular '$regex: /^Wil/' se utiliza para buscar en el campo 'name'.
//      - '$regex' es una forma de buscar patrones de texto. Aquí, busca patrones que empiecen con 'Wil'.
//      - El símbolo '^' en la expresión regular significa "al inicio". Así que '^Wil' busca nombres que empiecen con 'Wil'.
// 14.3 La 'proyección' es cómo elegimos qué campos mostrar en los resultados.
//      - Aquí, { restaurant_id: 1, name: 1, borough: 1, cuisine: 1 } significa que solo queremos ver estos campos específicos en cada restaurante.
export async function consulta_14() {
  const client = new MongoClient(url);
  try {
    await client.connect();
    const db = client.db(dbName);
    const results = await db
      .collection("Data")
      .find(
        {
          name: { $regex: /^Wil/ }
        },
        {
          projection: { restaurant_id: 1, name: 1, borough: 1, cuisine: 1 }
        }
      )
      .toArray();
    console.log(results);
  } finally {
    await client.close();
  }
}

// 15.1 Escribe una consulta para encontrar el restaurante_id, name, borough y cuisine para aquellos restaurantes que contienen 'ces' en las últimas tres letras en su nombre.
// 15.2 La expresión regular '$regex: /ces$/' busca nombres que terminan con 'ces'.
//      - '/ces$/' indica que estamos buscando coincidencias que finalicen con 'ces' al final de la cadena del campo 'name'.
// 15.3 La proyección { restaurant_id: 1, name: 1, borough: 1, cuisine: 1 } selecciona y muestra solo estos campos específicos en los resultados.
export async function consulta_15() {
  const client = new MongoClient(url);
  try {
    await client.connect();
    const db = client.db(dbName);
    const results = await db
      .collection("Data")
      .find(
        {
          name: { $regex: /ces$/ }
        },
        {
          projection: { restaurant_id: 1, name: 1, borough: 1, cuisine: 1 }
        }
      )
      .toArray();
    console.log(results);
  } finally {
    await client.close();
  }
}

// 16.1 Escribe una consulta para encontrar el restaurante_id, name, borough y cuisine para aquellos restaurantes que contienen 'Reg' en cualquier lugar de su nombre.
// 16.2 '$regex: /Reg/' se usa para buscar coincidencias de la cadena 'Reg' en cualquier parte del campo 'name'.
//      - La expresión regular '/Reg/' sin '^' o '$' busca 'Reg' en cualquier posición dentro del nombre.
// 16.3 La proyección { restaurant_id: 1, name: 1, borough: 1, cuisine: 1 } asegura que solo estos campos se muestren en los resultados.

export async function consulta_16() {
  const cliente = new MongoClient(url);
  try {
    await cliente.connect();
    const db = cliente.db(dbName);
    const results = await db
      .collection("Data")
      .find(
        {
          name: { $regex: /Reg/ }
        },
        {
          projection: { restaurant_id: 1, name: 1, borough: 1, cuisine: 1 }
        }
      )
      .toArray();
    console.log(results);
  } finally {
    await cliente.close();
  }
}

// 17.1 Escribe una consulta para encontrar los restaurantes que pertenecen al Bronx y preparan platos americanos o chinos.
// 17.2 Utiliza '$or' para buscar restaurantes que cumplen con una de las dos condiciones de 'cuisine'.
//      - Cada condición dentro de '$or' verifica si 'cuisine' es 'American' o 'Chinese'.
// 17.3 La condición 'borough: "Bronx"' asegura que solo se seleccionen restaurantes en esa área.
export async function consulta_17() {
  const client = new MongoClient(url);
  try {
    await client.connect();
    const db = client.db(dbName);
    const results = await db
      .collection("Data")
      .find({
        borough: "Bronx",
        $or: [{ cuisine: "American" }, { cuisine: "Chinese" }]
      })
      .toArray();
    console.log(results);
  } finally {
    await client.close();
  }
}

// 18.1 Escribe una consulta para encontrar el restaurante_id, name, borough y cuisine para aquellos restaurantes que pertenecen a Staten Island, Queens, Bronx o Brooklyn.
// 18.2 '$or' se utiliza para incluir restaurantes en cualquiera de los cuatro boroughs especificados.
//      - Cada condición dentro de '$or' verifica si 'borough' es uno de los mencionados.
// 18.3 La proyección selecciona y muestra los campos 'restaurant_id', 'name', 'borough' y 'cuisine'.
export async function consulta_18() {
  const client = new MongoClient(url);
  try {
    await client.connect();
    const db = client.db(dbName);
    const results = await db
      .collection("Data")
      .find(
        {
          $or: [{ borough: "Staten Island" }, { borough: "Queens" }, { borough: "Bronx " }, { borough: "Brooklyn" }]
        },
        {
          projection: { restaurant_id: 1, name: 1, borough: 1, cuisine: 1 }
        }
      )
      .toArray();
    console.log(results);
  } finally {
    await client.close();
  }
}

// 19.1 Escribe una consulta para encontrar el restaurante_id, name, borough y cuisine para aquellos restaurantes que NO pertenecen a Staten Island, Queens, Bronx o Brooklyn.
// 19.2 'borough: { $nin: ["Staten Island", "Queens", "Bronx", "Brooklyn"] }' excluye restaurantes en estos boroughs.
//      - '$nin' (not in) se utiliza para seleccionar documentos donde 'borough' no es ninguno de los valores listados.
// 19.3 La proyección especifica los campos a mostrar: 'restaurant_id', 'name', 'borough', y 'cuisine'.
export async function consulta_19() {
  const client = new MongoClient(url);
  try {
    await client.connect();
    const db = client.db(dbName);
    const results = await db
      .collection("Data")
      .find(
        {
          borough: { $nin: ["Staten Island", "Queens", "Bronx ", "Brooklyn"] }
        },
        {
          projection: { restaurant_id: 1, name: 1, borough: 1, cuisine: 1 }
        }
      )
      .toArray();
    console.log(results);
  } finally {
    await client.close();
  }
}

// 20.1  Escribe una consulta para encontrar el restaurante_id, name, borough y cuisine para aquellos restaurantes que consigan una nota menor que 10.
// 20.2 Utiliza '"grades.score": { $lt: 10 }' para seleccionar restaurantes cuyas calificaciones son menores que 10.
//      - '$lt: 10' significa "menor que 10", filtrando solo los documentos con calificaciones bajas.
// 20.3 La proyección especifica que solo se muestren 'restaurant_id', 'name', 'borough' y 'cuisine' en los resultados.

export async function consulta_20() {
  const client = new MongoClient(url);
  try {
    await client.connect();
    const db = client.db(dbName);
    const results = await db
      .collection("Data")
      .find(
        {
          "grades.score": { $lt: 10 }
        },
        {
          projection: { restaurant_id: 1, name: 1, borough: 1, cuisine: 1 }
        }
      )
      .toArray();
    console.log(results);
  } finally {
    await client.close();
  }
}

// 21.1 Escribe una consulta para encontrar el restaurante_id, name, borough y cuisine para aquellos restaurantes que preparan marisco ('seafood') excepto si son 'American ', 'Chinese' ; o el name del restaurante comienza con letras 'Wil'.
// 21.2 Utiliza '$and' para combinar múltiples condiciones.
//      - Se seleccionan restaurantes que sirven mariscos ('seafood'), pero no son de cocina 'American' ni 'Chinese'.
// 21.3 'cuisine: "seafood"' busca restaurantes de mariscos.
//      - 'cuisine: { $nin: ["American", "Chinese"] }' excluye aquellos de cocina 'American' o 'Chinese'.
// 21.4 '{ name: { $not: /^Wil/ } }' excluye restaurantes cuyos nombres comienzan con 'Wil'.
// 21.5 La proyección especifica los campos a mostrar: 'restaurant_id', 'name', 'borough', y 'cuisine'.

export async function consulta_21() {
  const client = new MongoClient(url);
  try {
    await client.connect();
    const db = client.db(dbName);
    const results = await db
      .collection("Data")
      .find(
        {
          $and: [{ cuisine: "seafood", cuisine: { $nin: ["American", "Chinese"] } }, { name: { $not: /^Wil/ } }]
        },
        {
          projection: { restaurant_id: 1, name: 1, borough: 1, cuisine: 1 }
        }
      )
      .toArray();
    console.log(results);
  } finally {
    await client.close();
  }
}

// 22.1 Escribe una consulta para encontrar el restaurante_id, name y gradas para aquellos restaurantes que consigan un grade de "A" y un resultado de 11 con un ISODate "2014-08-11T00:00:00Z".
// 22.2 Utiliza '$elemMatch' para encontrar documentos donde al menos un elemento en 'grades' cumple todas las condiciones.
//      - 'grade: "A"' busca calificaciones con una letra 'A'.
//      - 'score: 11' filtra calificaciones con un puntaje de 11.
//      - 'date: new Date("2014-08-11T00:00:00Z")' especifica la fecha exacta de la calificación.
// 22.3 La proyección { restaurant_id: 1, name: 1, grades: 1 } selecciona y muestra solo estos campos en los resultados.

export async function consulta_22() {
  const client = new MongoClient(url);
  try {
    await client.connect();
    const db = client.db(dbName);
    const results = await db
      .collection("Data")
      .find(
        {
          grades: {
            $elemMatch: {
              grade: "A",
              score: 11,
              date: new Date("2014-08-11T00:00:00Z")
            }
          }
        },
        {
          projection: { restaurant_id: 1, name: 1, grades: 1 }
        }
      )
      .toArray();
    console.log(results);
  } finally {
    await client.close();
  }
}

// 23.1 Escribe una consulta para encontrar el restaurante_id, name y gradas para aquellos restaurantes donde el 2º elemento del array de grados contiene un grade de "A" y un resultado 9 con un ISODate "2014-08-11T00:00:00Z".
// 23.2 Accede directamente al segundo elemento del array 'grades' usando 'grades.1'.
//      - 'grades.1.grade': "A" busca que este elemento tenga un grade 'A'.
//      - 'grades.1.score': 9 asegura que el score sea 9.
//      - 'grades.1.date': new Date("2014-08-11T00:00:00Z") especifica la fecha exacta de la calificación.
// 23.3 La proyección { restaurant_id: 1, name: 1, grades: 1 } selecciona y muestra estos campos en los resultados.

export async function consulta_23() {
  const client = new MongoClient(url);
  try {
    await client.connect();
    const db = client.db(dbName);
    const results = await db
      .collection("Data")
      .find(
        {
          "grades.1.grade": "A",
          "grades.1.score": 9,
          "grades.1.date": new Date("2014-08-11T00:00:00Z")
        },
        {
          projection: { restaurant_id: 1, name: 1, grades: 1 }
        }
      )
      .toArray();
    console.log(results);
  } finally {
    await client.close();
  }
}

// 24.1 Escribe una consulta para encontrar el restaurante_id, name, dirección y ubicación geográfica para aquellos restaurantes donde el segundo elemento del array coord contiene un valor entre 42 y 52.
// 24.2 Se utiliza un filtro para acceder al segundo elemento del array 'coord' en la dirección de cada restaurante.
//      - 'address.coord.1': { $gte: 42, $lte: 52 } filtra aquellos con el segundo elemento de 'coord' entre 42 y 52.
// 24.3 '$gte' y '$lte' son operadores que significan 'greater than or equal to' (mayor o igual que) y 'less than or equal to' (menor o igual que), respectivamente.
// 24.4 La proyección incluye 'restaurant_id', 'name' y 'address', proporcionando detalles esenciales y ubicación geográfica.

export async function consulta_24() {
  const client = new MongoClient(url);
  try {
    await client.connect();
    const db = client.db(dbName);
    const results = await db
      .collection("Data")
      .find(
        {
          "address.coord.1": { $gte: 42, $lte: 52 }
        },
        {
          projection: { restaurant_id: 1, name: 1, address: 1 }
        }
      )
      .toArray();
    console.log(results);
  } finally {
    await client.close();
  }
}

// 25.1 Escribe una consulta para organizar los restaurantes por nombre en orden ascendente.
// 25.2 Utiliza 'sort({ name: 1 })' para ordenar los documentos por el campo 'name'.
//      - El número 1 indica un orden ascendente. Si fuera -1, sería descendente.
// 25.3 La consulta no aplica ningún filtro, por lo que recupera y ordena todos los documentos de la colección.

export async function consulta_25() {
  const client = new MongoClient(url);
  try {
    await client.connect();
    const db = client.db(dbName);
    const results = await db.collection("Data").find({}).sort({ name: 1 }).toArray();
    console.log(results);
  } finally {
    await client.close();
  }
}

// 26.1 Escribe una consulta para organizar los restaurantes por nombre en orden descendente.
// 26.2 Utiliza 'sort({ name: -1 })' para ordenar los documentos por el campo 'name' en orden descendente.
//      - El número -1 indica un orden descendente, ordenando los nombres de Z a A.
// 26.3 Al igual que en la consulta anterior, no se aplican filtros adicionales, por lo que ordena todos los documentos en la colección.
export async function consulta_26() {
  const client = new MongoClient(url);
  try {
    await client.connect();
    const db = client.db(dbName);
    const results = await db.collection("Data").find({}).sort({ name: -1 }).toArray();
    console.log(results);
  } finally {
    await client.close();
  }
}

// 27.1 Escribe una consulta para organizar los restaurantes por el nombre de la cuisine en orden ascendente y por el barrio en orden descendente.
// 27.2 'sort({ cuisine: 1, borough: -1 })' se usa para organizar los documentos primero por 'cuisine' y luego por 'borough'.
//      - 'cuisine: 1' ordena los restaurantes por tipo de cocina de manera ascendente (de A a Z).
//      - 'borough: -1' luego ordena dentro de cada tipo de cocina por barrio de forma descendente (de Z a A).
// 27.3 Esta consulta proporciona una lista organizada de restaurantes, primero agrupados por tipo de cocina y luego por barrio.
export async function consulta_27() {
  const client = new MongoClient(url);
  try {
    await client.connect();
    const db = client.db(dbName);
    const results = await db.collection("Data").find({}).sort({ cuisine: 1, borough: -1 }).toArray();
    console.log(results);
  } finally {
    await client.close();
  }
}

// 28.1 Escribe una consulta para saber si las direcciones contienen la calle.
// 28.2 La consulta utiliza '{ "address.street": { $exists: true } }' para verificar la existencia del campo 'street' en las direcciones.
//      - '$exists: true' filtra los documentos que tienen el campo especificado, en este caso, 'address.street'.
// 28.3 Esto ayuda a identificar qué restaurantes en la colección tienen información detallada de la calle en su dirección.
export async function consulta_28() {
  const client = new MongoClient(url);
  try {
    await client.connect();
    const db = client.db(dbName);
    const results = await db
      .collection("Data")
      .find({ "address.street": { $exists: true } })
      .toArray();
    console.log(results);
  } finally {
    await client.close();
  }
}

// 29.1 Escribe una consulta que seleccione todos los documentos en la colección de restaurantes donde los valores del campo coord es de tipo Double.
// 29.2 La consulta usa '{ "address.coord": { $type: "double" } }' para buscar documentos donde 'coord' son de tipo Double.
//      - '$type: "double"' selecciona los documentos cuyos elementos en 'address.coord' son números de punto flotante (tipo Double).
// 29.3 Esto es útil para identificar restaurantes con información de ubicación precisa, almacenada como valores de punto flotante.

export async function consulta_29() {
  const client = new MongoClient(url);
  try {
    await client.connect();
    const db = client.db(dbName);
    const results = await db
      .collection("Data")
      .find({ "address.coord": { $type: "double" } })
      .toArray();
    console.log(results);
  } finally {
    await client.close();
  }
}

// 30.1 Escribe una consulta que seleccione el restaurante_id, name y grade para aquellos restaurantes que devuelven 0 como residuo después de dividir alguno de sus resultados por 7.
// 30.2 La consulta utiliza '{ "grades.score": { $mod: [7, 0] } }' para encontrar puntuaciones que son múltiplos de 7.
//      - '$mod: [7, 0]' selecciona documentos donde el score en 'grades' dividido por 7 da un residuo de 0.
// 30.3 La proyección { restaurant_id: 1, name: 1, "grades.grade": 1 } muestra solo estos campos específicos en los resultados.

export async function consulta_30() {
  const client = new MongoClient(url);
  try {
    await client.connect();
    const db = client.db(dbName);
    const results = await db
      .collection("Data")
      .find(
        {
          "grades.score": { $mod: [7, 0] }
        },
        {
          projection: { restaurant_id: 1, name: 1, "grades.grade": 1 }
        }
      )
      .toArray();
    console.log(results);
  } finally {
    await client.close();
  }
}

// 31.1 Escribe una consulta para encontrar el name de restaurante, borough, longitud, latitud y cuisine para aquellos restaurantes que contienen 'mon' en algún sitio de su name.
// 31.2 La consulta usa '{ name: { $regex: /mon/ } }' para buscar restaurantes cuyo nombre contiene 'mon'.
//      - '$regex: /mon/' aplica una búsqueda flexible para encontrar la cadena 'mon' en cualquier parte del nombre.
// 31.3 La proyección { name: 1, borough: 1, "address.coord": 1, cuisine: 1 } selecciona y muestra estos campos específicos.
//      - Incluye el nombre, barrio (borough), coordenadas (longitud y latitud) y tipo de cocina (cuisine).

export async function consulta_31() {
  const client = new MongoClient(url);
  try {
    await client.connect();
    const db = client.db(dbName);
    const results = await db
      .collection("Data")
      .find(
        {
          name: { $regex: /mon/ }
        },
        {
          projection: { name: 1, borough: 1, "address.coord": 1, cuisine: 1 }
        }
      )
      .toArray();
    console.log(results);
  } finally {
    await client.close();
  }
}

// 32.1 Escribe una consulta para encontrar el name de restaurante, borough, longitud, latitud y cuisine para aquellos restaurantes que contienen 'Mad' como primeras tres letras de su name.
// 32.2 La consulta utiliza '{ name: { $regex: /^Mad/ } }' para buscar restaurantes cuyo nombre comienza con 'Mad'.
//      - '$regex: /^Mad/' especifica una expresión regular que busca coincidencias al inicio del nombre.
//      - El símbolo '^' asegura que 'Mad' esté al comienzo del campo 'name'.
// 32.3 La proyección { name: 1, borough: 1, "address.coord": 1, cuisine: 1 } selecciona y muestra estos campos específicos.
//      - Incluye el nombre, barrio, coordenadas geográficas y tipo de cocina del restaurante.

export async function consulta_32() {
  const client = new MongoClient(url);
  try {
    await client.connect();
    const db = client.db(dbName);
    const results = await db
      .collection("Data")
      .find(
        {
          name: { $regex: /^Mad/ }
        },
        {
          projection: { name: 1, borough: 1, "address.coord": 1, cuisine: 1 }
        }
      )
      .toArray();
    console.log(results);
  } finally {
    await client.close();
  }
}
