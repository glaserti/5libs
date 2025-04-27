// The Main Library

=== ToTheMainLibrary ===
Universitätsbibliothek # CLASS: subchapter

Du machst dich auf den Weg zur Universitätsbibliothek. Als du dort ankommst, gehst du direkt zur Informationstheke.
~MinutesLeft = MinutesLeft - TravelTime_Lib1
-> InTheMainLibrary

=== InTheMainLibrary ===

= InfoDesk
Der Bibliothekar an der Informationstheke fragt dich, ob du einen Leseausweis möchtest.

# IMAGE: images/i1_lib.png
    +\ {~"Jetzt nicht."|"Ich bin hier falsch", sagst du verlegen.|"Ähm nein. Ich wollte nur mal gucken."}
    Du gehst wieder zurück.
    ~MinutesLeft = MinutesLeft - 10
    -> ExitLibrary
    * "Gerne, ja!"
    Der Bibliothekar erklärt dir, was er alles von dir braucht, um einen Leseausweis auszustellen. Du gibst ihm alles und hältst kurz darauf deinen Leseausweis in der Hand. Er erklärt dir, dass die Ziffern auf der Rückseite der Ucard deine Leseausweisnummer und dass dein Geburtsdatum dein Passwort ist.
    "Sie sollten das Passwort auf jeden Fall noch ändern!", sagt er.
    "Ok."
    "Außerdem sollten Sie noch eine Bibliothekseinführung besuchen, damit Sie wissen, wie Sie im Katalog Bücher finden, wo die Bücher in der Bibliothek stehen und wie Sie sie ausleihen können."
    "Danke, das mache ich, sobald ich Zeit dafür habe."
    ~LibraryCard = true
    ~MinutesLeft = MinutesLeft - 30
    <> Du schielst auf deine Uhr. Du hast noch {MinutesLeft} Minuten Zeit.
    ** Du fragst nach, was es für Schulungen gibt. -> LibraryIntroduction
    ** Du gehst aus der UB raus. -> ExitLibrary
    ** {InTheMediaCenter and not Challenge_7} Du gehst zurück ins Medienzentrum -> InTheMediaCenter.MCwithLibraryCard
    ** {ToTheMediaCenter.AtThePC and not Challenge_7 and not InTheMediaCenter} Du gehst zurück zum PC -> ToTheMediaCenter.BeforeFriday
    * {LibraryCard} "Einen Ausweis hab ich schon, aber was gibt es für UB-Schulungen?"
    -> LibraryIntroduction
    
    = LibraryIntroduction
    Wir haben verschiedene Einführungen in die UB und die Katalogbenutzung. Sie können an einer allgemeinen Schulung teilnehmen, in der Sie die Benutzung der verschiedenen Bibliotheken kennenlernen. 
    Sie können auch eine spezielle Rechercheschulung besuchen. Dann lernen Sie, wie Sie mit dem Bibliothekskatalog und anderen Datenbanken Literatur finden können.
    Die Termine finden Sie auf der Webseite der UB und auf den Aushängen.
    Wenn Sie es ganz eilig haben und nicht zu einer der Schulungen gehen können, haben wir auch noch Online-Lernmodule. Die finden Sie auch über unsere Webseite und auf Ilias.
    ~MinutesLeft = MinutesLeft - 20

     {MinutesLeft > 40: 
    Du entscheidest dich dafür, in die Cafeteria zu gehen, dir die Lernmodule anzuschauen und dich ersteinmal damit in der UB zurechtzufinden. Vielleicht reicht das ja auch schon aus!
    ~MinutesLeft = MinutesLeft - 40
    ~LibIntro = true
    ~Challenge_1 = true
    ~TodaysChallenge = true
    ~AssignmentsCompleted +=1
    //TEST: time left 2c: {MinutesLeft}
    ->TheChallenges.Successful
    -else: Du hast heute nicht mehr genug Zeit, um die Aufgabe abzuschließen, nur noch {MinutesLeft} Minuten. Aber wenn du das nächste Mal in der Cafeteria bist, kannst du das Online-Tutorial ja durcharbeiten.
    * Du gehst aus der UB.
    ->TheChallenges.Fail
    }
 
    
=== ExitLibrary ===
Nun stehst du vor der Unibibliothek und überlegst, was du als nächstes machen könntest.
    + Du gehst wieder in die UB rein und zur Informationstheke. 
    ~MinutesLeft = MinutesLeft - 10
    -> InTheMainLibrary.InfoDesk
    + {InTheRelStudLib and not Challenge_4} Du erinnerst dich daran, dass du noch das Buch aus der Religionswissenschaft suchst.
    -> MainLibraryRelStud
    + Du schaust dir die anderen Aufgaben an.
    -> TheAssignments.ListOfChallenges
