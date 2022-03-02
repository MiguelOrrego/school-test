$(document).ready(function () {
    // obtenemos los profesores y llenamos el select
    $.ajax({
        type: 'POST',
        url: './controller/SchoolController.php',
        data: {
            "callFunc1": "1"
        },
        dataType: 'json',
        //data: {nombre:n},
        success: function (data) {
            var sel = $("#teachers");
            sel.empty();
            sel.append('<option disabled selected>--- Selecionar un profesor ---</option>');
            for (var i = 0; i < data.length; i++) {
                sel.append('<option value="' + data[i].id + '">' + data[i].nombre + '</option>');
            }

        },
        error: function (err) {
            console.log(err);
        }
    });
    // Obtenemos las asignaturas por docente por medio de un form y mostramos por medio de una tabla
    $('#signature').on('submit', function (e) {
        e.preventDefault();
        $.ajax({
            type: 'post',
            url: './controller/SchoolController.php',
            data: $('form').serialize(),
            dataType: 'json',
            success: function (data) {
                console.log(data);
                if (data != 0) {
                    $(".alert-danger").hide();
                    var sel = $("#teachers_table");
                    sel.empty();
                    sel.append(data.table);
                    // for (var i = 0; i < data.length; i++) {
                    //     sel.append('<tr><td>' + data[i].nombre + '</td><td>' + data[i].curso + '</td><td>');
                    //     for (var e = 0; e <  data[i].estudiantes.length; e++) {
                    //         sel.append(data[i].estudiantes[e].nombre + '<br>');
                    //     }
                    //     sel.append('</td></tr>');
                    // }
                    $('.title_signature').html('Asignaturas del docente: ' + data.query[0].profesor);
                    $('#content_signature').show();
                } else {
                    $(".alert-danger").show();
                }
            },
            error: function (err) {
                console.log(err);
            }
        });

    });


})