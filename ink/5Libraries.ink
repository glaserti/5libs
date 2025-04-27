INCLUDE Lib_1.ink
INCLUDE Lib_2.ink
INCLUDE Lib_3.ink
INCLUDE Lib_4.ink
INCLUDE Lib_5.ink
INCLUDE Lib_Cafeteria.ink
INCLUDE Appendix_1.ink
INCLUDE Lib_1-e.ink
INCLUDE Lib_2-e.ink
INCLUDE Lib_3-e.ink
INCLUDE Lib_4-e.ink
INCLUDE Lib_5-e.ink
INCLUDE Lib_Cafeteria-e.ink
INCLUDE 5Libraries-e.ink
INCLUDE AboutPage.ink



# Author: Timo Glaser
# IMAGE: images/academ.marpurg.jpg

+ Öffne das Buch
    -> FirstClass
+ Open the book
    -> FirstClass_E
+ About
    -> About

=== FirstClass ===
# CLEAR

# CLASS: chapter
{8-DaysLeft}. Kapitel: {Weekdays}, 10 Uhr (st) 
~MinutesLeft = Weekday_Minutes

Es war einmal... am ersten Tag des Semesters, einem {Weekdays}, gehst du in dein erstes Seminar. Der Professor soll ziemlich streng sein. Und fordernd. Sagen zumindest deine Mitbewohnerinnen.

    * "Ach was, ich lass mich doch nicht einschüchtern. Was soll schon passieren -- am ersten Tag des Semesters?"
        Pünktlich um 10ct, betritt der Professor den Raum und lässt einen dicken Stapel Papier und Bücher auf den Tisch fallen. Er blickt durch den Raum, sein Blick fällt auf dich und er fragt:
        "Waren Sie jemals in den Bibliotheken? Haben Sie jemals ein Buch oder einen Artikel gelesen?" -- "Ich meine: <em>überhaupt</em>?", fährt er fort.
        Du bist sehr verwirrt. Er kennt dich doch gar nicht!
        ** "Oh ja, ich hab schon zahlreiche Bücher gelesen!", antwortest du ihm, all deinen Mut zusammennehmend.
            "Gut für Sie," antwortet er dir. "Aber ich habe nicht Sie gemeint. Nicht Sie persönlich. Ich habe zu Ihnen allen gesprochen!"
        ** Du fühlst dich sehr unwohl und versuchst dich so weit es geht unter dem Tisch zu verstecken.
            "Ach, ich meine doch nicht Sie persönlich!", sagt er. Ich habe zu Ihnen allen gesprochen!"
        ** Nein, das hältst du nicht aus. Du springst auf und rennst aus dem Seminarraum.
           ->TheEnd.BonVoyage
    * "Ich such mir besser einen Platz hinten im Raum. Ich möchte ihm nicht unnötig auffallen. Zumindest noch nicht."
        Pünktlich um 10ct, betritt der Professor den Raum und lässt einen dicken Stapel Papier und Bücher auf den Tisch fallen. Er blickt durch den Raum, sein Blick fällt auf dich und er fragt:
        "Waren Sie jemals in den Bibliotheken? Haben Sie jemals ein Buch oder einen Artikel gelesen?" -- "Ich meine: <em>überhaupt</em>?", fährt er fort.
    
    - Ihr alle seid sehr verwirrt. Es ist immerhin erst der erste Tag des Semesters, die erste Seminarsitzung. Keiner hat den Mut, ihm auf seine Frage zu antworten.
# IMAGE: images/i0_prof.png
"Nun," fährt er fort, "ich habe bis gestern Nacht die Seminararbeiten des letzten Semesters bewertet -- sie sind unterirdisch. Es ist mehr als deutlich, dass Ihre Kommilitonen und Kommilitoninnen mehr Interesse daran hatten, sich gegenseitig kennenzulernen und die lokale Flüssiggastronomie zu unterstützen als an ihren Papern zu arbeiten."
"Ich hoffe, dieses Semester wird anders. Ich hoffe, Sie sind anders. Und um Sie dabei zu unterstützen, gebe ich Ihnen heute Ihre erste Aufgabe. Eine 'Challenge', wenn Sie wollen. Ich raten Ihnen, sie nicht auf die leichte Schulter zu nehmen. Sie sollten die Aufgabe erfolgreich meistern können. Verstehen Sie?!"
Keiner von euch wagt es auch nur zu atmen.

//-> HandingOutAssignments

//= HandingOutAssignments
Er greift zum Papierstapel und hält ihn hoch.
"Dies ist Ihre dieswöchige Challenge."
"Wenn Sie nächste Woche wieder in mein Seminar kommen wollen -- wenn! --, müssen Sie fünf Campus-Bibliotheken besuchen und in jeder eine Aufgabe erfüllen."
Er verteilt die Aufgabenzettel, oder "Challenge", wie er es gerne nennt.

* Du schaust dir gleich "die Challenge" an.
    -> TheChallengeStarts
* "Ich brauch ersteinmal einen Kaffee.", denkst du, und steckst den Aufgabenzettel in deine Tasche.
    ->InTheCoffeeShop
# CLEAR

= TheChallengeStarts

Du hältst das Aufgabenblatt in der Hand und bist irritiert.
"Es gibt wirklich so viele Uni-Bibliothek in Marburg? Aber... wo?"
Während du den Seminarraum verlässt, überfliegst du die Aufgaben und denkst, dass es nicht zu schwer sein sollte, die Bibliotheken zu finden und die Bücher zu kriegen. Vielleicht schaffst du ja alle Aufgaben heute?
Bevor {&dein nächster Unitermin|deine nächste Vorlesung|dein Seminar} anfängt, hast du noch {MinutesLeft/60} Stunden Zeit. Ob das wohl für alle Aufgaben reicht?
D.h., du hast eigentlich heute überhaupt nur {MinutesLeft/60} Stunden Zeit, um die Aufgabe anzugehen. Der Rest deines Tages ist vollgepackt -- wie die ganze Woche! Wenn keine Lehrveranstaltungen sind, hast du Termine in den Sprechstunden, in der Studienberatung, Kennenlern- und Socializing-Events, PubCrawls, Koch- und Filmabende. Die Fachschaft hat ein ganzes Wochenprogramm zusammengestellt.

- Also, wo geht es nun hin?
    * Du schaust dir den Aufgabenzettel an.
        -> TheAssignments.ListOfChallenges
    * Du gehst ersteinmal in die Cafeteria.
        Bist du dir sicher? Du solltest die Aufgaben lösen!
        ** Na gut!
            -> TheAssignments.ListOfChallenges
        ** Nein, ich brauche jetzt Kaffee!
            -> InTheCoffeeShop

=== nextDay ===
# CLEAR
{Weekdays == Sonntag:
    ~Weekdays = Montag
    -else:
    ~Weekdays ++
}
//~Weekdays ++
~DaysLeft -= 1
{DaysLeft > 2:
    ~MinutesLeft = Weekday_Minutes
- else:
    ~MinutesLeft = Weekend_Minutes
}

{8-DaysLeft}. Kapitel: {Weekdays}, {&11|13|9:45|12:30|10:30} Uhr # CLASS: chapter

{
    -DaysLeft < 1 and AssignmentsCompleted < 5:
        -> TheEnd.Incomplete
    -DaysLeft < 1 and AssignmentsCompleted == 5:
        -> TheEnd.Aurevoir
    -DaysLeft > 0 and AssignmentsCompleted == 5:
        -> TheEnd.Enjoy
    - else: 
        -> goOn
}

=goOn
Du hast noch {DaysLeft} {DaysLeft > 1: Tage|Tag} für die Aufgaben. Bislang hast du {AssignmentsCompleted} davon abgeschlossen.
<> {TodaysChallenge: 
    Du bist jedenfalls erleichert, dass du die gestrige Aufgabe geschafft hast.
- else:
    Du bist etwas demotiviert, dass du die gestrige Aufgabe nicht geschafft hast. Aber heute klappt es bestimmt. Du must dir nur überlegen, wann du die Aufgabe von gestern nachholst...
    Vielleicht findest du ja später noch Zeit!
}
~TodaysChallenge = false
//TEST: TodaysChallenge {TodaysChallenge}

{DaysLeft > 2:
    Bevor {&dein nächster Unitermin|deine nächste Vorlesung|dein Seminar} anfängt, hast du noch {MinutesLeft/60} Stunden Zeit.
    -else:
    In {MinutesLeft/60} Stunden {triffst du dich mit Freunden zum Kochen. Bis dahin solltest du fertig sein.|fängt dein Volleyballtraining an. Länger darfst du nicht brauchen.}
}
Also, wo geht es nun hin?
    + Du schaust dir den Aufgabenzettel an.
        -> TheAssignments.ListOfChallenges
    + Du gehst ersteinmal in die Cafeteria.
        Bist du dir sicher? Du solltest die Aufgaben lösen!
        ++ "Ich brauche Kaffee!"
            -> InTheCoffeeShop
        ++ Na gut!
            -> TheAssignments.ListOfChallenges


=== TheChallenges ===

= Successful
Geschafft (zumindest heute!) # CLASS: subchapter

//MinutesLeft < 0: Du hast heute länger gebraucht als geplant und kommst zu spät zu deinem nächsten Termin. {Leise schleichst du dich in die Vorlesung rein und hoffst, dass die Professorin es nicht merkt...|Da es nur ein Fachschaftstreffen ist, ist das aber nicht so schlimm.}

{MinutesLeft > 30:
{~Erleichtert darüber|Glücklich darüber|Zufrieden damit}, dass du die Aufgabe ohne Probleme lösen konntest, 
- else:
    {~Die Aufgabe war gar nicht so leicht.| Du hast länger gebraucht als gedacht.|"Das war knapp," denkst du.} Einmal durchatmen, und dann 
}
- <> gehst du {~zur Sprechstunde der Studienberatung|in deine nächste Vorlesung|zu deinem Seminar|zur Vorstellung der Fachschaft|zur Stadtralley der Fachschaft} und abends zum {~PubCrawl|Kinoabend|Grillen an der Lahn|Fachschaftsabend}.
Am Ende des Tages genießt du den Blick auf die Lahn und bist guter Dinge, {AssignmentsCompleted < 5: dass du auch die morgige Aufgabe lösen kannst.|dem Prof im Seminar gegenüberzutreten.}
//TEST: geschafft: {AssignmentsCompleted} Assignments
    + Auf ins nächste Kapitel.
    -> nextDay
    # CLEAR

= Fail
# CLEAR
Heute nicht! # CLASS: subchapter
Du bist etwas enttäuscht, dass du die heutige Challenge nicht gelöst hast. Aber hey, morgen ist auch noch ein Tag. Dann schaffst du das bestimmt. Du musst dir nur überlegen, wann du die Aufgabe nachholen kannst. Irgendwie muss es dir gelingen, Zeit freizuschaufeln... 
    + Auf ins nächste Kapitel
    -> nextDay
    # CLEAR

=== TheAssignments ===

= ListOfChallenges
# CLEAR
Die Aufgaben # CLASS: subchapter
Ihre Wochenaufgabe, ZU ERLEDIGEN BIS NÄCHSTE WOCHE! # CLASS: Highlight
Arbeiten Sie die folgenden Aufgaben durch. # CLASS: Highlight
    + {Challenge_1} Universitätsbibliothek 
        -> BeenHereDoneThat
    + {not Challenge_1} [Universitätsbibliothek] 
        -> Assignment_MainLibrary
    + {Challenge_2} Zentrale Medizinische Bibliothek
        -> BeenHereDoneThat
    + {not Challenge_2} [Zentrale Medizinische Bibliothek]
        ->Assignment_MedicalLibrary
 //   + Art History Library
    + {Challenge_4} Bibliothek Religionswissenschaften
        -> BeenHereDoneThat
    + {not Challenge_4} [Bibliothek Religionswissenschaften]
        -> Assignment_RelStudLib
    + {Challenge_5} Bibliothek Anglistik/Amerikanistik
        -> BeenHereDoneThat
    + {not Challenge_5} [Bibliothek Anglistik/Amerikanistik]
        -> Assignment_EngStudLib
 //   + Chemistry Library
    + {Challenge_7} Medienzentrum 
        -> BeenHereDoneThat
    + {not Challenge_7} [Medienzentrum] 
        -> Assignment_MediaCenter
    + {not Challenge_1 and LibraryCard} Du gehst erstmal in die Cafeteria. -> InTheCoffeeShop
    + {not Challenge_4 and InTheRelStudLib} Du musst noch in der UB nach dem Buch aus der Religionswissenschaft suchen! -> MainLibraryRelStud

= Assignment_MainLibrary
Universitätsbibliothek # CLASS: Highlight
"Suchen Sie die Universitätsbibliothek, beschaffen Sie sich dort einen Leseausweis und nehmen Sie an einer Bibliothekseinführung teil." # CLASS: Highlight
    + Du versuchst, diese Aufgabe zu lösen.
        -> ToTheMainLibrary
    + "Was sind denn die anderen Aufgaben?"
        -> TheAssignments.ListOfChallenges  

= Assignment_MedicalLibrary
Zentrale Medizinische Bibliothek # CLASS: Highlight
"Besuchen Sie die Zentrale Medizinische Bibliothek und leihen Sie sich folgendes Buch aus: 'B. Tillmann/B. Hirt, Präpkurs Anatomie, Berlin 2022'."# CLASS: Highlight
    + Du versuchst, diese Aufgabe zu lösen.
        -> ToTheMedicalLibrary.commuting
    + "Was sind denn die anderen Aufgaben?"
        -> TheAssignments.ListOfChallenges  
  

= Assignment_RelStudLib
Bibliothek Religionswissenschaften # CLASS: Highlight
"Finden Sie die Bibliothek Religionswissenschaften. Leihen Sie dort das Buch 'Rudolf Otto: Das Heilige' aus." # CLASS: Highlight
    + Du versuchst dich an dieser Aufgabe.
        -> ToTheRelStudLib
    + "Was sind denn die anderen Aufgaben?"
        -> TheAssignments.ListOfChallenges
 

= Assignment_EngStudLib
Bibliothek der Anglistik # CLASS: Highlight
"Finden Sie die Bibliothek der Anglistik. Leihen Sie das Buch "<em>Statistical Panic</em> von Kathleen Woodward aus." # CLASS: Highlight
    + Du versuchst, diese Aufgabe zu lösen.
        ->ToTheEngStudLib
    + "Was sind denn die anderen Aufgaben?"
        -> TheAssignments.ListOfChallenges
        
= Assignment_MediaCenter
Medienzentrum # CLASS: Highlight
"Suchen Sie das Medienzentrum und leihen dort eine Kamera aus." # CLASS: Highlight
    + Du versuchst, diese Aufgabe zu lösen.
        -> ToTheMediaCenter
    + "Was sind denn die anderen Aufgaben?"
        -> TheAssignments.ListOfChallenges

       

= BeenHereDoneThat
{~Du erinnerst dich, die Aufgabe hast du ja schon gelöst!|"Nein, da geh ich nicht nochmal hin!"|"Been there, done that!"|Dir fällt ein, dass du nicht so viel Zeit hast, um dir alles mehrfach anzuschauen.|"Schau dir doch lieber eine Aufgabe an, die du noch nicht gelöst hast," sagt dein schlechtes Gewissen.|"Challenge accepted, challenge completed!"|"Der Prof. findet es bestimmt nicht witzig, wenn ich die gleiche Aufgabe fünfmal löse."|Die Bibliothek kommt dir irgendwie bekannt vor... Kann es sein, dass du schon mal dort warst?}
+ Du schaust noch einmal auf den Aufgabenzettel.
    -> ListOfChallenges

=== TheEnd ===

=Incomplete
Du hast nur {AssignmentsCompleted} der Aufgaben geschafft, aber die Zeit ist abgelaufen. Unsicher was du machen sollst, machst du dich auf den Weg zum Seminar. Als du das Seminargebäude betrittst, zögerst du.
    + Nein, ich kann da nicht reingehen.
        -> BonVoyage
    + Du nimmst deinen Mut zusammen und gehst rein.
        -> WorkHarder


=Enjoy
Ein neuer Tag -- und nichts mehr zu tun. Nachdem du alle Bibliotheksaufgaben erfolgreich gelöst hast, beschließt du, den Rest des Wochenendes 
    * in der Bibliothek zu verbringen.
    * am Flussufer mit Freuden zu grillen.
    - -> Aurevoir

=WorkHarder
# CLEAR
Zurück im Seminar # CLASS: chapter

Es sind heute viel weniger Studierende da als letzte Woche. Ob sie die Aufgaben nicht geschafft haben? Oder haben sie einfach keine Lust auf das Seminar?
Was soll's, etwas nervös suchst du dir einen Platz, aber nicht zu weit vorne.
Als der Prof fragt, wer die Aufgaben geschafft und wer sie nicht geschafft hat, meldest du dich, und erzählst, dass du nicht fertig geworden bist.
Er hört sich an, weshalb du nicht alle Aufgaben gelöst hast und empfiehlt dir, dich noch etwas besser mit den Bibliotheken vertraut zu machen. Du solltest doch noch mal in eine Bibliothekseinführung gehen, dir die Online-Tutorials genauer anschauen und darauf achten, welche Schulungen die Bibliothek im Laufe des Semsters anbietet.
# IMAGE: images/i7_finis.png
\~:~ Ende ~:~ # CLASS: chapter
-> END

=Aurevoir
# CLEAR
Zurück im Seminar # CLASS: chapter

Am Montag machst du dich auf ins Seminar. Es sind heute viel weniger Studierende da als letzte Woche. Ob sie die Aufgaben nicht geschafft haben? Oder haben sie einfach keine Lust auf das Seminar?
Was soll's, du suchst dir einen Platz und bist guter Dinge.
Was immer der Prof heute mitbringt, was immer ihr für die nächste Woche an Aufgaben lösen sollt... Du bist dir sicher, dass du das schaffst.

# IMAGE: images/i7_finis.png

\~:~ Ende ~:~ # CLASS: chapter
->END


= BonVoyage
//Wenn zwei Challenges nicht erfüllt sind, auch hierhin.
# CLEAR

Das Ende # CLASS: chapter

Du rennst raus und hast dich entschieden!

~Weekdays = Weekdays + 1
Du brichst dein Studium ab und nimmst den nächsten Zug nach Amsterdam. Am folgenden Tag, einem {Weekdays}, erreichst du den Hafen und heuerst auf einem Container-Schiff an.
Du fährst über die Sieben Weltmeere bis der Kraken das Schiff und dich in die Tiefen hinabzieht.

# IMAGE: images/i7_kraken.png

\~:~ Ende ~:~ # CLASS: chapter

+ Versuch es erneut!
    # RESTART
-> END

