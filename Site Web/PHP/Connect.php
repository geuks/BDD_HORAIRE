<?php

    function connect_bd($serverName,$baseName,$userName,$password){
        $dsn="mysql:dbname=".$baseName.";host=".$serverName;
        try{
            $connexion=new PDO($dsn,$userName,$password);
        }
        catch(PDOException $e){
            printf("Echec de la connexion : %s \n", $e->getMessage());
            exit();
        }
        return $connexion;
    }
?>
