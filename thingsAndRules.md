## Timetable

## Schedule : One Full Timetable Sheet.

* -> creator(one) The one who created it.
* -  name(string) name: One friendly name to call.
* => events/timetableEntries : All the events that are on the schedule/All periods in one timetable sheet.

## event/timetableEntry : One entry in the sheet.

*  => organizers/teachers - [ Set of people cordinating this event / Teachers taking the class ](##Teacher)
*  => location/classroom - [ Location where the event is held/ ClassoRoom - Class and Division]
*  => timeslot/period - [ Start time and end time of the event/ Period start time end time ]
*  => topic/subject - [ Topic of the event /  Subject ]


## Thing

* Attributes (Attributes of a thing, Arbitary Key value pairs)


## Organizer/Teacher < Thing
Required Attributes : 

 * String Name (Teacher's Name)
 * Array Topics/Subjects (Topics the Organizer can handle/Subjects that can be taught by this teacher)

## Location/ClassoRoom < Thing
Required Attributes:

  * String Name (5C)
  * String Standard (5)
  * String Division

## TimeSlot/Period < Thing
Required Attributes:

  * Time StartTime(HH:MM:SS)
  * Time EndTime(HH:MM:SS)
  * Integer DayOfTheWeek({0 - No of days in week})

## Topic/Subject
Required Attributes:

   * String Name
   * String Subject Group Name (Biology - Botany Zoology)


---

# Notes:

- One time table entry has multiple teachers?
Eg: Labs have multiple teachers

- Thing.
A thing is an entity with multiple attributes. A thing is implemented to easily represent objects in the domain.
While searching things, asserting properties on things are implemented by Thing. Thing is subclassed to create a new entity in business domain.

- Required attributes.
Required attributes define a type of a thing. A thing with standard and division is a ClassRoom. A Classroom thing knows if it's a valid ClassRoom thing.


## ScheduleRules (TODO)
-> A system to represent rules a timetable must follow.
-> Able to represent constraints on attribute values of Things present in a TimeTable 

## TimeTableGenerator (TODO)
-> Given a list of Things,
-> Given a list of Rules,
-> Tells you if and why a time table cannot be generated or
-> Generates a timetable which satisfies all given rules.

