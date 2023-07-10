<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <title>Ihre E-Mensa</title>
    <style>
        #grid-3Q {
            display: grid;
            grid-template-columns: 10% auto 10%;
            font-family: Arial;
        }

        #mitte {
            border: 1px solid black;
            padding-left: 200px;
            padding-right: 200px;
            padding-top: 50px;
            padding-bottom: 20px;
        }

        header:not(.fh) {
            border: 1px solid black;
            padding: 10px;
            padding-top: 15px;
            padding-bottom: 5px;
            position: sticky;
            position: -webkit-sticky;
            top: 0;
            background-color: white;
        }

        a {
            text-decoration: underline;
            color: rgba(29, 183, 183, 0.8);
            padding-left: 25px;
        }

        .fh {
            position: absolute;
            left: -95px;
            top: -6px;
            width: 170px;
        }

        #mensa {

            width: 100%;
            margin-top: 30px;
            padding-bottom: 20px;
        }

        h1:not(#section1) {
            padding-top: 50px;
        }

        #end {
            text-align: center;
        }

        #ankündigung {
            border: 1px solid black;
            padding: 10px;
        }

        #formular {
            display: flex;
            gap: 15px;
        }

        #submit {
            display: grid;
            width: 100%;
            grid-template-columns: auto auto;
            padding-top: 5px;
        }

        .extension {
            border-top: 1px solid black;
            text-align: center;
        }

        .extension td {
            border-top: 1px solid black;
            text-align: center;
        }

        .preis {
            text-align: center;
        }

        table:not(.allergene) {
            border: 1px solid black;
            width: 100%;
        }

        #werte {
            display: grid;
            justify-content: center;
        }

        footer {
            border-top: 2px solid rgba(121, 114, 107, 0.51);
            text-align: center;
        }

        footer li {
            display: inline;
            padding-right: 20px;
        }
        .allergene {
            font-size: 10px;
        }
        footer li + li {
            border-left: 1px solid rgba(42, 35, 27, 0.48);
            padding-left: 20px;
        }

        th:not(.allergene) {
            border-bottom: 1px solid black;
        }

        table tr:not(.allergene) {
            border-top: 1px solid black;
        }

        #impressum {
            color: rgba(29, 183, 183, 0.8);
            text-decoration: underline;
        }

        .flex-container {
            display: grid;
            font-weight: bold;
            width: 100%;
            text-align: center;
            grid-template-columns: auto auto auto;
            font-size: 20px;
        }

        .flex-container > div {
            margin: 10px;
            padding: 20px;
        }
    </style>

</head>
<body id="grid-3Q">
<div id="links"></div>
<div id="mitte">
    <header>
        <div class="fh">
            <img src="../werbeseite/img/fhaachen_logo.jpeg" alt="FH-Aachen Logo" class="fh">
        </div>
        <a href="#section1">Ankündigungen</a>
        <a href="#section2">Speisen</a>
        <a href="#section3">Zahlen</a>
        <a href="#section4">Kontakt</a>
        <a href="#section5">Wichtig für uns</a>
    </header>
    <main>

        <img src="../werbeseite/img/mensa.jpg" alt="Mensa" id="mensa">
        <h1 id="section1">Bald gibt es Essen auch online ;)</h1>
        <div id="ankündigung">
            <p>In my younger and more vulnerable years my father gave me some advice that I've been turning over in my
                mind
                ever
                since.</p>
            <p>"Whenever you feel like criticizing any one," he told me, "just remember that all the people in this
                world
                haven't had the advantages that you've had."</p>
            <p>He didn't say any more, but we've always been unusually communicative in a reserved way, and I understood
                that he
                meant a great deal more than that. In consequence, I'm inclined to reserve all judgments, a habit that
                has
                opened up many curious natures to me and also made me the victim of not a few veteran bores. The
                abnormal
                mind
                is quick to detect and attach itself to this quality when it appears in a normal person, and so it came
                about
                that in college I was unjustly accused of being a politician, because I was privy to the secret griefs
                of
                wild,
                unknown men. Most of the confidences were unsought-frequently I have feigned sleep, preoccupation, or a
                hostile
                levity when I realized by some unmistakable sign that an intimate revelation was quivering on the
                horizon;
                for
                the intimate revelations of young men, or at least the terms in which they express them, are usually
                plagiaristic and marred by obvious suppressions. Reserving judgments is a matter of infinite hope. I am
                still a
                little afraid of missing something if I forget that, as my father snobbishly suggested, and I snobbishly
                repeat,
                a sense of the fundamental decencies is parcelled out unequally at birth.</p>
        </div>
        <h1 id="section2">Köstlichkeiten, die Sie erwarten</h1>
        <table>
            <tr class="tabellenkopf">
                <th>Gerichte</th>
                <th>Allergene</th>
                <th>Preis intern</th>
                <th>Preis extern</th>
            </tr>
            <?php
            include 'gerichte.php';
            $link = mysqli_connect(
                "localhost",
                "root",
                "root",
                "emensawerbeseite",
                4200
            );

     $sql = "SELECT gericht.name Name, GROUP_CONCAT(gericht_hat_allergen.code) Allergen, gericht.preis_intern, gericht.preis_extern
FROM gericht INNER JOIN gericht_hat_allergen
WHERE gericht.id = gericht_hat_allergen.gericht_id
GROUP BY gericht.name
ORDER BY gericht.name ASC
LIMIT 5";
            $result = mysqli_query($link, $sql);

            while ($row = mysqli_fetch_row($result)) {
                echo '<td>' . $row[0] . '</td><td>' . $row[1] . '</td><td class="preis">' . $row[2] . '</td><td class="preis">' . $row[3] . '</td></tr>';
            }

            ?>

        </table>
        <br>


        <?php

        $sql = "SELECT GROUP_CONCAT(CONCAT_WS('-',allergen.code, allergen.name) SEPARATOR ', ') 
FROM gericht, gericht_hat_allergen, allergen
WHERE gericht.id = gericht_hat_allergen.gericht_id AND allergen.code = gericht_hat_allergen.code
GROUP BY gericht.name
ORDER BY gericht.name ASC
LIMIT 5;";
        $result = mysqli_query($link, $sql);
        echo '<table class ="allergene"><tr><th>Allergencodes</th></tr>';
        while ($row = mysqli_fetch_row($result)) {
            echo '<tr><td>' . $row[0] . '</td><td>';
        }
        echo '</table>'; ?>
        <h1 id="section3">E-Mensa in Zahlen</h1>
        <div class="flex-container">
            <?php
            $filePath = "Newsletteranmeldungen.txt";
            $lines = count(file($filePath));
            echo '<div>' . $lines . ' Anmeldungen zum Newsletter</div>';


            $counter_name = "counter.txt";

            //Counter Datei anlegen
            if (!file_exists($counter_name)) {
                $f = fopen($counter_name, "w");
                fwrite($f,"0");
                fclose($f);
            }

            // Wert auslesen
            $f = fopen($counter_name,"r");
            $counterVal = fread($f, filesize($counter_name));
            fclose($f);

            // Counter erhöhen und in Datei schreiben
            if(!isset($_SESSION)){
                $counterVal++;
                $f = fopen($counter_name, "w");
                fwrite($f, $counterVal);
                fclose($f);
            }
            echo '<div>' . $counterVal . ' Besucher</div>';


            $sql ="SELECT count(gericht.name) FROM gericht;";
            $result = mysqli_query($link, $sql);
            while ($row = mysqli_fetch_row($result)){
                echo '<div>' . $row[0] . ' Gerichte</div>';
            }

            ?>

        </div>


        <h1 id="section4">Interesse geweckt? Wir informieren Sie!</h1>

        <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
            <div id="formular">
                <div>
                    <label for="name">Ihr Name:
                        <br>
                        <input type="text" id="name" name="name" placeholder="Vornamen">
                    </label>
                </div>
                <div>
                    <label for="email">Ihr Email:
                        <br>
                        <input type="text" id="email" name="email">
                    </label>
                </div>
                <div>
                    <label for="newslettersprache">Newletter bitte in:</label>
                    <br>
                    <select name="newslettersprache" id="newslettersprache" name="newslettersprache">
                        <option value="deutsch">Deutsch</option>
                        <option value="englisch">Englisch</option>
                    </select>
                </div>
            </div>
            <div id="submit">
                <label for="datenschutz">
                    <input type="checkbox" id="datenschutz" name="datenschutz"> Den Datenschutzbestimmungen stimme ich
                    zu
                </label>
                <input type="submit" value="Zum Newsletter anmelden" name="submit">
            </div>

        </form>
        <h1 id="section5">Das ist uns wichtig</h1>
        <ul id="werte">
            <li>Beste frische saisionale Zutaten</li>
            <li>Ausgewogene abwechslungsreiche Gerichte</li>
            <li>Sauberkeit</li>
        </ul>
        <h1 id="end">Wir freuen uns auf Ihren Besuch!</h1>
    </main>
    <footer>
        <ul id="fuß">
            <li>(c) E-Mensa GmbH</li>
            <li>Tobias Sander</li>
            <li>Lina Hsu</li>
            <li id="impressum">Impressum</li>
        </ul>
    </footer>
</div>

<div id="rechts"></div>
</body>
</html>

<?php
if (isset($_POST['submit'])) {
    test_function();
}
function test_function()
{
    $nameErr = $emailErr = $datenErr = false;

    $name = trim($_POST["name"]);
    $email = trim($_POST["email"]);

    if (empty($_POST["datenschutz"])) {
        echo '<script>alert("Den Datenschutzbestimmungen muss zugestimmt werden!")</script>';
        $datenErr = true;
    }

    if (empty($name)) {
        echo '<script>alert("Es muss ein Name angegeben werden!")</script>';
        $nameErr = true;
    }

    if (empty($email)) {
        echo '<script>alert("Email muss angegeben werden!")</script>';
        $emailErr = true;
    } else {
        if (!filter_var($email, FILTER_VALIDATE_EMAIL) || strpos($email, "rcpt.at") || strpos($email, "damnthespam.at") || strpos($email, "wegwerfmail.de") || strpos($email, "trashmail.")) {
            echo '<script>alert("Ungültiges Email-Format!")</script>';
            $emailErr = true;
        }
    }

    if (!$datenErr && !$nameErr && !$emailErr) {

        $file = fopen('Newsletteranmeldungen.txt', 'a');
        if (!$file) {
            die ('Datei konnte nicht geöffnet werden');
        }
        $line = $name . "," . $email . "," . $_POST['newslettersprache'] . "\n";
        fwrite($file, $line);

        fclose($file);


        echo '<script>alert("Anmeldung erfolgreich gespeichert!")</script>';

    }


}