<!DOCTYPE html>
<html>
    <head>
        <title>Connexion à MySQL avec bdo</title>
        <meta charset="utf-8" />
        <link href="../css/styles.css" rel="stylesheet" type="text/css">
        <?php require_once("Connect.php"); ?>
    </head>

    <body>
        <header>
            <ul class="menu">
              <li><a href="../index.php">Accueil</a></li>
              <li><a class="active" href="Ajout.php">Ajout</a></li>
            </ul>
        </header>

        <section>
            <h1>Ajout</h1>

            <?php
                $connexion=connect_bd("localhost","gestionhoraire","root","");
                $sql="SELECT * from COURS";

                if (!$connexion->query($sql))
                    echo "Problème d'accès aux clients.";


                $cpt=0;
                $nom="";
                $id="";

                //Si il a choisit et envoyer les donnes
                if ((isset($_POST['ID_TRANCHE_HORAIRE'])) && (isset($_POST['NOM_NIVEAU'])) && (isset($_POST['NOM_JOUR'])) && (isset($_POST['NOM_MATIERE']))
                    && (isset($_POST['NOM_SALLE'])) && (isset($_POST['TYPE'])) && (isset($_POST['NOM_ENSEIGNANT']))){
                    $NomId = $_POST['NOM_NIVEAU'];
                    $cpt=0;
                    //on récupère les nom et id du groupe et du niveau depuis le optgroup et on sépare les données
                    for ($i=0; $i < strlen($NomId); $i++) {
                        if($NomId[$i]=='-'){
                            $id=substr($NomId,$i+1);
                            $nom=substr($NomId,0,$i);
                            break;
                        }
                    }

                    //on prepare notre requete sqlite_array_query
                    $sql=$connexion->prepare("Insert into ENSEIGNER (NOM_MATIERE,NOM_ENSEIGNANT) values (:matiere,:enseignant);");
                    $sql->execute(array(
                        'matiere' => $_POST['NOM_MATIERE'],
                        'enseignant' => $_POST['NOM_ENSEIGNANT']
                    ));
                    //on insert dans la bdd
                    $sql=$connexion->prepare("Insert into COURS (ID_TRANCHE_HORAIRE, ID_GROUPE, NOM_JOUR, NOM_MATIERE, NOM_SALLE, TYPE) values (:horaire,:groupe,:jour,:matiere,:salle,:type);");
                    $sql->execute(array(
                        'horaire' => $_POST['ID_TRANCHE_HORAIRE'],
                        'groupe' => $id,
                        'jour' => $_POST['NOM_JOUR'],
                        'matiere' => $_POST['NOM_MATIERE'],
                        'salle' => $_POST['NOM_SALLE'],
                        'type' => $_POST['TYPE']
                    ));
                }
            ?>



            <form id="formulaire2" name="formulaire2" method="POST" action="Ajout.php">
                <fieldset>
                    <legend>Client:</legend>

                        <legend>Niveau:</legend>
                        <select name="NOM_NIVEAU">
                            <?php //affiche le niveau et groupe dans un optgroup
                                $sql="SELECT NOM_NIVEAU from NIVEAU group by NOM_NIVEAU";
                                foreach ($connexion->query($sql) as $row) {
                                    echo "<optgroup label=".$row['NOM_NIVEAU']." value=\"".$row['NOM_NIVEAU']."\">";
                                    ?>
                                    <optgroup>
                                        <?php
                                            $sql2="SELECT ID_GROUPE,NUMERO_GROUPE,GROUPE.NOM_NIVEAU,NIVEAU.NOM_NIVEAU from GROUPE,NIVEAU where GROUPE.NOM_NIVEAU=NIVEAU.NOM_NIVEAU group by ID_GROUPE asc";

                                            foreach ($connexion->query($sql2) as $row2) {
                                                if($row['NOM_NIVEAU']==$row2['NOM_NIVEAU'])
                                                    echo "<option value=\"".$row['NOM_NIVEAU']."-".$row2['ID_GROUPE']."\">".$row2['NUMERO_GROUPE'];
                                            }
                                        ?>
                                    </optgroup>
                                    </optgroup>
                                    <?php

                                }
                            ?>

                        </select>

                        <legend>Professeur:</legend>
                        <select name="NOM_ENSEIGNANT">
                            <?php
                                $sql="SELECT NOM_ENSEIGNANT from ENSEIGNANT order by NOM_ENSEIGNANT ASC";
                                foreach ($connexion->query($sql) as $row) {
                                    echo "<option value=\"".$row['NOM_ENSEIGNANT']."\">".$row['NOM_ENSEIGNANT'];
                                }
                            ?>
                        </select>

                        <legend>Matière:</legend>
                        <select name="NOM_MATIERE">
                            <?php
                                $sql="SELECT NOM_MATIERE from MATIERE order by NOM_MATIERE ASC";
                                foreach ($connexion->query($sql) as $row) {
                                    echo "<option value=\"".$row['NOM_MATIERE']."\">".$row['NOM_MATIERE'];
                                }
                            ?>
                        </select>

                        <legend>Type de matière:</legend>
                        <select name="TYPE">
                            <?php
                                $sql="SELECT TYPE from TYPE_MATIERE order by TYPE ASC";
                                foreach ($connexion->query($sql) as $row) {
                                    echo "<option value=\"".$row['TYPE']."\">".$row['TYPE'];
                                }
                            ?>
                        </select>

                        <legend>Jour:</legend>
                        <select name="NOM_JOUR">
                            <?php
                                $sql="SELECT NOM_JOUR,ORD_JOUR from JOUR order by ORD_JOUR ASC";
                                foreach ($connexion->query($sql) as $row) {
                                    echo "<option value=\"".$row['NOM_JOUR']."\">".$row['NOM_JOUR'];
                                }
                            ?>
                        </select>

                        <legend>Horaire:</legend>
                        <select name="ID_TRANCHE_HORAIRE">
                            <?php
                                $sql="SELECT ID_TRANCHE_HORAIRE,HD_TRANCHE_HORAIRE,HF_TRANCHE_HORAIRE from TRANCHE_HORAIRE";
                                foreach ($connexion->query($sql) as $row) {
                                    echo "<option value=\"".$row['ID_TRANCHE_HORAIRE']."\">".$row['HD_TRANCHE_HORAIRE']." - ".$row['HF_TRANCHE_HORAIRE'];
                                }
                            ?>
                        </select>


                        <legend>Salle:</legend>
                        <select name="NOM_SALLE">
                            <?php
                                $sql="SELECT NOM_SALLE from SALLE order by NOM_SALLE ASC";
                                foreach ($connexion->query($sql) as $row) {
                                    echo "<option value=\"".$row['NOM_SALLE']."\">".$row['NOM_SALLE'];
                                }
                            ?>
                        </select>
                </fieldset>

                <input type="submit" id="connect" value="Valider"/>
            </form>




        </section>

        <footer>
            BAS de ma page.
        </footer>

    </body>
</html>
