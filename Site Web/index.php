<!DOCTYPE html>
<html>
    <head>
        <title>Connexion à MySQL avec bdo</title>
        <meta charset="utf-8" />
        <link href="css/styles.css" rel="stylesheet" type="text/css">
        <?php require_once("php/Connect.php"); ?>
    </head>

    <body>
        <header>
            <ul class="menu">
              <li><a class="active" href="index.php">Accueil</a></li>
              <li><a href="php/Ajout.php">Recherche</a></li>
            </ul>
        </header>

        <section>
            <h1>Listes</h1>

            <?php
                $connexion=connect_bd("localhost","gestionhoraire","root","");
                $sql="SELECT * from COURS";

                if (!$connexion->query($sql))
                    echo "Problème d'accès aux clients.";
            ?>

            <form id="formulaire2" name="formulaire2" method="POST" action="index.php">

                <select name="niveau">
                    <?php
                    //on affiche le niveau dans une liste
                    $sql="SELECT NOM_NIVEAU from NIVEAU group by NOM_NIVEAU";
                    foreach ($connexion->query($sql) as $row)
                        echo "<option value=\"".$row['NOM_NIVEAU']."\">".$row['NOM_NIVEAU'];
                    ?>
                </select>


                <input type="submit" id="connect" value="Valider"/>
            </form>


            <table class="clients">
            <?php
                if(isset($_POST['niveau'])){    //s'i a choisit le niveau et envoyer la donnée
                ?>
                    <h1>Horaire des élèves de <?php echo $_POST['niveau'] ?></h1>
                    <tr>
                        <th>HORAIRE</th>
                        <?php //on affiche les jours
                        $sql="SELECT * from JOUR group by ORD_JOUR";
                        foreach ($connexion->query($sql) as $row){
                            echo "<th>".$row['NOM_JOUR']."</th>";
                            $jour = $row;
                        }
                        ?>
                    </tr>
                <?php

                    $sql="SELECT HD_TRANCHE_HORAIRE,HF_TRANCHE_HORAIRE,ID_TRANCHE_HORAIRE from TRANCHE_HORAIRE";
                    foreach ($connexion->query($sql) as $row2){
                        echo "<tr>";    //on affiche les horaires
                        echo "<th>".$row2['HD_TRANCHE_HORAIRE']."-".$row2['HF_TRANCHE_HORAIRE']."</th>";
                        //on prepare sa requete
                        $sql2=$connexion->prepare("SELECT ORD_JOUR,LOGO_SALLE,SALLE.NOM_SALLE,GROUPE.NUMERO_GROUPE,GROUPE.ID_GROUPE,ENSEIGNANT.NOM_ENSEIGNANT,MATIERE.NOM_MATIERE,JOUR.NOM_JOUR,COURS.ID_TRANCHE_HORAIRE as horaire
                                from SALLE,GROUPE,ENSEIGNANT,MATIERE,COURS,JOUR,ENSEIGNER,TRANCHE_HORAIRE,NIVEAU
                                where SALLE.NOM_SALLE=COURS.NOM_SALLE and GROUPE.ID_GROUPE=COURS.ID_GROUPE
                                and MATIERE.NOM_MATIERE=COURS.NOM_MATIERE and ENSEIGNER.NOM_MATIERE = COURS.NOM_MATIERE
                                and ENSEIGNANT.NOM_ENSEIGNANT = ENSEIGNER.NOM_ENSEIGNANT and COURS.NOM_JOUR=JOUR.NOM_JOUR and TRANCHE_HORAIRE.ID_TRANCHE_HORAIRE=COURS.ID_TRANCHE_HORAIRE
                                and NIVEAU.NOM_NIVEAU=:niveau and NIVEAU.NOM_NIVEAU=GROUPE.NOM_NIVEAU");

                        $sql2->execute(array(
                            'niveau' => $_POST['niveau'],
                        ));
                        //on affiche dans le tableau les données récuperés
                        foreach ($sql2 as $row3){
                            if(($row2['ID_TRANCHE_HORAIRE']==$row3['horaire'])){
                                echo "<td>".$row3['LOGO_SALLE']."<br>"
                                            .$row3['NOM_SALLE']."<br>"
                                            .$row3['NUMERO_GROUPE']."<br>"
                                            .$row3['NOM_ENSEIGNANT']."<br>"
                                            .$row3['NOM_MATIERE']
                                    ."</td>";
                            }
                        }
                        echo "</tr>";
                    }

                }
                ?>
            </table>




        </section>

        <footer>
            BAS de ma page.
        </footer>

    </body>
</html>
