//The Religious Studies Library


=== ToTheRelStudLib_E ===
# CLEAR
Library of Religious Studies # CLASS: subchapter

You walk up the hill to the castle. Up. And even higher, almost all the way to the castle. Just below the castle is an old building that houses the Library of Religious Studies. As you reach for the door, you see a sign on the door:


This week the library is open: # CLASS: Highlight
Mon - Thu, 10 AM - 3 PM # CLASS: Highlight

~MinutesLeft = MinutesLeft - TravelTime_Lib4
{DaysLeft > 3:
    + You open the door[.]
    <> and go all the way up the spiral staircase. When you reach the top, you are completely out of breath.
    -> InTheRelStudLib_E 
- else: 
    + Annoyed, you walk back down the hill.
        You should have checked the library's website for opening hours beforehand! Now you've wasted valuable time.
        ~MinutesLeft = MinutesLeft - TravelTime_Lib4
        "Now, first of all, a coffee!" Back down in the Lahntal, you head to the cafeteria.
        ++ You open the door to the cafeteria.
            -> Libraries_E.Lib4_E
    }

=== InTheRelStudLib_E ===
You enter a small library that has surprisingly many rooms and surprisingly many books. How will you find Rudolf Otto's book on the Holy here?
# IMAGE: images/i3_rel.png
    + You ask the librarian[.] about the book.
    "Oh yes," she replies, "we do have the book, of course. To find a book, you need the call number. If you have that, you can find the book in that room over there." The call number is at the bottom of the book spine.
    She enters the name and title in the catalog and writes the call number on a slip of paper for you.
    + You [see a computer and use the library catalog.] find the call number in the catalog.
    - With the call number in hand, you walk through the library and search the shelves. 
    * You find the book on the shelf. -> TheBook_E
    * You don’t find the book and ask the librarian again. -> TheHint_E
    
    = TheHint_E
    The librarian shows you which room the book is in again. You go there and discover the book. -> TheBook_E
    
    = TheBook_E
    Finally, you pull the book from the shelf and take it to the librarian near the entrance door.
        "I would like to borrow the book for a week."
        "Oh, I'm sorry, but that's not possible. The book is part of a semester reserve. That means the book can only be used as a reference copy here in the library. You cannot take it with you."
        You didn't expect this. You always thought libraries lend out books. Having to read the book in the library is somehow... unexpected.
        But that's not an option for you. The assignment clearly says you need to borrow the book.
        + You ask again if an exception might be possible...? -> TheAnswer_E
        + Puzzled, you turn around. ->PreAlternative_E
        
= TheAnswer_E
# CLEAR
        "Unfortunately not," she replies. -> TheAlternative_E
=PreAlternative_E
# CLEAR
       ->TheAlternative_E 
= TheAlternative_E
"But you can," the librarian continues, "check the catalog to see if we have the book at another location, in another library. If it’s in the university library, you can definitely borrow it!"
         ~MinutesLeft -= 15 // time spent in the library
        In the catalog, you see that the book is indeed there and still available.
        You check your watch: You have {MinutesLeft} minutes left. But you have to walk all the way down the hill again to the university library.
       ~ MinutesLeft = MinutesLeft - TravelTime_Lib4
        <> And then you only have {MinutesLeft} minutes left.
    
    {
        - Challenge_1:
            -> RelToMainLibrary_E

        - Challenge_5:
            -> RelToMainLibrary_E

        - else:
            You don’t think you can find the book and figure out how to borrow it at the university library in just {MinutesLeft} minutes without an introduction to the library.
            + You decide to call it a day. Maybe you can stop by the university library tomorrow to get the book.
                -> TheChallenges_E.Fail_E

    }

 = RelToMainLibrary_E   
Luckily, you've been to the university library before and know your way around. Then {MinutesLeft} minutes should be enough to complete the task.
+ You walk down the hill towards the university library
# CLEAR
In the University Library # CLASS: subchapter

    Satisfied, you walk down the hill to borrow the book from the university library. 
    -> MainLibraryRelStud_E

===MainLibraryRelStud_E===
You arrive at the university library and immediately search the catalog for Otto's book. You find the 5th edition from 2022.
~MinutesLeft -= 20
        -> RelCatalog_E

= RelCatalog_E
You write down the call number and check the floor plan to see which floor the book is on:
    + "205 210 O H" -> RelWrong_E
    + "001 BE 2310 O91 (5)" -> RelCorr_E
    + "010 BH 4554 O34" -> RelWrong_E

    = RelWrong_E
    You go to the shelf, but you don’t find the book. You must have written down the wrong call number. You go back to the computer and search for the book again: "Rudolf Otto, The Holy, 5th edition of 2022".
    ~MinutesLeft -= 10
    -> RelCatalog_E
=RelCorr_E
You find Rudolf Otto's book on the shelf and borrow it. 
~MinutesLeft -= 10
~Challenge_4 = true
~TodaysChallenge = true
~AssignmentsCompleted +=1
-> TheChallenges_E.Successful_E


