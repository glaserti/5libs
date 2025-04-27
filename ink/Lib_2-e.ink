//MainMedicalLibrary
// Time: 120 min. Travel = 40; 

=== ToTheMedicalLibrary_E ===
Central Medical Library # CLASS: subchapter
So you are supposed to go to the "Central Medical Library" today. -> commuting_E
=commuting_E
~ temp location = 0 // 1 = true, 2 = false, 3 = false
//TEST: time left 2: {MinutesLeft}
{location == 3: You check the "Locations" section on the library's website again:|You take your laptop and go to the library's website. There you find a section "About Us" and then the "Locations" page. You should be able to find the library address there.}
    * Conradistraße 3a
        You check Maps to see where you need to go.
        ~location = 1
    * Universitätsstraße 6
        "That's not too far away," you think. You pack your backpack and set off. Instead of taking the bus, you decide to walk. It's not raining at the moment.
        ~location = 3
        ~MinutesLeft -= 10 
        After a few minutes, you arrive at the address and hesitate: It says "Department of Law." "This can't be right," you think.
        ->commuting_E
    * Hans-Meerwein-Str. 6
        ~location = 2
    - {~Arriving at the bus stop, you wait for the next bus.|You sit at the bus stop and wait.}
    + The bus arrives and you get on.
        
    + [You talk to someone from your seminar at the bus stop and take the next bus.] When the next bus arrives, you say goodbye and get on.
        ~MinutesLeft -=10
    + [You feel like having some ice cream and quickly run over to the ice cream shop.] After eating the ice cream, you catch the next bus.
        ~MinutesLeft -=20

    - ~MinutesLeft -= TravelTime_Lib2 // Update time variable
    //TEST: time left 2c: {MinutesLeft}
    
    After what feels like forever, you finally arrive at the Lahnberge.
    {location == 1: -> InTheMedicalLibrary_E|->WrongLibrary_E}
    =WrongLibrary_E
    You walk along the path between the newer and older buildings and eventually stop at the noted address. You realize you wrote down the wrong address. This is not the medical library but the chemistry department.
    + You ask someone coming out of the building where the Central Medical Library is.
    + You take out your phone and check the library's website again for the ZMB's address.
        ~MinutesLeft -=10
        

    - # CLEAR
    At least you are generally in the right area, here at the Lahnberge. You cross the bridge and finally stand in front of the glass foyer of the ZMB!
    ~MinutesLeft -= 10 // Update time variable
    //TEST: time left 2d: {MinutesLeft}
    ->InTheMedicalLibrary_E
    
=== InTheMedicalLibrary_E ===
At the door, you see the library's opening hours and are pleased to see that the library is open until late in the evening and even on weekends. If you don't manage to complete the task now, you can come back this evening.
You check your watch. You have {MinutesLeft} minutes left. 
//TEST: {DaysLeft} days left.

{DaysLeft < 3: //Weekend
    You remember that it's the weekend and you have no university appointments. So you can go to the library without any hurry to complete the task. -> AtTheDesk_E
    - else:
    { MinutesLeft > 50:     
        <> That might still be enough time. You go inside.
            ->AtTheDesk_E
        -else: 
        <> That's too little time. You need to hurry back to the Lahntal to make it to your lecture on time.
        + You quickly run to the bus and decide to come back in the evening.
            -> BackAtNight_E
        }
    }
    
    
= BackAtNight_E
# CLEAR
After your university day is over, you get on the bus again and head -- once more – to the Lahnberge. You're glad you don't have to come up here regularly. It always takes so long...
At the door, you check your watch.
20:10h # CLASS: Highlight
"Fifty minutes should be enough to find and borrow the book," you think to yourself and go inside.
-> AtTheDesk_E

= AtTheDesk_E

# IMAGE: images/i2_med.png
In the library, you look around first and then go to the help desk. There you ask where you can find the book:
    * B. Tillmann/B. Hirt, Präpkurs Anatomie, Berlin 2022.
        
    * R. Otto, Das Heilige, Berlin 2022
        "We don't have that book here. You need to go to the Theology or Religious Studies library. Or to the University Library."
        You look at your note again. You made a mistake. You meant, of course:
        ** B. Tillmann/B. Hirt, Präpkurs Anatomie, Berlin 2022.
    
    - # CLEAR
    The librarian explains that you can search for the book in the library catalog. She enters the title into the catalog and shows you that you can find the book on the 1st floor. But unfortunately, the book is currently checked out.
    You look at the screen in disbelief. Could the professor really have given you the task of borrowing a book that only exists once in Marburg? That can't be.
    You grab the mouse and go back from the title display to the results list.
    "The book is here twice!" you exclaim. "What does this 'Full Text' mean?"
    "It means we have the book as an eBook in Marburg. With your HRZ account, you can access electronic media -- such as eBooks, electronic journals, or databases -- from any PC."
        * "So from the university PCs?"
        * "With my own computer as well?"
        
    - # CLEAR
    
    "Yes, from the PCs in the university's PC pools. But also from any other computer. Here on the library's website, you can find information about "External Online Access."
    "But the most important thing is: If you access the eMedia from the CatalogPlus, a connection is automatically established via the HRZ. And the only thing you need to enter in the form is..."
        * "My library card number and the password."
            "No, you don't need a library card for the eMedia."
            ** "Then my university account username?"
        * My university account username and password.
        # CLEAR
        - "Exactly, for the eMedia, you don't need your library card, but your university or HRZ account."
        "Once you've entered that, you'll normally be directed to the eBook on the publisher's website, and you can then read the book on screen or print or download individual chapters as PDF files."
        You are relieved that you can still get the book and have completed this task.
        ~Challenge_2 = true
        ~TodaysChallenge = true
        ~AssignmentsCompleted +=1
        ~MinutesLeft -= 30
//TEST: time left 2e: {MinutesLeft}
-> TheChallenges_E.Successful_E

