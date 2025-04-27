//MainMedicalLibrary
// Zeit: 120 min. Weg = 40; 

=== ToTheMedicalLibrary ===
Zentrale Medizinische Bibliothek # CLASS: subchapter
Du sollst also heute zur "Zentralen Medizinischen Bibliothek gehen." -> commuting
=commuting
~ temp location = 0 // 1 = true, 2 = false, 3 = false
//TEST: time left 2: {MinutesLeft}
{location == 3: Du schaust nochmal auf der UB-Seite bei den "Standorten" nach:|Du nimmst deinen Laptop und gehst zur Webseite der UB. Dort findest du eine Seite "Über uns" und da die Seite "Standorte". Hier solltest du doch die Adresse der Bibliothek rauskriegen.}
    * Conradistraße 3a
        Du schaust in Maps nach, wo du nun hin musst.
        ~location = 1
    * Universitätsstraße 6
        "Das ist ja gar nicht so weit weg," denkst du. Du packst deinen Rucksack und gehst los. Anstatt den Bus zu nehmen, beschließt du, hinzulaufen. Es regnet ja gerade nicht.
        ~location = 3
        ~MinutesLeft -= 10 
        Nach einigen Minuten kommst du zur Adresse und bleibst zögernd stehen: Da steht "Fachbereich Rechtswissenschaften". "Das kann doch nicht richtig sein," denkst du dir. 
        ->commuting
    * Hans-Meerwein-Str. 6
        ~location = 2
    - {~An der Bushaltestelle angekommen, wartest du auf den nächsten Bus.|Du setzt dich an die Bushaltestelle und wartest.}
    + Der Bus kommt und du steigst ein.
        
    + [Du redest an der Bushaltestelle mit jemandem aus deinem Seminar und nimmst den nächsten Bus.] Als der nächste Bus kommt, verabschiedest du dich und steigst ein. 
        ~MinutesLeft -=10
    + [Du hast gerade Lust auf ein Eis und läufst schnell zur Eisdiele rüber.] Nachdem du das Eis gegessen hast, steigst du in den nächsten Bus ein.
        ~MinutesLeft -=20

    - ~MinutesLeft -= TravelTime_Lib2 // Update time variable
    //TEST: time left 2c: {MinutesLeft}
    
    Nach einer Ewigkeit kommst du endlich auf den Lahnbergen an.
    {location == 1: -> InTheMedicalLibrary|->WrongLibrary}
    =WrongLibrary
    Du gehst den Weg zwischen den neueren und älteren Hochhäusern entlang und bleibst schließlich vor der notierten Adresse stehen. Du stellst fest, dass du dir die falsche Adresse aufgeschrieben hast. Hier ist nicht die Medizin, sondern die Chemie.
    + Du fragst jemanden, die gerade aus dem Gebäude herauskommt, wo die Zentrale Medizinische Bibliothek ist.
    + Du holst dein Telefon aus der Tasche und schaust nochmal auf der UB-Seite nach der Adresse der ZMB.
        ~MinutesLeft -=10
        

    - # CLEAR
    Immerhin bist du grundsätzlich richtig hier auf den Lahnbergen. Du gehst über die Brücke und stehst dann endlich vor dem Glasfoyer der ZMB!
    ~MinutesLeft -= 10 // Update time variable
    //TEST: time left 2d: {MinutesLeft}
    ->InTheMedicalLibrary
    
=== InTheMedicalLibrary ===
An der Tür siehst du die Öffnungszeiten der Bibliothek und bist erfreut darüber, dass die Bibliothek abends so lange und sogar am Wochenende auf hat. Wenn du es jetzt nicht mehr schaffst, kannst du heute abend nochmal her kommen, um die Aufgabe zu lösen.
Du schaust auf deine Uhr. Du hast noch {MinutesLeft} Minuten Zeit. 
//TEST: {DaysLeft} Tage übrig.

{DaysLeft < 3: //Weekend
    Da fällt dir ein, dass ja Wochenende ist und du keine Unitermine hast. Du kannst also in aller Ruhe in die Bibliothek gehen, um die Aufgabe zu lösen. -> AtTheDesk
    - else:
    { MinutesLeft > 50:     
        <> Das reicht vielleicht noch. Du gehst hinein. 
            ->AtTheDesk
        -else: 
        <> Das ist zuwenig. Du musst dich jetzt beeilen, wieder ins Lahntal zurück zu kommen, um rechzeitig in der Vorlesung zu sein. 
        + Du läufst schnell zum Bus und beschließt, am Abend wieder herzukommen.
            -> BackAtNight
        }
    }
    
    
= BackAtNight
# CLEAR
Nachdem dein Unitag vorbei ist, setzt du dich wieder in den Bus und fährst -- nocheinmal -- auf die Lahnberge. Du bist froh, dass du nicht regelmäßig hier rauf musst. Das dauert immer so lange...
Vor der Tür schaust du auf deine Uhr. 
20:10h # CLASS: Highlight
"Fünfzig Minuten sollten doch reichen, um das Buch zu finden und auszuleihen," denkst du dir und gehst hinein.
-> AtTheDesk

= AtTheDesk

# IMAGE: images/i2_med.png
In der Bibliothek schaust du dich zunächst um und gehst dann an die Infotheke. Dort fragst du, wo du das Buch finden kannst:
    * B. Tillmann/B. Hirt, Präpkurs Anatomie, Berlin 2022.
        
    * R. Otto, Das Heilige, Berlin 2022
        "Das Buch haben wir hier nicht. Da müssen Sie in die Bibliothek Theologie oder Religionswissenschaften gehen. Oder in die Universitätsbibliothek."
        Du schaust noch mal auf deinen Zettel. Du bist in der Zeile verrutscht. Du meinst natürlich:
        ** B. Tillmann/B. Hirt, Präpkurs Anatomie, Berlin 2022.
    
    - # CLEAR
    Die Bibliothekarin erklärt dir, dass du im Bibliothekskatalog nach dem Buch suchen kannst. Sie gibt den Titel im Katalog ein und zeigt dir, dass du den Titel im 1. OG finden könntest. Aber leider ist das Buch gerade ausgeliehen.
    Du schaust ungläubig auf den Bildschirm. Sollte der Prof. euch wirklich als Aufgabe gegeben haben, ein Buch auszuleihen, das es nur einmal in Marburg gibt? Das kann doch nicht sein.
    Du greifst nach der Maus und gehst von der Titelanzeige nochmal zurück auf die Ergebnisliste. 
    "Das Buch ist ja doch zweimal da!", entfährt es dir. "Was heißt denn dieses "Volltext" da?"
    "Das heißt, dass wir das Buch als eBook in Marburg haben. Mit Ihrem HRZ-Account können Sie elektronische Medien -- also eBooks, elektronische Zeitschriften oder Datenbanken -- von jedem PC aus aufrufen."
        * "Also von den Uni-PCs?"
        * "Auch mit meinem eigenen Rechner?"
        
    - # CLEAR
    
    "Ja, von den PCs, die hier in der Uni in den PC-Pools sind. Aber auch von jedem anderen Computer. Hier auf den UB-Seiten finden Sie Informationen zum "Externen Online-Zugriff".
    "Das wichtigste ist aber: Wenn Sie die eMedien aus dem KatalogPlus heraus aufrufen, dann wird automatisch eine Verbindung über das HRZ aufgebaut. Und das einzige, was Sie in das Formular eingeben müssen, ist..."
        * "Meine Leseausweisnummer und das Passwort."
            "Nein, Sie brauchen keinen Leseausweis für die eMedien." 
            ** "Dann meinen Uni-Account-Benutzernamen?"
        * Meinen Uni-Account-Benutzernamen und das Passwort.
        # CLEAR
        - "Genau, für die eMedien brauchen Sie nicht Ihren Leseausweis, sondern Ihren Uni- oder HRZ-Account."
        "Wenn Sie das eingegeben haben, werden Sie normalerweise direkt zum eBook auf der Webseite des Verlags weitergeleitet und können dann das Buch am Bildschirm lesen oder einzelne Kapitel als PDF-Dateien ausdrucken oder herunterladen."
        Du bist erleichtert, dass du doch noch an das Buch kommst und diese Aufgabe gelöst hast.
        ~Challenge_2 = true
        ~TodaysChallenge = true
        ~AssignmentsCompleted +=1
        ~MinutesLeft -= 30
//TEST: time left 2e: {MinutesLeft}
-> TheChallenges.Successful

