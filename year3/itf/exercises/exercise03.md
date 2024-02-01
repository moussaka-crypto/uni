###  3.1 & 3.2

- `F4 FE 8F 8A`
  - `F4` = 1111 0100
- `00 01 01 00 04 1F 3F 19 3F 00 00 00 81 CC 00 00`

Hex-Zahl | Stelle | Beschreibung
:---: | :---: | ---
`00` | 0 | Bootable | Nicht bootable, da Wert 0 entspricht
`01 01 00` | 1 - 3 | CHS 1. Sektor | `0x 01 01 00` (LE) = `0x 00 01 01` (BE) = 257 (dez)
`04` | 4 | Typ | FAT 16
`1F 3F 19` | 5 - 7 | CHS letzter Sektor
`3F 00 00 00` | 8 - 11 | LBA-Start | `0x 3F 00 00 00` (LE) = `0x 00 00 00 3F` (BE) = 63 (dez als Nummer des 1. Sektors)
`81 CC 00 00` | 12 - 15 | Anzahl Sektoren | `0x 00 00 CC 81` (BE) = 52353 (dez als Anzahl der Sektoren)

Tabelle | Erster Sektor (LBA) | Letzter Sektor (LBA) | Anzahl Sektoren | Dateisystemtyp / Beschreibung
:---: | :---: | :---: | :---: | :---:
**Primär** | | | |
0 | 63 | 52415 | 52353 | 04 FAT16
1 | `0x 00 00 CC C0` (BE) = 52416 | 104831 | 52416 | 04 FAT16
2 | `0x 00 01 99 80` (BE) = 104832 | 157247 | 52416 | 04 FAT16
3 | `0x 00 02 66 40` (BE) = 157248 | 312479 | 155232 | 05 DOS Extended
**Erweitert 1** | | | |
0 | 63 (relativ zu Beginn der Partition) / 157311 | - | 52353 | 04 FAT16
1 | 52479 / 209727 | - | 52353 | 04 FAT16
2 | `0x 00 01 99 80` (BE) = 104832 / 262080 | - | 50400 | 05 DOS Extended
**Erweitert 2** | | | |
0 | 63 / 262143 | - | `0x C4 A1` (BE) = 50337 | 06 FAT16 > 32 MiB
1 | - | - | - | -
2 | - | - | - | -

###  3.3
####  3.3.1
- FAT16

####  3.3.2
- 8 Sektoren reserviert

####  3.3.3
- Sektoren
  - FAT 0 (8 - 31)
    - Bytes: 8 * 512 bis 32 * 512-1
  - FAT 1 (32 - 55)
    - Bytes: 32 * 512 bis 56 * 512-1

####  3.3.4
- Beide beginnen mit `F8 FF FF FF` (Einträge 0 und 1), darauffolgend 0

####  3.3.5
- `F8 FF`: Media Descriptor -> Festplatte
- `FF FF`: `EOF`-Marker
- Rest 0: FAT komplett gelöscht

####  3.3.6
- Root-Dir: Sektoren 56 - 87
  - Bytegrenzen 56 * 512 bis 88 * 512-1 (28.672 - 45.055)

####  3.3.7
- Dokubereich: Beginnend mit Root-Dir bei Byte 28.672
  - Cluster-Bereich dahinter mit Byte 45.056

####  3.3.8
- Cluster: 1024 Bytes, 2 Sektoren groß

####  3.3.9
- Cluster 2 besteht aus Sektoren: 88 und 89

####  3.3.10
- Cluster n (2 <= n <= 5973)
  - 2: 88, 89
  - 3: 90, 91
  - 4: 92, 93
  - 5: 94, 95
  - n: 84+2n, 85+2n

####  3.3.11
- Bytes: Cluster n: (84+2n) * 512

###  3.4
####  3.4.1
- `_RAG1.DAT`, `_RAG2.DAT`, `_ING.DAT`, `_ULT1.DAT`, `_IR1`

####  3.4.2
- Flag-Byte Nr. 11 -> `0x10` -> 0001 0000 -> Directory

####  3.4.3
- Zu `_IR1` gehörende Cluster:
  - `0x 0D 00` LE = `0x 00 0D` BE = 13
  - 13 Cluster = n = 13 (84 + 2n)
  - (84 + 2 * 13) * 512 = 56320 (Multiplikation ergibt Byte-Anzahl, sonst Sektor)

####  3.4.4
- `.`, `..`, `DIR2`, `MULT2.DAT`

####  3.4.5
- Start-Cluster: `0x 12 00` (LE) = `0x 00 12` (BE) = 18 (dez.)
- (84 + 2 * 18) * 512 = 61440 -> Byte der Startadresse
- Größe: `0x B3 06 00 00` (LE) = `0x 00 00 06 B3` (BE) = 1715 (dez.)
- Letztes Byte: 61440 + 1715 - 1 = 63154

####  3.4.6
- Block kopiert, Hash stimmt

####  3.4.7
- `DIR2` hat Startcluster: `0x 10 00` (LE) = `0x 00 10` (BE) = 16 (dez.)
- (84 + 2 * 16) * 512 = 59392
- `FRAG3.DAT` ist einzige Datei
- Cluster (Start): `0x 11 00` (LE) = `0x 00 11` (BE) = 17 (dez.)
  - (84 + 2 * 17) * 512 = 60416 (Start)
- Länge: `0x EB 07 00 00` (LE) = `0x 00 00 07 EB` (BE) = 2027 (dez.)
  - Letztes Byte: 60416 + 2027 - 1 = 62442
- Annahme: Alle Bytes zwischen 60416 und 62442 sind Bestandteil der Datei
  - In Wirklichkeit: Fragmentiert
    - Beispielsweise Teil von Cluster 17 und Ende von Cluster 25 anders verwendet

###  3.5
####  3.5.1
- `0x 00 02` (LE) = `0x 02 00` (BE) -> 512 Bytes

####  3.5.2
- Stimmt, zumindest wenn LE in BE umgewandelt wird

####  3.5.3
- Byte 13: `0x 02` = 2 dez Sektoren pro Cluster -- mit Aufgabe 1 -> 1024 Bytes pro Cluster

####  3.5.4
- MFT-Eintrags-Größe: `0x 01` -> 1 Cluster bzw. 1024 Bytes

####  3.5.5
- Index-Record-Größe: `0x 04` -> 4 Cluster oder 4096 Bytes

####  3.5.6
- MFT startet bei Byte: `0x D5 07 00 00 00 00 00 00` (LE) = `0x 00 00 00 00 00 00 07 D5` (BE) = 2005 dez (Cluster)
- Um Byte zu erhalten: Mit Clustergröße multiplizieren -> 2005 * 1024 = 2053120

###  3.6
####  3.6.1
- Stimmt

####  3.6.2
- Byte 20 - 21 des MFT-Headers -> `0x 38 00` (LE) = `0x 00 38` (BE) = 56 (dez.)

####  3.6.3
- Erstes Attribut
  - Byte 56 - 59 geben Typ an (relativ 0-3)
  - Typ: `0x 10 00 00 00` (LE) = `0x 00 00 00 10` (BE) = 16 (dez.) = `$STANDARD_INFORMATION`
  - Länge: `0x 60 00 00 00` (LE) = `0x 00 00 00 60` (BE) = 96 (dez.)
  - Non-resident-Flag: `0x 00` -> resident
  - Inhaltsgröße:  Byte 16 - 19 (bei resident) = `0x 48 00 00 00` (LE) = `0x 00 00 00 48` (BE) = 72 (dez.)
  - Startbyte Content: `0x 18 00` (LE) = 24 (dez.)
  - Inhalt des Attributs beginnt mit `A0 59` bei Byte 2053200
- Zweites Attribut
  - Beginnt 96 Bytes nach Beginn des Ersten
  - Typ: `0x 30 00 00 00` (LE) = 48 (dez.) -> `$FILE_NAME`
  - Länge: `0x 68 00 00 00` (LE) = 104 (dez.)
  - Non-resident-Flag: 0 -> resident
  - Inhaltsgröße: `0x 4A 00 00 00` (LE) = 74 (dez.)
  - Offset: `0x 18 00` (LE) = 24 (dez.)
  - Start: 2053296

####  3.6.4
- Typ: `0x 80 00 00 00` (LE) = 128 (dez.) -> `$DATA`
- Länge: `0x 50 00 00 00` (LE) = 80 (dez.)
- Non-resident-Flag: `0x 01` -> non-resident

####  3.6.5
- Erster logischer Cluster: `0x 00 00 00 00 00 00 00 00` (LE) = 0 (dez.)
- Letzter logischer Cluster: `0x 2F 00 00 00 00 00 00 00 00` (LE) = `0x 2F` (BE) = 47 (dez.)

####  3.6.6
- Offset zur Runlist: `0x 40 00` (LE) = 64 (dez., relativ zum Attributbeginn)
  - Beginnt also bei 2053440

####  3.6.7
- Runlist beginnt mit `0x 21 10 D5 07 | 21 20 C2 08 ...`
  - 1 Byte Run length
  - 2 Bytes Run offset
  - Erster Run
    - Länge: `0x 10` = 16 (dez.)
    - Offset: `0x D5 07` (LE) = `0x 07 D5` (BE) = 2005 (dez.)
  - Zweiter Run
    - Länge: `0x 20` = 32 (dez.)
    - Offset: `0x C2 08` (LE) = `0x 08 C2` (BE) = 2242 (dez.)

####  3.6.8
- 48 Cluster insgesamt (passt zu logischen Clustern aus Aufgabe 5)
  - Nächstes Byte: `00`

####  3.6.9
- Run 1 bei Cluster 2005 -> Clustergrõße 1024
  - 2005 * 1024 = 2053120 (logisch, da MFT-Eintrag für `$MFT` selbst war)
- Run 2 bei Cluster (2242 + 2005) = 4247
  - 4247 * 1024 = 4348928 -> Beginnt mit `FILE`

###  3.7
####  3.7.1
- `$INDEX_ROOT`-Attribut: Byte 2064640 (Zu erkennen an `90 00 00 00`)
- Attributadresse + Offset = Beginn des Inhalts
- 2064640 + 32 = 2064672
  - **Start + Länge - 1 = Ende**
  - 2065015

####  3.7.2
- Typ ist `0x 30 00 00 00` (LE) -> `0x 00 00 00 30` (BE) = 48 dez = `$FILE_NAME`

####  3.7.3
> Size of each index record in bytes / clusters

- Länge in Bytes: `0x 00 10 00 00` (LE) = `0x 00 00 10 00` (BE) = 16^3 = 4096
- Länge in Clustern: `04` je 1024 Bytes

####  3.7.4
- Offset: Erste 4 Bytes als Header (Adresse 2064688)
- `0x 00 00 00 10` (BE) = 16 (dez.)

####  3.7.5
- Ende der Einträge: (Bytes 4 - 7)
  - `0x 00 00 01 48` (BE) = 328 Bytes
  - Relativ zum Node Header: 2065015

####  3.7.6
- MFT-Eintrag: Die ersten 6 Bytes
- `0x 15 00 .. 00` (LE) = 25 (dez.)
- Länge des Index-Eintrags: `0x 00 60` (BE) = 96 (dez.)

####  3.7.7
- File Name-Attribut beginnt nach 16 Bytes (`0B` ...)
- Dateiname nach weiteren 66 Bytes: `$ObjId`

####  3.7.8
- Suche 25. Eintrag in `$MFT`
- 48 Cluster `$MFT`
- Zweiter Run beginnt bei MFT-Eintrag 16 (Byte 4348328)
- Ein Eintrag 1024 Bytes groß
- Eintrag: 4348228 + 9 * 1024 = 4358144
- Auch hier als Dateiname: `$ObjId`

