<?php
$link = mysqli_connect(
    "localhost",
    "root",
    "root",
    "emensawerbeseite",
    4200
);

if (!$link){
    echo "Verbindung fehlgeschlagen: ", mysqli_connect_errno();
    exit();
}


$sql = "SELECT erfasst_am FROM gericht";
$result = mysqli_query($link, $sql);



echo '<table> <tr><th>erfasst_am</th></tr>';
while ($row = mysqli_fetch_row($result)){
    echo '<tr><td>' . $row[0] . '</td></tr>';
}
echo ' </table>';

// SELECT name FROM gericht WHERE name LIKE 'K%';



