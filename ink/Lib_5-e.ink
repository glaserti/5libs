//MediaCenter

=== ToTheMediaCenter_E ===
Media Center # CLASS: subchapter

~MinutesLeft -= TravelTime_Lib7 // Update time variable
//TEST: time left 7a: {MinutesLeft}

You have no idea where the Media Center might be...
Fortunately, you remember an old internet meme from your school days:
<span class="meme">"When in doubt -- ask a librarian!"</span>
So, you head to the university library.

When you arrive at the library, you go straight to the help desk and ask where the Media Center is located.
You're in luck! The Media Center is in the library!
They direct you to the first floor.

# IMAGE: images/i5_media.png

* You go upstairs and then left into the Media Center.
    -> InTheMediaCenter_E
* You pause for a moment...
    -> ToTheMediaCenter_E.ReferenceDesk_E
    
= ReferenceDesk_E
# CLEAR
~MinutesLeft -= 20 // Update time variable
//TEST: time left 7c: {MinutesLeft}

"I’m supposed to borrow a camera there," you explain.

// Condition: If it's not the weekend:
{DaysLeft > 2:
"Yes, you can do that there. Go upstairs, and you'll find a reference desk where they’ll explain what devices we have and how you can borrow them."
"But you can also find the information on the Media Center's website. There’s also an online form to borrow the camera." "Thank you."

    + You go upstairs and then left into the Media Center.
     -> InTheMediaCenter_E
    + [You go to one of the PCs.]
     -> ToTheMediaCenter_E.AtThePC_E
}
// It is the weekend
{DaysLeft < 3:
"Unfortunately, the device lending service at the Media Center is not open on weekends. But you can find all the information on the Media Center's website. There’s also an online form to borrow the camera."
   + [You go to one of the PCs.]
    -> ToTheMediaCenter_E.AtThePC_E
}
= AtThePC_E
# CLEAR
~MinutesLeft -= 40 // Update time variable
//TEST: time left 7d: {MinutesLeft}

You go to one of the computers, open the Media Center's website, and read the information on how the lending process works. 
//TEST: days left: {DaysLeft}; Ucard: {LibraryCard}

{DaysLeft > 3: -> BeforeFriday_E}
{DaysLeft < 4: -> AfterThursday_E}

= BeforeFriday_E
// before Friday
{not LibraryCard:
You don’t have a library card.
   + You go back to the reference desk.
    -> InTheMainLibrary_E.InfoDesk_E
}
{LibraryCard:
Since you have your library card, you can fill out and submit the form to borrow the camera. On the Media Center’s website, you see what else they offer: a film room and a sound room. "Hm, maybe I could record a presentation as a video?" you think. "I wonder what the GameLab is like? I should check that out too." While you're still browsing the site, you see that you have a new email. It’s a confirmation email from the Media Center. You can pick up the camera on Friday.
    -> MediaCenterEpilogue_E.MediaSuccess_E
}

=AfterThursday_E
// on Friday or weekend
{DaysLeft < 4:
Then you freeze. It says that it usually takes three days for the device to be prepared. So, you won’t be able to pick up the camera on Monday...
"Screw this!" you think.
//TEST: days left: {DaysLeft}; Ucard: {LibraryCard}

//not Weekend
{DaysLeft > 2:
+ You give up and lose interest.
    -> MediaCenterEpilogue_E.MediaFail_E
+ You decide to try your luck at the Media Center and go upstairs.
    -> InTheMediaCenter_E
}
}

// on weekend
{DaysLeft < 3:
"Darn weekend!" you exclaim. The other people in the library turn to look at you. One person sitting at the PC behind you even hisses: "Shhh!"
-> MediaCenterEpilogue_E.MediaFail_E
}

=== InTheMediaCenter_E ===
# CLEAR
~MinutesLeft -= 30 // Update time variable
//TEST: time left 7e: {MinutesLeft}

You see a large PC pool, work cubicles, and group study rooms. To your right, there’s an reference desk.

{DaysLeft < 3:
But there’s no one there. You look around, and there’s no staff in sight. It seems the Media Center isn’t staffed on weekends.
-> MediaCenterEpilogue_E.MediaFail_E
}

You go to the desk and explain what you’re looking for.
The staff member picks up the phone and tries to reach the media technician. Fortunately, he’s in his office, and you can go see him. He explains which cameras are available, what you can do with them, and then he fills out the Loan Request for you.
//TEST: {InTheMainLibrary.InfoDesk}
//TEST: {LibraryCard}
{ LibraryCard:
Since you already have your library card, he gives you the camera right away. ("Just this once," he says. Normally, you have to book the devices three days in advance...)
-> InTheMediaCenter_E.MediaServices_E
}

{ not LibraryCard:
You don’t have a library card, so you need to go down to the reference desk on the ground floor to get one issued.
-> InTheMainLibrary_E.InfoDesk_E
}

= MCwithLibraryCard_E
# CLEAR
After you’ve done that, you come back upstairs and borrow the camera. ("Just this once," he says. Normally, you have to book the devices three days in advance...)
~MinutesLeft -= 10
-> InTheMediaCenter_E.MediaServices_E

= MediaServices_E
While giving you the camera, he tells you that the Media Center also has a sound and film room, in case you want to shoot a video in front of a green screen or record a podcast. There’s also a GamingLab and opportunities to try out VR/AR and 3D scanning and printing.
-> MediaCenterEpilogue_E.MediaSuccess_E


//-> MediaCenterEpilogue.MediaSuccess

=== MediaCenterEpilogue_E ===

= MediaSuccess_E
//TEST: time left: {MinutesLeft}
~Challenge_7 = true
~TodaysChallenge = true
~AssignmentsCompleted +=1
-> TheChallenges_E.Successful_E

= MediaFail_E
You couldn’t complete this task today and you can’t borrow the camera on weekends. It’s not even worth going back to the class on Monday.
->TheEnd_E.Incomplete_E


