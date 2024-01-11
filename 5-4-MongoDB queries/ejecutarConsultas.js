import * as consultas from "./consultas.js";

const mapeoConsultas = {
  consulta_1: consultas.consulta_1,
  consulta_2: consultas.consulta_2,
  consulta_3: consultas.consulta_3,
  consulta_4: consultas.consulta_4,
  consulta_5: consultas.consulta_5,
  consulta_6: consultas.consulta_6,
  consulta_7: consultas.consulta_7,
  consulta_8: consultas.consulta_8,
  consulta_9: consultas.consulta_9,
  consulta_10: consultas.consulta_10,
  consulta_11: consultas.consulta_11,
  consulta_12: consultas.consulta_12,
  consulta_13: consultas.consulta_13,
  consulta_14: consultas.consulta_14,
  consulta_15: consultas.consulta_15,
  consulta_16: consultas.consulta_16,
  consulta_17: consultas.consulta_17,
  consulta_18: consultas.consulta_18,
  consulta_19: consultas.consulta_19,
  consulta_20: consultas.consulta_20,
  consulta_21: consultas.consulta_21,
  consulta_22: consultas.consulta_22,
  consulta_23: consultas.consulta_23,
  consulta_24: consultas.consulta_24,
  consulta_25: consultas.consulta_25,
  consulta_26: consultas.consulta_26,
  consulta_27: consultas.consulta_27,
  consulta_28: consultas.consulta_28,
  consulta_29: consultas.consulta_29,
  consulta_30: consultas.consulta_30,
  consulta_31: consultas.consulta_31,
  consulta_32: consultas.consulta_32
};

const consultaSeleccionada = process.argv[2];
const funcionConsulta = mapeoConsultas[consultaSeleccionada];

if (funcionConsulta) {
  consultas
    .ejecutarConsulta(funcionConsulta)
    .then(() => console.log("Consulta ejecutada exitosamente"))
    .catch(err => console.error("Error al ejecutar la consulta:", err));
} else {
  console.log("Consulta no encontrada");
}
