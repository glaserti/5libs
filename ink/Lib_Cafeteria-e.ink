===InTheCoffeeShop_E===
# CLEAR
In the Cafeteria # CLASS: chapter
# IMAGE: images/i6_coffee.png
{
- not TheAssignments_E.ListOfChallenges_E:
    -> AfterClass_E
- LibraryCard and not LibIntro:
    -> Libraries_E.Lib1_E
- else:
    -> Fallback_E
}

= AfterClass_E

"What a start to the semester!" you think and wonder if all the professors are like that. You grab a coffee and sit outside on a bench. "Is he really right that students don't read enough anymore?" -- Nonsense, how difficult could libraries be? You’ll surely finish the tasks quickly. Maybe you'll try to complete all the tasks today? Then you’d have the rest of the week off. Or perhaps, another cup of coffee first?
-> Fallback_E

=Fallback_E
With a coffee in hand, the day feels different.
+ You take the task sheet out of your bag.
~MinutesLeft = MinutesLeft - 10
-> TheAssignments_E.ListOfChallenges_E
+ You grab another coffee.
    ~MinutesLeft = MinutesLeft - 20
    Procrastination won’t get you anywhere. You still have to do the tasks! 
    <> <em>"Eat that frog!"</em>
    ++ Heavily caffeinated but somewhat reluctantly, you dig out the task sheet. 
-> TheAssignments_E.ListOfChallenges_E

===Libraries_E===
=Lib1_E
//If libraryCard = true and LibIntro = false, do the online tutorial here; if the online tutorial is successful, then set libIntro = true and Challenge_1 = true.

You quickly grab another coffee and decide to do the online tutorial for the library introduction. That way, you can get it over with and check off the task.
~MinutesLeft = MinutesLeft - 40
~LibIntro = true
~Challenge_1 = true
~AssignmentsCompleted += 1
When you're done, you check the time: You have {MinutesLeft} minutes left, but no more desire to do anything else for the seminar today. You grab one more coffee before heading out.
    -> TheChallenges_E.Successful_E

=Lib4_E
Coffee is always a good idea. With a coffee in hand, you find a seat by the window. You're frustrated. The stupid library won't open again until Monday at 10 AM. While you're wondering what to do now -- or should you just stop going to the class altogether? -- you overhear a conversation at the next table.
"You can't borrow that book from our library. But the main library has another copy, and I borrowed it from there."
This gives you an idea. You could check at the main library to see if they have the Otto book there. You may not have visited the Religious Studies library, but as long as you have the book, the professor won’t care, right?
* You go to the main library to search for the "Otto."
    -> MainLibraryRelStud_E
* You don't believe you'll find the book there.
    -> TheEnd_E.BonVoyage_E

