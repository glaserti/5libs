//The Religious Studies Library

=== ToTheRelStudLib ===
# CLEAR
Bibliothek Religionswissenschaften # CLASS: subchapter

Du gehst den Schlossberg hinauf. Hinauf. Und noch höher, fast den ganzen Weg bis zum Schloss. Direkt unter dem Schloss ist ein altes Gebäude, in dem die Bibliothek Religionswissenschaften untergebracht ist. Während du nach der Tür greifst, siehst du ein Schild an der Tür:


Diese Woche ist die Bibliothek geöffnet: # CLASS: Highlight
Mo - Do, 10 Uhr - 15 Uhr # CLASS: Highlight

~MinutesLeft = MinutesLeft - TravelTime_Lib4
{DaysLeft > 3:
    + Du öffnest die Tür[.]
    <> und gehst die Wendeltreppe ganz hinauf. Als du oben ankommst, bist du völlig außer Atem.
    -> InTheRelStudLib 
- else: 
    + Genervt gehst du wieder den Schlossberg runter.
        Du hättest vorher auf den Bibliothekswebseiten nach den Öffnungszeiten gucken sollen! Jetzt hast du wertvolle Zeit vergeudet.
        ~MinutesLeft = MinutesLeft - TravelTime_Lib4
        "Jetzt ersteinmal einen Kaffee!" Wieder unten im Lahntal, gehst du in die Cafeteria.
        ++ Du öffnest die Tür zur Cafeteria.
            -> Libraries.Lib4
    }

=== InTheRelStudLib ===
Du betrittst eine kleine Bibliothek, die aber überraschend viele Räume hat, überraschend viele Bücher. Wie willst du hier das Buch von Rudolf Otto zum Heiligen finden?
# IMAGE: images/i3_rel.png
    + Du fragst die Bibliothekarin[.] nach dem Buch.
    "Oh ja," antwortet sie, "wir haben das Buch natürlich. Um ein Buch zu finden, brauchen Sie die Signatur. Wenn Sie die haben, können Sie in diesem Raum dort drüben das Buch finden." Die Signatur steht unten auf dem Buchrücken.
    Sie gibt im Katalog den Namen und Titel ein und schreibt dir die Signatur auf einen Zettel.
    + Du [siehst einen Computer und benutzt den Bibliothekskatalog.] findest die Signatur im Katalog.
    - Mit der Signatur in der Hand, gehst du durch die Bibliothek und suchst die Regale ab. 
    * Du findest das Buch im Regal. -> TheBook
    * Du findest das Buch nicht und fragst die Bibliothekarin noch einmal. -> TheHint
    
    = TheHint
    Die Bibliothekarin zeigt dir nocheinmal, in welchem Raum das Buch steht. Du gehst dort hin und entdeckst das Buch. -> TheBook
    
    = TheBook
    Schließlich ziehst du das Buch aus dem Regal heraus und gehst damit zur Bibliothekarin neben der Eingangstür.
        "Ich würde das Buch gerne für eine Woche ausleihen."
        "Oh verzeihen Sie, aber das geht nicht. Das Buch ist für einen Semesterapparat bestimmt. Das heißt, dass das Buch nur als Präsenzexemplar hier in der Bibliothek benutzt werden kann. Sie können es nicht mitnehmen."
        Das hast du nun nicht erwartet. Du hast immer gedacht, dass Bibliotheken Bücher ausleihen. Dass du das Buch in der Bibliothek lesen musst, ist irgendwie ... unerwartet.
        Aber das ist keine Option für dich. Die Aufgabe sagt ganz klar, dass du das Buch ausleihen sollst. 
        + Du fragst noch einmal, ob nicht eine Ausnahme möglich wäre...? -> TheAnswer
        + Ratlos drehst du dich um. ->PreAlternative
        
= TheAnswer
# CLEAR
        "Leider nein," antwortet sie. -> TheAlternative
=PreAlternative
# CLEAR
       ->TheAlternative 
= TheAlternative
"Aber Sie können", setzt die Bibliothekarin noch einmal ein, "im Katalog schauen, ob wir das Buch noch an einem anderen Standort, in einer anderen Bibliothek haben. Wenn es in der Unibibliothek ist, können Sie es auf jeden Fall ausleihen!"
         ~MinutesLeft -= 15 // time spent in the library
        Im Katalog siehst du, dass es das Buch tatsächlich dort gibt und dass es noch verfügbar ist.
        Du schaust auf deine Uhr: Du hast noch {MinutesLeft} Minuten Zeit. Aber du musst wieder den ganzen Berg hinunterlaufen bis zur Unibibliothek.
       ~ MinutesLeft = MinutesLeft - TravelTime_Lib4
        <> Und dann hast du nur noch {MinutesLeft} Minuten übrig.
    
    {
        - Challenge_1:
            -> RelToMainLibrary

        - Challenge_5:
            -> RelToMainLibrary

        - else:
            Du glaubst nicht, dass du ohne eine Bibliothekseinführung in der UB in nur {MinutesLeft} Minuten das Buch findest und herauskriegst, wie du es ausleihen kannst.
            + Du beschließt, diesen Tag abzuhaken. Vielleicht kannst du morgen kurz in der UB vorbei schauen, um das Buch zu holen.
                -> TheChallenges.Fail

    }

 = RelToMainLibrary   
Zum Glück warst du bereits in der UB und kennst dich dort aus. Dann sollten {MinutesLeft} Minuten ausreichen, um die Aufgabe abzuschließen.
+ Du gehst den Berg runter Richtung Unibibliothek
# CLEAR
In der Unibibliothek # CLASS: subchapter

    Zufrieden gehst du den Berg runter, um in der UB das Buch auszuleihen. 
    -> MainLibraryRelStud

===MainLibraryRelStud===
Du kommst in die Universitätsbibliothek und suchst gleich im Katalog nach dem Buch von Otto. Dort findest du die 5. Auflage von 2022.
~MinutesLeft -= 20
        -> RelCatalog

= RelCatalog
Du schreibst dir die Signatur auf und schaust im Lageplan, in welchem Geschoss das Buch steht:
    + "205 210 O H" -> RelWrong
    + "001 BE 2310 O91 (5)" -> RelCorr
    + "010 BH 4554 O34" -> RelWrong

    = RelWrong
    Du gehst zum Regal, aber findest das Buch nicht. Da hast du dir wohl die falsche Signatur rausgeschrieben. Du gehst zurück zum PC und suchst noch einmal nach dem Buch: "Rudolf Otto, Das Heilige, 5. Auflage von 2022".
    ~MinutesLeft -= 10
    -> RelCatalog
=RelCorr
Du findest das Buch von Rudolf Otto im Regal und leihst es dir aus. 
~MinutesLeft -= 10
~Challenge_4 = true
~TodaysChallenge = true
~AssignmentsCompleted +=1
-> TheChallenges.Successful
