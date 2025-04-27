//MediaCenter
//TODO: MEDIAFAIL NICHT ERREICHT: AUCH AM WOE IST JMD. IM MZ UND GIBT DIE KAMERA AUS

=== ToTheMediaCenter ===
Medienzentrum # CLASS: subchapter

~MinutesLeft -= TravelTime_Lib7 // Update time variable
//TEST: time left 7a: {MinutesLeft}

Du hast keine Ahnung, wo das Medienzentrum sein könnte...
Glücklicherweise erinnerst du dich an ein altes Internet-Meme aus Schultagen:
<span class="meme">"When in doubt -- ask a librarian!"</span>
Du machst dich also auf in die UB.

Als du in die UB kommst, gehst du gleich zur Information und fragst, wo das Medienzentrum sei. 
Du hast Glück!--Das Medienzentrum ist in der UB!
Sie schicken dich in den ersten Stock.

# IMAGE: images/i5_media.png

* Du gehst die Treppe hoch und dann links ins Medienzentrum.
    -> InTheMediaCenter
* Du hältst einen Moment inne...
    -> ToTheMediaCenter.ReferenceDesk
    
= ReferenceDesk
# CLEAR
    ~MinutesLeft -= 20 // Update time variable
    //TEST: time left 7c: {MinutesLeft}

    "Ich soll dort eine Kamera ausleihen," erklärst du.

// Bedingung: Wenn Wochentag nicht WoE:
{DaysLeft > 2:
"Ja, das können Sie dort. Gehen Sie hoch und dort finden Sie eine Infotheke. Dort wird Ihnen erklärt, welche Geräte wir haben und wie Sie sie ausleihen können."
"Die Informationen finden Sie aber auch hier auf der Webseite des Medienzentrums. Dort ist auch das Onlineformular, mit dem Sie die Kamera ausleihen können." "Vielen Dank."

    + Du gehst die Treppe hoch und dann links ins Medienzentrum.
     -> InTheMediaCenter
    + [Du gehst zu einem der PCs.]
     -> ToTheMediaCenter.AtThePC
}
// Es ist WoE
{DaysLeft < 3:
"Leider ist die Geräteausleihe im Medienzentrum am Wochenende nicht geöffnet. Aber Sie finden alle Informationen auch hier auf der Webseite des Medienzentrums. Dort ist auch das Onlineformular, mit dem Sie die Kamera ausleihen können."
   + [Du gehst zu einem der PCs.]
    -> ToTheMediaCenter.AtThePC
}
= AtThePC
# CLEAR
~MinutesLeft -= 40 // Update time variable
//TEST: time left 7d: {MinutesLeft}

Du gehst zu einem der Computer, öffnest die Webseite des Medienzentrums und liest die Informationen, wie die Ausleihe funktioniert. 
//TEST: days left: {DaysLeft}; Ucard: {LibraryCard}

{DaysLeft > 3: -> BeforeFriday}
{DaysLeft < 4: -> AfterThursday}
=BeforeFriday
// before Friday
{not LibraryCard:
Du hast keinen Leseausweis.
   + Du gehst zurück zur Information
    -> InTheMainLibrary.InfoDesk
}
{LibraryCard:
Da du deinen Leseausweis hast, kannst du das Leihformular ausfüllen und abschicken. Auf der Webseite des Medienzentrums siehst du, was es dort noch alles gibt: Ein Film- und ein Tonraum. "Hm, vielleicht kann ich ja mal ein Referat als Video aufnehmen?" überlegst du. "Was sich wohl hinter dem GameLab verbirgt? Da sollte ich auch mal hingehen." Während du noch auf den Seiten bist, siehst du, dass du eine neue Mail hast. Eine Bestätigungsmail vom Medienzentrum. Du kannst die Kamera am Freitag abholen.
    -> MediaCenterEpilogue.MediaSuccess
}
=AfterThursday
// on Friday or weekend
{DaysLeft < 4:
Dann zuckst du zusammen. Dort steht, dass es normalerweise drei Tage dauert, bis das Gerät bereitgestellt ist. Du wirst die Kamera also am nächsten Montag nicht abholen können...
"Ist doch alles blöd!", denkst du.
//TEST: days left: {DaysLeft}; Ucard: {LibraryCard}

//not Weekend
{DaysLeft > 2:
+ Du hast keine Lust mehr und gibst auf.
    -> MediaCenterEpilogue.MediaFail
+ Du versuchst dein Glück im Medienzentrum und gehst nach oben.
    -> InTheMediaCenter
}
}

// on weekend
{DaysLeft < 3:
"Mist Wochenende!", rufst du aus. Die anderen Leute in der Bibliothek drehen sich nach dir um. Einer, der am PC hinter dir sitzt, hisst dich sogar an: "Schhht!"
-> MediaCenterEpilogue.MediaFail
}

=== InTheMediaCenter ===
# CLEAR
~MinutesLeft -= 30 // Update time variable
//TEST: time left 7e: {MinutesLeft}

Du siehst hier einen großen PC-Pool, Arbeitskabinen und Gruppenarbeitsräume. Rechts von dir ist eine Informationstheke. 

{DaysLeft < 3:
Aber dort sitzt niemand. Du schaust dich um, weit und breit kein Mitarbeiter zu sehen. Am Wochenende scheint das Medienzentrum nicht besetzt zu sein.
-> MediaCenterEpilogue.MediaFail
}

Du gehst hin und erklärst, was du suchst.
Die Mitarbeiterin greift zum Telefon und versucht den Medientechniker anzurufen. Glücklicherweise ist er in seinem Büro und du kannst zu ihm gehen. Er erklärt dir, welche Kameras da sind, was du mit ihnen machen kannst und dann füllt er für dich das Leihformular aus.
//TEST: {InTheMainLibrary.InfoDesk}
//TEST: {LibraryCard}
{ LibraryCard:
Weil du deinen Leseausweis bereits hast, gibt er dir die Kamera gleich mit. ("Ausnahmsweise", sagt er. Normalerweise muss man die Geräte drei Tage im Voraus buchen...)
-> InTheMediaCenter.MediaServices
}

{ not LibraryCard:
Du hast keinen Leseausweis und musst erst runter zur Information im Erdgeschoss gehen, um deinen Leseausweis ausstellen zu lassen.
-> InTheMainLibrary.InfoDesk
}

= MCwithLibraryCard
# CLEAR
Nachdem du das gemacht hast, kommst du wieder hoch und leihst die Kamera aus. ("Ausnahmsweise", sagt er. Normalerweise muss man die Geräte drei Tage im Voraus buchen...)
~MinutesLeft -= 10
-> InTheMediaCenter.MediaServices

= MediaServices
Während er dir die Kamera gibt, erzählt er dir, dass es im Medienzentrum auch noch einen Ton- und Filmraum gibt, falls du mal vor einem Greenscreen ein Video drehen möchtest oder einen Podcast aufnehmen möchtest. Außerdem gibt es noch ein GamingLab und Möglichkeiten, VR/AR und 3D-Scannen und Drucken auszuprobieren.
-> MediaCenterEpilogue.MediaSuccess


//-> MediaCenterEpilogue.MediaSuccess

=== MediaCenterEpilogue ===

= MediaSuccess
//TEST: time left: {MinutesLeft}
~Challenge_7 = true
~TodaysChallenge = true
~AssignmentsCompleted +=1
-> TheChallenges.Successful

= MediaFail
Diese Aufgabe hast du heute nicht lösen können. Am Wochenende wirst du also auch nicht mehr an die Kamera kommen. Es lohnt sich gar nicht erst, am Montag zurück ins Seminar zu gehen.
->TheEnd.Incomplete
