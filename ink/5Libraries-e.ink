
=== FirstClass_E ===
# CLEAR

# CLASS: chapter
{8-DaysLeft}. Chapter: {Weekdays_E}, 10 a.m. 
~MinutesLeft = Weekday_Minutes

Once upon a time… on the first day of the semester, a {Weekdays_E}, you go to your first class. The professor is pretty strict. And demanding. At least that’s what your roommates say.


    * "Yeah sure, that doesn’t scare me. What’s the worst that could happen -- on the first day of the semester?"
        At 10:15 sharp, the professor enters the room and drops a thick stack of papers and books on the desk. He looks around the room, fixes you with his stare and asks: 
        "Have you ever been to the libraries? Have you ever read a book or an article?" -- "I mean: <em>ever</em>?" he continues.
        You are very confused. He doesn’t even know you!
        ** "Oh yes, I have read many books!", you reply, mustering all your courage.
            "Good for you," he answers. "But I didn’t mean you. Not you personally. I was speaking to all of you!"
        ** You feel very uncomfortable and sink behind your desk, trying to hide. 
   "Oh, I didn’t mean you personally!" he says. I was speaking to all of you!"
        ** Oh no, you can’t handle this anymore. You jump up and run out of the room.
           ->TheEnd_E.BonVoyage_E
    * "I better find a seat at the back of the room. I don’t want to attract his attention. At least not yet."
        At 10:15 sharp, the professor enters the room and drops a thick stack of papers and books on the desk. He looks around the room, fixes you with his stare and asks: 
        "Have you ever been to the libraries? Have you ever read a book or an article?" -- "I mean: <em>ever</em>?" he continues.
    
    -  You are all very confused. After all, it is only the first day of the semester and the first session in this class. No one has the courage to answer his question.
# IMAGE: images/i0_prof.png
"Well," he continues, "I spent last night grading last semester’s papers -- they are atrocious. It is more than clear that your fellow students were more interested in socializing and supporting the local drinking establishments than in working on their papers."
"I hope this semester will be different. I hope you are different. And to help you with that, I am giving you your first assignment today. A ‘challenge,’ if you will. I advise you not to take it lightly. You should be able to complete the assignment successfully. Do you understand?!"
No one even dares to take a breath. 

//-> HandingOutAssignments

//= HandingOutAssignments
He grabs the stack of papers and holds it up. 
"This is your challenge for the week."
"If you want to come back to my class next week -- if! --, you must visit five campus libraries and complete a task in each one."
He hands out the task sheet, or “challenge”, as he likes to call it. 

* You take a look at the “challenge” right away. 
    -> TheChallengeStarts_E
* "I need coffee first," you think to yourself, as you put the sheet in your bag. 
    ->InTheCoffeeShop_E

# CLEAR

= TheChallengeStarts_E

You hold the task sheet in your hands and are puzzled.
"Are there really that many university libraries in Marburg? But… where?” 
As you leave the classroom, you skim through the tasks and think that it shouldn’t be too hard to find the libraries and get the books. Maybe you can complete it all today? 
Before {&your next university appointment|your next lecture|your seminar} starts, you still have {MinutesLeft/60} hours left. Will that be enough time to complete all the tasks?
That is, you actually only have {MinutesLeft/60} hours today to tackle the assignment. The rest of your day is packed full -- as is the entire week! When you’re not in class, you have appointments in office hours, at the academic advising center, get-togethers, social events, pub crawls, potlucks and movie nights. The student council has put together a whole program for the week.

 - So, where to now?
    * You take a look at the task sheet.
        -> TheAssignments_E.ListOfChallenges_E
    * You head to the cafeteria first.
        Are you sure? You should complete the assignment!
        ** Alright then!
            -> TheAssignments_E.ListOfChallenges_E
        ** No, I need coffee first!
            -> InTheCoffeeShop_E


=== nextDay_E ===
# CLEAR
{Weekdays_E == Sunday:
    ~Weekdays_E = Monday
    -else:
    ~Weekdays_E ++
}
~DaysLeft -= 1
{DaysLeft > 2:
    ~MinutesLeft = Weekday_Minutes
- else:
    ~MinutesLeft = Weekend_Minutes
}

{8-DaysLeft}. Chapter: {Weekdays_E}, {&11 AM|1 PM|9:45 AM|12:30 PM|10:30 AM} # CLASS: chapter

{
    -DaysLeft < 1 and AssignmentsCompleted < 5:
        -> TheEnd_E.Incomplete_E
    -DaysLeft < 1 and AssignmentsCompleted == 5:
        -> TheEnd_E.Aurevoir_E
    -DaysLeft > 0 and AssignmentsCompleted == 5:
        -> TheEnd_E.Enjoy_E
    - else: 
        -> goOn_E
}

=goOn_E
You still have {DaysLeft} {DaysLeft > 1: days|day} to complete the assignment. So far you’ve completed {AssignmentsCompleted} tasks.
<> {TodaysChallenge: 
    You are relieved that you completed yesterday’s task.
- else:
    You're a bit demotivated that you didn't complete yesterday's task. But today you’ll definitely get it right. You just have to figure out when to catch up on yesterday's task...
    Maybe later! 
}
~TodaysChallenge = false
//TEST: TodaysChallenge {TodaysChallenge}

{DaysLeft > 2:
    Before {& your next university appointment|your next lecture|your seminar} starts, you have {MinutesLeft/60} hours left.
    -else:
    In {MinutesLeft/60} hours {you’re meeting up with friends to cook together. You should be done by then.|your volleyball training starts. You can’t take longer.}
}
So, where to now?
    + You take a look at the task sheet.
        -> TheAssignments_E.ListOfChallenges_E
    + You head to the cafeteria first.
        Are you sure? You should complete the assignment!
        ++ "I need coffee!"
            -> InTheCoffeeShop_E
        ++ Alright then!
            -> TheAssignments_E.ListOfChallenges_E



=== TheChallenges_E ===

= Successful_E
Done (at least for today!) # CLASS: subchapter

//MinutesLeft < 0: You took longer than planned today and now you’re running late for your next appointment. {You quietly sneak into the lecture and hope the professor doesn't notice...|Since it's just a student council meeting, it's not so bad.}

{MinutesLeft > 30:
{~Relieved|Happy|Satisfied}, that you completed the task without any difficulties,
- else:
    {~The task wasn’t so easy.| You took longer than expected.|"That was a close call," you think to yourself.} You take a breather and then
}
- <> you go {~to the academic advising office|to your next lecture|to your seminar|to the student council presentation|to the student council city rally} and in the evening to the {~pub crawl|movie night|BBQ by the Lahn|student council evening}.
At the end of the day, you enjoy the view of the Lahn and are in good spirits, {AssignmentsCompleted < 5: that you can solve tomorrow's task too.|to face the professor in the seminar.}
//TEST: completed: {AssignmentsCompleted} Assignments
    + On to the next chapter.
    -> nextDay_E
    # CLEAR


= Fail_E
# CLEAR
Not today! # CLASS: subchapter
You are a bit disappointed that you didn't solve today's challenge. But hey, there's always tomorrow. You'll definitely manage it then. You just have to figure out when you can make up for today's task. Somehow you have to manage to free up some time...
    + On to the next chapter
    -> nextDay_E
    # CLEAR

=== TheAssignments_E ===

= ListOfChallenges_E
# CLEAR
The Tasks # CLASS: subchapter
Your weekly task, TO BE COMPLETED BY NEXT WEEK! # CLASS: Highlight
Work through the following tasks. # CLASS: Highlight
    + {Challenge_1} University Library 
        -> BeenHereDoneThat_E
    + {not Challenge_1} [University Library] 
        -> Assignment_MainLibrary_E
    + {Challenge_2} Central Medical Library
        -> BeenHereDoneThat_E
    + {not Challenge_2} [Central Medical Library]
        -> Assignment_MedicalLibrary_E
 //   + Art History Library
+ {Challenge_4} Religious Studies Library
        -> BeenHereDoneThat_E
        + {not Challenge_4} [Religious Studies Library]
        -> Assignment_RelStudLib_E
    + {Challenge_5} English/American Studies Library
        -> BeenHereDoneThat_E
    + {not Challenge_5} [English/American Studies Library]
        -> Assignment_EngStudLib_E
    //   + Chemistry Library
    + {Challenge_7} Media Center 
        -> BeenHereDoneThat_E
    + {not Challenge_7} [Media Center] 
        -> Assignment_MediaCenter_E
    + {not Challenge_1 and LibraryCard} You head to the cafeteria first. -> InTheCoffeeShop_E
    + {not Challenge_4 and InTheRelStudLib} You still need to search for the book on religious studies in the main library! -> MainLibraryRelStud_E

= Assignment_MainLibrary_E
University Library # CLASS: Highlight
"Find the university library, get a library card, and attend a library introduction session." # CLASS: Highlight
    + You try to solve this task.
        -> ToTheMainLibrary_E
    + "What are the other tasks?"
        -> TheAssignments_E.ListOfChallenges_E

= Assignment_MedicalLibrary_E
Central Medical Library # CLASS: Highlight
"Visit the Central Medical Library and borrow the following book: 'B. Tillmann/B. Hirt, Präpkurs Anatomie, Berlin 2022'." # CLASS: Highlight
    + You try to solve this task.
        -> ToTheMedicalLibrary_E.commuting_E
    + "What are the other tasks?"
        -> TheAssignments_E.ListOfChallenges_E 
  

= Assignment_RelStudLib_E
Religious Studies Library # CLASS: Highlight
"Find the Religious Studies Library. Borrow the book 'Rudolf Otto: The Sacred'." # CLASS: Highlight
    + You try to complete this task.
        -> ToTheRelStudLib_E
    + "What are the other tasks?"
        -> TheAssignments_E.ListOfChallenges_E

= Assignment_EngStudLib_E
English Studies Library # CLASS: Highlight
"Find the English Studies Library. Borrow the book 'Statistical Panic' by Kathleen Woodward." # CLASS: Highlight
    + You try to solve this task.
        -> ToTheEngStudLib_E
    + "What are the other tasks?"
        -> TheAssignments_E.ListOfChallenges_E
        
= Assignment_MediaCenter_E
Media Center # CLASS: Highlight
"Find the Media Center and borrow a camera." # CLASS: Highlight
    + You try to solve this task.
        -> ToTheMediaCenter_E
    + "What are the other tasks?"
        -> TheAssignments_E.ListOfChallenges_E

       

= BeenHereDoneThat_E
{~You remember, you've already completed this task!|"No way, I won't go there again!"|"Been there, done that!"|You realize you don't have enough time to look over everything multiple times.|"Better take a look at a task you haven't completed yet," says your guilty conscience.|"Challenge accepted, challenge completed!"|"The professor won't find it funny if I complete the same task five times."|The library seems familiar... Could it be that you've been there before?}
+ You look at the task sheet again.
    -> ListOfChallenges_E


=== TheEnd_E ===

=Incomplete_E
You have completed only {AssignmentsCompleted} of the tasks, but time has run out. Unsure of what to do, you head to class. As you enter the building, you hesitate.
    + No, I can't go in there.
        -> BonVoyage_E
    + You gather your courage and go in.
        -> WorkHarder_E


=Enjoy_E
A new day -- and nothing more to do. After successfully completing all the library tasks, you decide to spend the rest of the weekend 
    * in the library.
    * having a barbecue with friends by the river.
    - -> Aurevoir_E


=WorkHarder_E
# CLEAR
Back in the seminar # CLASS: chapter

There are far fewer students here today than last week. Did they not complete the tasks? Or are they just not interested in the class?
Oh well, you nervously find a seat, but not too close to the front.
When the professor asks who completed the tasks and who didn't, you raise your hand and explain that you didn't finish.
He listens to why you didn't complete all the tasks and recommends that you familiarize yourself with the libraries a bit more. You should attend another library introduction, look at the online tutorials more closely, and pay attention to the training sessions the library offers throughout the semester.

# IMAGE: images/i7_finis.png
\~:~ End ~:~ # CLASS: chapter
-> END

=Aurevoir_E
# CLEAR
Back in the seminar # CLASS: chapter

On Monday, you head to class. There are far fewer students here today than last week. Did they not complete the tasks? Or are they just not interested in the class?
Oh well, you find a seat and are in good spirits.
Whatever the professor brings today, whatever tasks you have to solve next week... you are sure you can do it.

# IMAGE: images/i7_finis.png

\~:~ End ~:~ # CLASS: chapter
->END


= BonVoyage_E
//If two challenges are not completed, go here.
# CLEAR

The End # CLASS: chapter

You run out and make your decision!

~Weekdays_E = Weekdays_E + 1
You drop out of college and take the next train to Amsterdam. The next day, a {Weekdays_E}, you reach the harbor and sign on to a container ship.
You sail the Seven Seas until the Kraken pulls the ship with you in it down into the depths.

# IMAGE: images/i7_kraken.png

\~:~ End ~:~ # CLASS: chapter

+ Try again!
    # RESTART
-> END