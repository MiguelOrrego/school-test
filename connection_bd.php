<?php

class ConnectionBd
{
    // Funcion para asignar valores para la conexión a la bd
    public function connection()
    {
        $db = 'mysql';
        $host = '127.0.0.1';
        $dbname = 'school';
        $username = 'root';
        $passwd = '';
        return $this->dbConnect($db, $host, $dbname, $username, $passwd);
    }

    // Funcion para obtener la conexión a la bd por medio de parametros si la conexión es exitosa
    // retorna un objeto PDO con la conexión realizada
    public function dbConnect($db, $host, $dbname, $username, $passwd)
    {
        $dsn = $db . ':host=' . $host . ';dbname=' . $dbname;
        try {
            $connection = new PDO($dsn, $username, $passwd);
            $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $pdoExcetion) {
            $connection = null;
            echo 'Error al establecer la conexión: ' . $pdoExcetion;
            exit();
        }
        // echo 'Conectado a la base de datos: ' . $dbname;
        return $connection;
    }
}
