
$(document).ready(function () {

    $('#saveContact').submit(function (e) {

        $.post('/estadistica', $(this).serialize(), function (contact) {
            var trHTML = '';
            $("#tablaraizcuadrada tr").remove();
            $("#sololocal tr").remove();
            $("#localvstodosl tr").remove();
            $("#localvstodos tr").remove();
            $("#visitavstodos tr").remove();
            $("#visitavstodosv tr").remove();

            var listlocalvsvisita = contact.localvsvisita;
            trHTML += '<tr>';
            trHTML += '<th scope="col">Jornada</th>';
            trHTML += '<th scope="col" >Fecha</th>';
            trHTML += '<th scope="col">Local</th>';
            trHTML += '<th scope="col"> </th>';
            trHTML += '<th scope="col">Visita</th>';
            trHTML += '<th scope="col">Torneo</th>';
            trHTML += '<th scope="col">Estadio</th>';
            trHTML += '</tr>';
            $.each(listlocalvsvisita, function (index, value) {
                trHTML += '<tr>';
                trHTML += '<td  scope="row" data-label="Jornada" >' + value.jornada + '</td>';
                trHTML += '<td data-label="Fecha">' + value.fecha + '</td>';
                trHTML += '<td  data-label="Local">' + value.local + '</td>';

                trHTML += '<td data-label="Resultado">' + value.goleslocal + '-' + value.golesvisita + '</td>';

                trHTML += '<td data-label="Visita" >' + value.visita + '</td>';



                trHTML += '<td data-label="Torneo" >' + value.torneo + '</td>';
                trHTML += '<td  data-label="Estadio">' + value.estadio + '</td>';
                trHTML += '</tr>';
                

            });
            // GRAFICA INICIO
            // 
            google.charts.load('current', {'packages': ['corechart']});
            google.charts.setOnLoadCallback(drawChart);
            function drawChart() {

                var localN = contact.local;
                var empateN = 'empate';
                var visitaN = contact.visita;
                var local = contact.localvsvisitalocal;
                var visita = contact.localvsvisitavisita;
                var empate = contact.localvsvisitaempate;


                var data = google.visualization.arrayToDataTable([
                    ['Equipos', 'Evento'],
                    [localN, local],
                    [visitaN, visita],
                    [empateN, empate]
                ]);

                var options = {
                    title: localN + ' vs ' + visitaN
                };

                var chart = new google.visualization.PieChart(document.getElementById('piechart'));

                chart.draw(data, options);
            }
            // 
            // GRAFICA FIN


            //
            //tabla solo local
            //
            var trHTML1 = '';
            $("#tablaraizcuadrada tr").remove();

            var listlocalvsvisitaL = contact.localvsvisital;
            trHTML1 += '<tr>';
            trHTML1 += '<th>Jornada</th>';
            trHTML1 += '<th>Fecha</th>';
            trHTML1 += '<th>Local</th>';
            trHTML1 += '<th> </th>';
            trHTML1 += '<th>Visita</th>';
            trHTML1 += '<th>Torneo</th>';
            trHTML1 += '<th>Estadio</th>';
            trHTML1 += '</tr>';
            $.each(listlocalvsvisitaL, function (index, value) {
                trHTML1 += '<tr>';
                trHTML1 += '<td >' + value.jornada + '</td>';
                trHTML1 += '<td >' + reformatDate(value.fecha) + '</td>';
                trHTML1 += '<td >' + value.local + '</td>';
                trHTML1 += '<td>' + value.goleslocal + '-' + value.golesvisita + '</td>';
                trHTML1 += '<td>' + value.visita + '</td>';
                trHTML1 += '<td >' + value.torneo + '</td>';
                trHTML1 += '<td >' + value.estadio + '</td>';

                trHTML1 += '</tr>';


            });


            // GRAFICA INICIO SOLO LOCAL
            // 
            google.charts.load('current', {'packages': ['corechart']});
            google.charts.setOnLoadCallback(drawChart1);
            function drawChart1() {

                var localN = contact.local;
                var empateN = 'empate';
                var visitaN = contact.visita;
                var local = contact.localvsvisitallocal;
                var visita = contact.localvsvisitalvisita;
                var empate = contact.localvsvisitalempate;


                var data = google.visualization.arrayToDataTable([
                    ['Equipos', 'Evento'],
                    [localN, local],
                    [visitaN, visita],
                    [empateN, empate]
                ]);

                var options = {
                    title: localN + ' vs ' + visitaN
                };

                var chart = new google.visualization.PieChart(document.getElementById('piechartsololocal'));

                chart.draw(data, options);
            }
            // 
            // GRAFICA FIN


            //
            //
            // local vs todos
            //
            var trHTML2 = '';


            var localvstodos = contact.localvstodos;
            trHTML2 += '<tr>';
            trHTML2 += '<th>Jornada</th>';
            trHTML2 += '<th>Fecha</th>';
            trHTML2 += '<th>Local</th>';
            trHTML2 += '<th> </th>';
            trHTML2 += '<th>Visita</th>';
            trHTML2 += '<th>Torneo</th>';
            trHTML2 += '<th>Estadio</th>';

            trHTML2 += '</tr>';
            $.each(localvstodos, function (index, value) {
                trHTML2 += '<tr>';
                trHTML2 += '<td >' + value.jornada + '</td>';
                trHTML2 += '<td >' + reformatDate(value.fecha) + '</td>';
                trHTML2 += '<td >' + value.local + '</td>';
                trHTML2 += '<td>' + value.goleslocal + '-' + value.golesvisita + '</td>';
                trHTML2 += '<td>' + value.visita + '</td>';
                trHTML2 += '<td >' + value.torneo + '</td>';
                trHTML2 += '<td >' + value.estadio + '</td>';
                trHTML2 += '</tr>';


            });
            // GRAFICA LOCAL CONTRA TODOS
            // 
            google.charts.load('current', {'packages': ['corechart']});
            google.charts.setOnLoadCallback(drawChart2);
            function drawChart2() {

                var localN = contact.local;
                var empateN = 'empate';
                var visitaN = contact.visita;
                var local = contact.localvstodoslocal;
                var visita = contact.localvstodosvisita;
                var empate = contact.localvstodosempate;


                var data = google.visualization.arrayToDataTable([
                    ['Equipos', 'Evento'],
                    [localN, local],
                    ['Otros', visita],
                    [empateN, empate]
                ]);

                var options1 = {
                    title: localN + ' vs  Otros'
                };

                var chart = new google.visualization.PieChart(document.getElementById('piechartlocalvstodos'));

                chart.draw(data, options1);
            }
            // 
            // GRAFICA FIN


            //
            //
            // local vs todos  solo de local
            //
            var trHTML3 = '';


            var localvstodosl = contact.localvstodosl;
            trHTML3 += '<tr>';
            trHTML3 += '<th>Jornada</th>';
            trHTML3 += '<th>Fecha</th>';
            trHTML3 += '<th>Local</th>';
            trHTML3 += '<th> </th>';
            trHTML3 += '<th>Visita</th>';
            trHTML3 += '<th>Torneo</th>';
            trHTML3 += '<th>Estadio</th>';
            trHTML3 += '</tr>';
            $.each(localvstodosl, function (index, value) {
                trHTML3 += '<tr>';
                trHTML3 += '<td >' + value.jornada + '</td>';
                trHTML3 += '<td >' + reformatDate(value.fecha) + '</td>';
                trHTML3 += '<td >' + value.local + '</td>';
                trHTML3 += '<td>' + value.goleslocal + '-' + value.golesvisita + '</td>';
                trHTML3 += '<td>' + value.visita + '</td>';
                trHTML3 += '<td >' + value.torneo + '</td>';
                trHTML3 += '<td >' + value.estadio + '</td>';
                trHTML3 += '</tr>';


            });


            // GRAFICA LOCAL CONTRA TODOS solo de local
            // 
            google.charts.load('current', {'packages': ['corechart']});
            google.charts.setOnLoadCallback(drawChart3);
            function drawChart3() {

                var localN = contact.local;
                var empateN = 'empate';
                var visitaN = contact.visita;
                var local = contact.localvstodosllocal;
                var visita = contact.localvstodoslvisita;
                var empate = contact.localvstodoslempate;


                var data = google.visualization.arrayToDataTable([
                    ['Equipos', 'Evento'],
                    [localN, local],
                    ['Otros', visita],
                    [empateN, empate]
                ]);

                var options1 = {
                    title: localN + ' vs  Otros'
                };

                var chart = new google.visualization.PieChart(document.getElementById('piechartlocalvstodosl'));

                chart.draw(data, options1);
            }
            // 
            // GRAFICA FIN

            //
            //
            // visita vs todos  
            //
            var trHTML4 = '';


            var visitavstodos = contact.visitavstodos;
            trHTML4 += '<tr>';
            trHTML4 += '<th>Jornada</th>';
            trHTML4 += '<th>Fecha</th>';
            trHTML4 += '<th>Local</th>';
            trHTML4 += '<th> </th>';
            trHTML4 += '<th>Visita</th>';
            trHTML4 += '<th>Torneo</th>';
            trHTML4 += '<th>Estadio</th>';
            trHTML4 += '</tr>';
            $.each(visitavstodos, function (index, value) {
                trHTML4 += '<tr>';
                trHTML4 += '<td >' + value.jornada + '</td>';
                trHTML4 += '<td >' + reformatDate(value.fecha) + '</td>';
                trHTML4 += '<td >' + value.local + '</td>';
                trHTML4 += '<td>' + value.goleslocal + '-' + value.golesvisita + '</td>';
                trHTML4 += '<td>' + value.visita + '</td>';
                trHTML4 += '<td >' + value.torneo + '</td>';
                trHTML4 += '<td >' + value.estadio + '</td>';
                trHTML4 += '</tr>';


            });
            // GRAFICA VISITA CONTRA TODOS 
            // 
            google.charts.load('current', {'packages': ['corechart']});
            google.charts.setOnLoadCallback(drawChart4);
            function drawChart4() {

                var localN = contact.local;
                var empateN = 'empate';
                var visitaN = contact.visita;
                var local = contact.visitavstodoslocal;
                var visita = contact.visitavstodosvisita;
                var empate = contact.visitavstodosempate;


                var data = google.visualization.arrayToDataTable([
                    ['Equipos', 'Evento'],
                    [visitaN, visita],
                    ['Otros', local],
                    [empateN, empate]
                ]);

                var options1 = {
                    title: visitaN + ' vs  Otros'
                };

                var chart = new google.visualization.PieChart(document.getElementById('piechartvisitavstodos'));

                chart.draw(data, options1);
            }
            // 
            // GRAFICA FIN   

            //
            // visita vs todos  solo de visita
            //
            var trHTML5 = '';


            var visitavstodosv = contact.visitavstodosv;
            trHTML5 += '<tr>';
            trHTML5 += '<th>Jornada</th>';
            trHTML5 += '<th>Fecha</th>';
            trHTML5 += '<th>Local</th>';
            trHTML5 += '<th> </th>';
            trHTML5 += '<th>Visita</th>';
            trHTML5 += '<th>Torneo</th>';
            trHTML5 += '<th>Estadio</th>';
            trHTML5 += '</tr>';
            $.each(visitavstodosv, function (index, value) {
                trHTML5 += '<tr>';
                 trHTML5 += '<td >' + value.jornada + '</td>';
                trHTML5 += '<td >' + reformatDate(value.fecha) + '</td>';
                trHTML5 += '<td >' + value.local + '</td>';
                trHTML5 += '<td>' + value.goleslocal + '-' + value.golesvisita + '</td>';
                trHTML5 += '<td>' + value.visita + '</td>';
                trHTML5 += '<td >' + value.torneo + '</td>';
                 trHTML5 += '<td >' + value.estadio + '</td>';
                trHTML5 += '</tr>';


            });

            // GRAFICA VISITA CONTRA TODOS 
            // 
            google.charts.load('current', {'packages': ['corechart']});
            google.charts.setOnLoadCallback(drawChart5);
            function drawChart5() {

                var localN = contact.local;
                var empateN = 'empate';
                var visitaN = contact.visita;
                var local = contact.visitavstodosvlocal;
                var visita = contact.visitavstodosvvisita;
                var empate = contact.visitavstodosvempate;


                var data = google.visualization.arrayToDataTable([
                    ['Equipos', 'Evento'],
                    [visitaN, visita],
                    ['Otros', local],
                    [empateN, empate]
                ]);

                var options1 = {
                    title: visitaN + ' vs  Otros'
                };

                var chart = new google.visualization.PieChart(document.getElementById('piechartvisitavstodosv'));

                chart.draw(data, options1);
            }
            // 
            // GRAFICA FIN   








            var titulo = '<h1> Estadisticas ' + contact.local + " vs " + contact.visita + '</h1>';
            var mensaje = '<h2>Ultimos  encuentros entre ' + contact.local + " vs " + contact.visita + ' </h2>';



            $("#estadisticaTitulo").html(titulo);
            $("#localyvisita").html(mensaje);
            var mensaje1 = '<h2> Ultimos  encuentros ' + contact.local + ' como local vs ' + contact.visita + '</p>';
            $("#titlesololocal").html(mensaje1);

            var mensaje2 = '<h2> Ultimos  encuentros: ' + contact.local + ' </h2>';
            $("#titleslocalvstodos").html(mensaje2);

            var mensaje3 = '<h2> Ultimos  partidos: ' + contact.local + ' como local </h2>';
            $("#titlelocalvstodos1").html(mensaje3);

            var mensaje4 = '<h2> Ultimos  encuentros: ' + contact.visita + '</h2>';
            $("#titlevisitavstodos").html(mensaje4);

            var mensaje5 = '<h2> Ultimos  encuentros: ' + contact.visita + ' como visita</h2>';
            $("#titlevisitavstodosv").html(mensaje5);


            $('#tablaraizcuadrada').append(trHTML);
             $('#tablaraizcuadrada').footable(); 
            $('#sololocal').append(trHTML1);
            $('#localvstodos').append(trHTML2);
            $('#localvstodosl').append(trHTML3);
            $('#visitavstodos').append(trHTML4);
            $('#visitavstodosv').append(trHTML5);
          
            

        });
        e.preventDefault();
       
    });
    
   

});

 



function reformatDate(dateStr)
{
    dArr = dateStr.split("-");  // ex input "2010-01-18"
    return dArr[2] + "/" + dArr[1] + "/" + dArr[0]; //ex out: "18/01/10"
}


