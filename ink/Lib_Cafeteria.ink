===InTheCoffeeShop===
# CLEAR
In der Cafeteria # CLASS: chapter
# IMAGE: images/i6_coffee.png
{
    - not TheAssignments.ListOfChallenges:
        -> AfterClass
    - LibraryCard and not LibIntro:
        -> Libraries.Lib1
    - else:
        -> Fallback
}

=AfterClass

"Na, das war ja ein Semesterbeginn!", denkst du und fragst dich, ob alle Profs so sind?
Du holst dir einen Kaffee und setzt dich draußen auf eine Bank.
"Hat er etwa recht damit, das Studierende nicht mehr genug lesen?" -- Ach Quatsch, was soll an Bibliotheken schon so schwierig sein? Die Aufgaben hast du sicherlich schnell erledigt. Vielleicht versuchst du schon heute möglichst alle Aufgaben zu lösen? Dann hast du den Rest der Woche frei. Oder doch lieber noch eine Tasse Kaffee?
-> Fallback

=Fallback
Mit einem Kaffee in der Hand, sieht der Tag gleich anders aus.
+ Du holst das Aufgabenblatt aus der Tasche heraus. 
~MinutesLeft = MinutesLeft - 10
-> TheAssignments.ListOfChallenges
+ Du nimmst noch einen Kaffee.
    ~MinutesLeft = MinutesLeft - 20
    Das Prokrastinieren bringt ja eh nichts. Du musst die Aufgaben noch machen! 
    <> <em>"Eat that frog!"</em>
    ++ Reichlich koffeiniert aber etwas widerwillig kramst du den Aufgabenzettel heraus. 
-> TheAssignments.ListOfChallenges

===Libraries===
= Lib1
//wenn libraryCard = true und LibIntro = false, dann hier Online-Tutorial machen; wenn Online-Tutorial erfolgreich, dann libIntro = True und Challenge_1 = True

Du holst dir noch schnell einen Kaffee und beschließt, das Online-Tutorial zur Bibliothekseinführung zu machen. Dann hast du das hinter dir und kannst die Aufgabe abhaken.
~MinutesLeft = MinutesLeft - 40
~LibIntro = true
~Challenge_1 = true
~AssignmentsCompleted +=1
Als du fertig bist schaust du auf die Uhr: Du hast noch {MinutesLeft} Minuten Zeit, aber keine Lust mehr, heute noch was anderes für das Seminar zu machen. Du holst dir erst noch einen Kaffee, bevor du dich wieder auf den Weg machst. 
    -> TheChallenges.Successful

=Lib4
Kaffee ist immer eine gute Idee. Mit dem Kaffee in der Hand suchst du dir einen Platz am Fenster.
Du bist frustriert. Die blöde Bibliothek macht erst wieder am Montag um 10 Uhr auf. Während du überlegst, was du jetzt machen kannst -- oder solltest du einfach nicht mehr in das Seminar gehen? -- hörst du, wie sich am Nebentisch zwei unterhalten.
"Das Buch kann man in unserer Bibliothek nicht ausleihen. Aber in der UB gibt es das Buch nochmal und da hab ich es mir ausgeliehen."
Das bringt dich auf eine Idee. Du könntest in der UB schauen, ob sie das Buch von Otto dort vielleicht auch haben. Dann warst du zwar nicht in der Bibliothek Religionswissenschaften, aber solange du das Buch hast, kann das dem Prof ja egal sein, oder?
* Du gehst in die UB, um den "Otto" zu suchen.
    -> MainLibraryRelStud
* Du glaubst nicht daran, dass Buch dort zu finden.
    -> TheEnd.BonVoyage

