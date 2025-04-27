// The Main Library

=== ToTheMainLibrary_E ===
University Library # CLASS: subchapter

You head to the university library. When you arrive, you go straight to the help desk.
~MinutesLeft = MinutesLeft - TravelTime_Lib1
-> InTheMainLibrary_E

=== InTheMainLibrary_E ===

= InfoDesk_E
The librarian at the help desk asks you if you would like a library card.

# IMAGE: images/i1_lib.png
    +\ {~"Not now."|"I'm in the wrong place," you say embarrassed.|"Um, no. I just wanted to look around."}
    You head back out.
    ~MinutesLeft = MinutesLeft - 10
    -> ExitLibrary_E
    * "Yes, please!"
    The librarian explains what you need to provide to get a library card. You give him everything and shortly after, you’re holding your library card in hand. He explains that the numbers on the back of the Ucard are your library card number and that your date of birth is your password.
    "You should definitely change the password!" he says.
    "Ok."
    "You should also attend a library introduction so that you know how to find books in the catalog, where the books are located in the library, and how to borrow them."
    "Thanks, I'll do that as soon as I have time."
    ~LibraryCard = true
    ~MinutesLeft = MinutesLeft - 30
    <> You glance at your watch. You have {MinutesLeft} minutes left.
    ** You ask what training sessions are available. -> LibraryIntroduction_E
    ** You leave the library. -> ExitLibrary_E
    ** {InTheMediaCenter and not Challenge_7} You head back to the media center -> InTheMediaCenter_E.MCwithLibraryCard_E
    ** {ToTheMediaCenter.AtThePC and not Challenge_7 and not InTheMediaCenter} You go back to the PC -> ToTheMediaCenter_E.BeforeFriday_E
    * {LibraryCard} "I already have a card, but what library training sessions are available?"
    -> LibraryIntroduction_E
    
    = LibraryIntroduction_E
    We have various introductions to the library and catalog use. You can attend a general training session to learn how to use the different libraries.
    You can also attend a special research training. There, you will learn how to find literature using the library catalog and other databases.
    You can find the schedule on the library's website and on the bulletin boards.
    If you are in a hurry and cannot attend one of the training sessions, we also have online learning modules. You can find them on our website and on Ilias.
    ~MinutesLeft = MinutesLeft - 20

     {MinutesLeft > 40: 
    You decide to go to the cafeteria, check out the learning modules, and familiarize yourself with the library that way. Maybe that's enough!
    ~MinutesLeft = MinutesLeft - 40
    ~LibIntro = true
    ~Challenge_1 = true
    ~TodaysChallenge = true
    ~AssignmentsCompleted +=1
    //TEST: time left 2c: {MinutesLeft}
    ->TheChallenges_E.Successful_E
    -else: You do not have enough time today to complete the task, only {MinutesLeft} minutes left. But next time you are in the cafeteria, you can work through the online tutorial.
    * You leave the library.
    ->TheChallenges_E.Fail_E
    }
 
    
=== ExitLibrary_E ===
You are now standing in front of the university library, contemplating what to do next.
    + You head back into the library and to the help desk.
    ~MinutesLeft = MinutesLeft - 10
    -> InTheMainLibrary_E.InfoDesk_E
    + {InTheRelStudLib and not Challenge_4} You remember that you still need to find the book for religious studies.
    -> MainLibraryRelStud_E
    + You look at the other tasks.
    -> TheAssignments_E.ListOfChallenges_E

