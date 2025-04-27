// English Studies library

=== ToTheEngStudLib ===   
Bibliothek Anglistik # CLASS: subchapter

//TEST: time left 5a: {MinutesLeft}

Du gehst aus dem Seminarraum hinaus und überlegst: "Wo könnte die Bibliothek der Anglistik/Amerikanistik sein?" Du drehst dich um.

# IMAGE: images/i4_engl.png

* Du fragst einen Studi, der gerade über den Flur geht.
    "Die Englisch-Bibliothek? Keine Ahnung. Die Anglistik ist drüben in den Türmen. Bestimmt ist die Bibliothek da auch."
    -> ToTheEngStudLib.WrongWay
* Du wendest dich einer kleinen Gruppe von Studis zu, die neben dir stehen.
    "Könnt Ihr mir sagen, wo ich die Bibliothek der Anglistik/Amerikanistik finde?"
    "Ja, also eigentlich nein. Denn die gibt es gar nicht mehr. Die war früher in den Türmen, wo auch die Anglistik ist. Dann ist sie mit in die UB gezogen. Dort findest du die Bücher."
    -> ToTheEngStudLib.MainLibrary
    
= WrongWay
~MinutesLeft -= TravelTime_Lib5
Du gehst rüber zu den Türmen. Über die Lahnbrücke, an der Mensa vorbei, den langen Hermann-Cohen-Weg entlang, bis du vor der PhilFak, den Türmen, stehst. "Hübsch hier," denkst du. "Studieren direkt zwischen Autobahn und Bahngleisen. Muss man auch erstmal schaffen." In der PhilFak suchst du den Turm der Anglistik. Aber auf dem Stockwerksplan siehst du keinen Hinweis auf die Bibliothek. Da öffnet sich die Aufzugtür und heraus kommt jemand, der nicht aussieht, als könnte er ein Prof. sein: ein mittelalter Wuschelkopf mit Hoodie. "Oder ist er doch ein Prof?" Dir kommen Zweifel.
    * Du fragst ihn, ob er wisse, wo die Bibliothek ist.
        "Die Bibliothek ist in der UB. Dort können Sie die Bücher der Anglistik finden."
        -> MainLibrary
    * Einen Prof fragen? Auf keinen Fall!
        Du beschließt, jedes Stockwerk abzusuchen. Irgendwo muss ja die Bibliothek schließlich sein.
        Du findest schließlich eine Tür, über der "Bibliothek" steht. Als du näher kommst, siehst du das Schild, das an der Tür hängt. Auf dem Schild steht, dass die Bibliothek jetzt in der Unibibliothek zu finden ist.
            ~MinutesLeft -= 20
            Du schaust auf deine Uhr. Du hast noch {MinutesLeft} Minuten bis zur nächsten {~Veranstaltung|Vorlesung|Sitzung}.
  -   Du gehst also wieder zurück über die Lahn und zur Unibibliothek.
    -> MainLibrary

= MainLibrary
In der UB # CLASS: subchapter
//TEST: time left 5b: {MinutesLeft}
~MinutesLeft -= TravelTime_Lib5
 //TEST: time left 5c: {MinutesLeft}
~temp choice = 0
Dort angekommen 
* <>gehst du zum Übersichtsplan an der Treppe.
    ~MinutesLeft -= 5
    Dort siehst du,
* <>gehst du zur Informationstheke.
    ~MinutesLeft -= 5
    Die Bibliothekarin sagt dir,
 * <>gehst du die Treppe rauf.
    ~choice = 3
    ~MinutesLeft -= 10
    Auf jedem Stockwerk schaust du erneut auf den Stockwerksplan. 
    1. Stock: nichts!
    2. Stock: nichts!
    3. Stock: Bingo! 
    Du siehst, 
    
- <> dass die Anglistik/Amerikanistik-Bücher {choice == 3: hier im Teil| im 3. Stockwerk} West sind.
{choice == 3:
    Du gehst
    -else:
    Oben angekommen, gehst du
}
-> InTheEngStudLib
=== InTheEngStudLib ===
<> zum nächsten Katalog-PC. 
//Wenn Schulung, dann direkt weiter, wenn keine Schulung, dann Zeitabzug 30 min!
 {Challenge_1 == true: 
    "Zum Glück hab ich in der UB-Schulung gelernt, wie ich den Katalog benutzen kann. Das wird jetzt easy."
    -else: "Mist, hätte ich doch erst die Katalog-Schulung in der UB gemacht. Nun denn, dann muss ich mich hier selber zurecht finden..."
    Du suchst nach dem Titel:
    ~MinutesLeft -= 30
    }

-> AtTheCatalog

===AtTheCatalog===

//TEST: time left 5c2: {MinutesLeft}

"Kathleen Woodward: Statistical Panic". {~"Ah, hier ist er schon:"| "Na also. Gefunden:"|"Die Signatur sollte ich mir merken:"}
+ "001 HS 1070 H175 (2)" -> AnglWrong
+ "001 HU 1075 W911" -> AnglCorr
+ "011 HU 9800 M379 C319" -> AnglWrong
+ "003 HM 1070 W724" -> AnglWrong

//TEST: time left 5d: {MinutesLeft}

=AnglWrong
Hmm, hier ist das Buch nicht. Hast du dir etwa die falsche Signatur gemerkt? Du gehst nochmal zum Katalog-PC und suchst den Titel erneut.
~MinutesLeft -= 5
//TEST: time left 5e: {MinutesLeft}
-> AtTheCatalog
=AnglCorr
Du hast das Buch im Regal gefunden und leihst es gleich aus! 
//TEST: time left 5f: {MinutesLeft}
~Challenge_5 = true
~TodaysChallenge = true
~AssignmentsCompleted +=1
-> TheChallenges.Successful

// TODO: wenn die Zeit aufgebraucht ist, dann Challenge heute nicht geschafft, kann an einem anderen Tag gemacht werden (Anglistik auch am WoE!!)