//css classes
# CLASS: Titel
# CLASS: Author
# CLASS: chapter
# CLASS: subchapter
# CLASS: Highlight

//German Weekdays
LIST Weekdays = (Montag), Dienstag, Mittwoch, Donnerstag, Freitag, Samstag, Sonntag

//English Weekdays
LIST Weekdays_E = (Monday), Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday


//Times
VAR MinutesLeft = Weekday_Minutes
VAR DaysLeft = 7
CONST Weekday_Minutes = 120
CONST Weekend_Minutes = 240

//Challenge status
VAR AssignmentsCompleted = 0
VAR TodaysChallenge = false

VAR Challenge_1 = false //Main Library
VAR Challenge_2 = false //Main Medical Library
//VAR Challenge_3 = false //empty Library
VAR Challenge_4 = false //Religious Studies Library
VAR Challenge_5 = false //English Studies Library
//VAR Challenge_6 = false //empty Library
VAR Challenge_7 = false //Media Center

//Traveltimes
VAR TravelTime_Lib1 = 5 //Main Library
VAR TravelTime_Lib2 = 40 //Main Medical Library
//VAR TravelTime_Lib3 = 15 //empty Library
VAR TravelTime_Lib4 = 30 //Religious Studies Library
VAR TravelTime_Lib5 = 20 //English Studies Library
//VAR TravelTime_Lib6 = 50 //empty Library
VAR TravelTime_Lib7 = 20 //Media Center

//Subtasks
VAR LibraryCard = false
VAR LibIntro = false
