// English Studies Library

=== ToTheEngStudLib_E ===   
Library of English Studies # CLASS: subchapter

//TEST: time left 5a: {MinutesLeft}

You step out of the seminar room and ponder, "Where could the English/American Studies library be?" You turn around.

# IMAGE: images/i4_engl.png

* You ask a student who is just walking down the hallway.
    "The English library? No idea. English Studies is over in the towers. The library is probably there too."
    -> ToTheEngStudLib_E.WrongWay_E
* You approach a small group of students standing next to you.
    "Can you tell me where to find the English/American Studies library?"
    "Yes, well, actually no. It doesn't exist anymore. It used to be in the towers, where English Studies is. Then it was moved into the main library. You'll find the books there."
    -> ToTheEngStudLib_E.MainLibrary_E
    
= WrongWay_E
~MinutesLeft -= TravelTime_Lib5
You head over to the towers. Across the Lahn bridge, past the cafeteria, along the long Hermann-Cohen-Weg, until you stand in front of the PhilFak, the towers. "Nice here," you think. "Studying right between the highway and the railroad tracks. Quite an achievement." In the PhilFak, you search for the English Studies tower. But on the floor plan, you see no sign of the library. Then the elevator door opens, and out steps someone who doesn’t look like a professor: a middle-aged person with a mop of curly hair and a hoodie. "Or is he a professor?" You start to doubt.
    * You ask him if he knows where the library is.
        "The library is in the main library. You can find the English Studies books there."
        -> MainLibrary_E
    * Ask a professor? No way!
        You decide to search every floor. The library must be somewhere.
        You finally find a door labeled "Library." As you get closer, you see a sign hanging on the door. The sign says that the library is now located in the main library.
            ~MinutesLeft -= 20
            You check your watch. You have {MinutesLeft} minutes left until your next {~class|lecture|session}.
  -   So, you head back across the Lahn to the main library.
    -> MainLibrary_E

= MainLibrary_E
In the main library # CLASS: subchapter
//TEST: time left 5b: {MinutesLeft}
~MinutesLeft -= TravelTime_Lib5
 //TEST: time left 5c: {MinutesLeft}
~temp choice = 0
Once there
* <>you go to the floor plan by the stairs.
    ~MinutesLeft -= 5 
    There you see
* <>you go to the help desk.
    ~MinutesLeft -= 5
    The librarian tells you
* <>you go up the stairs.
    ~choice = 3
    ~MinutesLeft -= 10
    On each floor, you check the floor plan again.
    1st floor: nothing!
    2nd floor: nothing!
    3rd floor: Bingo!
    You see 
- <> that the English/American Studies books {choice == 3: are here| on the 3rd floor} in the West section.
{choice == 3:
    You go
    -else:
    Upon reaching the top, you go
}
-> InTheEngStudLib_E
=== InTheEngStudLib_E ===
<> to the nearest catalog PC.
//If trained, continue directly, if not trained, deduct 30 minutes!
 {Challenge_1 == true: 
    "Luckily, I learned how to use the catalog in the main library training. This will be easy."
    -else: "Damn, I should have done the catalog training at the main library first. Oh well, I'll have to figure this out on my own..."
    You search for the title:
    ~MinutesLeft -= 30
    }

-> AtTheCatalog_E

===AtTheCatalog_E===

//TEST: time left 5c2: {MinutesLeft}

"Kathleen Woodward: Statistical Panic". {~"Ah, here it is:"| "Found it:"|"I should remember the call number:"}
+ "001 HS 1070 H175 (2)" -> AnglWrong_E
+ "001 HU 1075 W911" -> AnglCorr_E
+ "011 HU 9800 M379 C319" -> AnglWrong_E
+ "003 HM 1070 W724" -> AnglWrong_E

//TEST: time left 5d: {MinutesLeft}

=AnglWrong_E
Hmm, the book isn't here. Did you write down the wrong call number? You go back to the catalog PC and search for the title again.
~MinutesLeft -= 5
//TEST: time left 5e: {MinutesLeft}
-> AtTheCatalog_E
=AnglCorr_E
You found the book on the shelf and borrowed it immediately!
//TEST: time left 5f: {MinutesLeft}
~Challenge_5 = true
~TodaysChallenge = true
~AssignmentsCompleted +=1
-> TheChallenges_E.Successful_E

// TODO: if time runs out, today's challenge isn't completed, but it can be done another day (English Studies available on weekends too!!)

