import { MongoClient } from "mongodb";

const url = "mongodb://luk:ariel%40%40401A@localhost:27017/?authSource=admin";
const dbName = "Restaurantes";

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
export async function consulta_11() {
  const client = new MongoClient(url);
  try {
    await client.connect();
    const db = client.db(dbName);
    const results = await db
      .collection("Data")
      .find({
        cuisine: { $ne: "American" },
        "grades.score": { $gt: 70 },
        "address.coord.0": { $lt: -65.754168 },
      })
      .toArray();
    console.log(results);
  } finally {
    await client.close();
  }
}
