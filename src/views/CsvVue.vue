<template>
  <div>
      <h2>Gráfico de Densidade Populacional</h2>
      <div id="visualization" style="height: 400px; width: 400px;"></div>
      <div id="visualization1" style="height: 400px; width: 400px;"></div>
  </div>
</template>

<script type="text/javascript" src='https://www.gstatic.com/charts/loader.js'></script>

<script>



google.charts.load('current', {packages: ['corechart']});
google.charts.setOnLoadCallback(drawVisualization);

function drawVisualization() {
var query = new google.visualization.Query('https://docs.google.com/spreadsheets/d/12hNhG-xm9h8vH6SDe04Sse1Xbe7cs0jouxm3DQrZjCs/gviz/tq?tqx=out:csv&sheet=Sheet1');
query.setQuery(`SELECT B, 
                       SUM(IF(G = 'entranteAtende', 1, 0)) as Atendidas, 
                       SUM(IF(G = 'entranteAbandona', 1, 0)) as Abandonadas 
                GROUP BY B`);
query.send(handleQueryResponse);
}

function handleQueryResponse(response) {
if (response.isError()) {
  console.error('Erro na consulta: ' + response.getMessage() + ' ' + response.getDetailedMessage());
  return;
}

var data = new google.visualization.DataTable();
data.addColumn('string', 'Nome');
data.addColumn('number', 'Atendidas');
data.addColumn('number', 'Abandonadas');

var dataTable = response.getDataTable();
for (var i = 0; i < dataTable.getNumberOfRows(); i++) {
  var nome = dataTable.getValue(i, 0);
  var atendidas = dataTable.getValue(i, 1);
  var abandonadas = dataTable.getValue(i, 2);
  data.addRow([nome, atendidas, abandonadas]);
}

var options = {
  title: 'Atendidas vs. Abandonadas por Nome',
  width: 600,
  height: 400,
  legend: { position: 'top', maxLines: 2 }
};

var chart = new google.visualization.BarChart(document.getElementById('visualization'));
chart.draw(data, options);
}
</script>
