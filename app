<script>
function loadRequisitos() {
  const tipo = document.getElementById('contratacion').value;
  const ul = document.getElementById('requisitos');
  const container = ul.parentNode;
  ul.innerHTML = '';

  // Elimina textos anteriores repetidos si existen
  const oldParagraphs = container.querySelectorAll('p.info-paragraph, p.contact-paragraph');
  oldParagraphs.forEach(p => p.remove());

  const info = document.createElement('p');
  info.classList.add('info-paragraph');
  info.innerHTML = `Para participar exitosamente en este tipo de contratación, es indispensable contar con la siguiente documentación específica. Esta documentación incluye certificaciones legales, financieras, técnicas y de experiencia, exigidas por la entidad contratante para garantizar transparencia y capacidad de cumplimiento.`;
  container.insertBefore(info, ul);

  const data = {
    'Subasta Inversa': [
      'Certificado Cámara de Comercio',
      'RUP actualizado',
      'Estados financieros auditados (2 años)',
      'Declaración de renta y certificaciones',
      'Experiencia contractual y propuesta económica'
    ],
    'Concurso de Méritos': [
      'Certificación de experiencia y HV del equipo',
      'Plan de trabajo, cronograma y propuesta técnica',
      'Estados financieros y carta de intención'
    ],
    'Contratación Directa': [
      'Certificado de existencia y RUT',
      'Declaraciones legales, fiscales y laborales',
      'Propuesta firmada'
    ],
    'Selección Abreviada': [
      'Estudio de mercado con 3 cotizaciones',
      'RUP, certificación legal y propuesta técnica',
      'Declaración de cumplimiento y soportes'
    ],
    'Acuerdo Marco de Precios': [
      'Registro en Colombia Compra Eficiente',
      'Certificaciones técnicas y plan de beneficios',
      'Análisis de precios, carta de intención'
    ],
    'Auditoría Financiera': [
      'Estados financieros auditados 3 años',
      'Acta constitutiva y hoja de vida del auditor',
      'Soportes de activos y egresos'
    ],
    'NIIF PYMES': [
      'Estados financieros bajo NIIF',
      'Políticas contables y ajustes documentados'
    ],
    'Planeación Tributaria': [
      'Declaraciones de renta, proyecciones y análisis de riesgo tributario'
    ],
    'Estudios de Impacto': [
      'Diagnóstico ambiental, matriz de impactos',
      'Plan de manejo y cronograma'
    ],
    'Planes de Manejo': [
      'Zonificación, estrategias ecológicas y sostenibilidad'
    ],
    'Economía Circular': [
      'ACV, materiales reciclables, indicadores ambientales'
    ],
    'Evaluación Ambiental Estratégica': [
      'Análisis de políticas, mapas de conflictividad y participación'
    ],
    'Huella de Carbono': [
      'Inventario de emisiones GEI, validación externa, plan de reducción'
    ]
  };

  (data[tipo] || []).forEach(item => {
    const li = document.createElement('li');
    li.textContent = item;
    ul.appendChild(li);
  });

  const contacto = document.createElement('p');
  contacto.classList.add('contact-paragraph');
  contacto.innerHTML = `¿Tienes dudas? Comunícate con nuestro equipo por WhatsApp o Instagram. ¡Estamos para ayudarte!`;
  container.appendChild(contacto);
}
</script>

<style>
  #telefono {
    margin-top: 10px;
  }
  #autorizacion {
    margin-top: 15px;
    display: flex;
    align-items: center;
  }
  #autorizacion label {
    margin-left: 5px;
    font-size: 14px;
  }
</style>

<script>
function validateAutorizacion() {
  const autorizado = document.getElementById('checkAutorizacion');
  if (!autorizado.checked) {
    alert("Debes aceptar el tratamiento de datos personales para continuar.");
    return false;
  }
  return true;
}
</script>

<!-- Agrega esto dentro del formulario en el paso 1 -->
<!-- Justo después del campo 'Tipo de empresa' -->
<script>
document.addEventListener("DOMContentLoaded", function () {
  const paso1 = document.getElementById("step1");
  const telefonoLabel = document.createElement("label");
  telefonoLabel.textContent = "Teléfono de contacto";
  const telefonoInput = document.createElement("input");
  telefonoInput.type = "tel";
  telefonoInput.id = "telefono";
  telefonoInput.required = true;

  const autorizacionDiv = document.createElement("div");
  autorizacionDiv.id = "autorizacion";
  const autorizacionCheckbox = document.createElement("input");
  autorizacionCheckbox.type = "checkbox";
  autorizacionCheckbox.id = "checkAutorizacion";
  autorizacionCheckbox.required = true;
  const autorizacionLabel = document.createElement("label");
  autorizacionLabel.htmlFor = "checkAutorizacion";
  autorizacionLabel.textContent = "Autorizo el tratamiento de mis datos personales conforme a la política de privacidad.";

  autorizacionDiv.appendChild(autorizacionCheckbox);
  autorizacionDiv.appendChild(autorizacionLabel);

  const formFields = paso1.querySelector(".actions");
  paso1.insertBefore(telefonoLabel, formFields);
  paso1.insertBefore(telefonoInput, formFields);
  paso1.insertBefore(autorizacionDiv, formFields);

  const continuarBtn = paso1.querySelector("button");
  continuarBtn.onclick = function () {
    if (!validateAutorizacion()) return;
    nextStep(2);
  };
});
</script>
