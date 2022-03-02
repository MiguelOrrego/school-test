<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Colegio</title>
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="./css/styles.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />

</head>

<body>
    <!-- Navigation-->
    <nav class="navbar navbar-expand-md bg-secondary text-uppercase fixed-top" id="mainNav">
        <div class="container">
            <a class="navbar-brand" href="#">El colegio del olimpo</a>
        </div>
    </nav>
    <!-- Masthead-->
    <header class="masthead bg-primary text-white text-center">
        <div class="container d-flex align-items-center flex-column">
            <!-- Masthead Avatar Image-->
            <img class="masthead-avatar mb-2" src="./img/libros.png" alt="..." />
            <!-- Masthead Heading-->
            <h1 class="masthead-heading text-uppercase mb-0">Asignaturas</h1>
        </div>
    </header>
    <section class="page-section">
        <div class="container">
            <?php
            // include './connection_bd.php';

            // $dConnect = new ConnectionBd;
            // $cdb = $dConnect->connection();           
            // $query = "SELECT * FROM teacher;";
            // $statement = $cdb->prepare($query);
            // $statement->execute();
            // $rows = $statement->fetchAll(\PDO::FETCH_OBJ);
            // echo json_encode($rows);
            ?>
            <div class="form-row">
                <form method="POST" enctype="multipart/form-data" id="signature">
                    <select class="form-select form-group col-md-10" name="teacher" id="teachers" required="true">
                    </select>
                    <input type="hidden" name="callFunc2" value="2">
                    <br>
                    <button type="submit" class="btn btn-primary">Consultar</button>
                </form>
                <br>
                <div class="alert alert-danger" role="alert" style="display: none;">
                     Por favor seleccione un profesor
                </div>
                <div style="display: none;" id="content_signature">
                    <h5 class="card-header title_signature" style="color:black"></h5>
                    <br>
                    <table id="teachers_table">
                    </table>
                </div>
            </div>
        </div>
    </section>

    <script src="./js/jquery-3.6.0.min.js"></script>
    <script src="./js/functions.js"></script>

</body>

</html>