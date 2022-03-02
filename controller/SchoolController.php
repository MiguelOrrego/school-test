<?php
include '../connection_bd.php';

$dConnect = new ConnectionBd;
$cdb = $dConnect->connection();

// obtenemos los profesores para listar en el select
function getTeachers($cdb)
{
    $query = "SELECT * FROM profesor;";
    $statement = $cdb->prepare($query);
    $statement->execute();
    $rows = $statement->fetchAll(\PDO::FETCH_OBJ);
    return json_encode($rows);
}

//Obtener asignaturas del profesor
function getSubjects($cdb, $teacher)
{
    $array = [];
    $html = '<thead><th>Asignatura</th><th>Curso</th><th>Estudiantes</th></thead>';
    $query = "SELECT a.id , a.nombre, p.nombre as profesor, c.grado, c.salon FROM asignatura a INNER JOIN profesor p ON a.profesor = p.id INNER JOIN curso c
    ON a.curso = c.id WHERE a.profesor=" . $teacher;
    $statement = $cdb->prepare($query);
    $statement->execute();
    $rows = $statement->fetchAll(\PDO::FETCH_OBJ);

    foreach ($rows as $data) {
        $query = "SELECT e.nombre FROM asignatura_estudiantes ae INNER JOIN estudiante e ON ae.estudiante_id = e.id WHERE ae.asignatura_id=" . $data->id;
        $statement = $cdb->prepare($query);
        $statement->execute();
        $dataStudents = $statement->fetchAll(\PDO::FETCH_OBJ);

        $html .= '<tr style="align-items: center;"><td>' . $data->nombre . '</td><td>' . $data->grado . '-' . $data->salon . '</td>';
        $html .= '<td>';
        foreach ($dataStudents as  $value) {
            $html .=  $value->nombre . '<br>';
        }
        $html .= '</td>';
    }
    $array = ["table" => $html, "query" => $rows];
    return json_encode($array);
}

if (isset($_POST['callFunc1'])) {
    echo getTeachers($cdb);
}

if (isset($_POST['callFunc2'])) {
    if(isset($_POST['teacher'])){
        echo getSubjects($cdb, $_POST['teacher']);
    }else{
        echo 0;
    }
}
