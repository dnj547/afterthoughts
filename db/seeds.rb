User.destroy_all
Calendar.destroy_all
Event.destroy_all
Afterthought.destroy_all
Attendee.destroy_all
EventAttendee.destroy_all
AfterthoughtAttendee.destroy_all


##User Seeds##
dan = User.create!(username:"DanFyfe",password:"123", password_confirmation: "123")#1
danielle = User.create!(username:"DanielleJasper", password:"123", password_confirmation: "123")#2
rob = User.create!(username:"RobOGara", password:"123", password_confirmation: "123")#3
jeff = User.create!(username:"JeffMarks", password:"123", password_confirmation: "123")#4

##Calendar Seeds##
c1 = Calendar.create!(user:dan,name:"Social")#1
c2 = Calendar.create!(user: dan,name:"Work")#2
c3 = Calendar.create!(user: danielle,name:"Social")#3
c4 = Calendar.create!(user: danielle,name:"Work")#4
c5 = Calendar.create!(user: rob,name:"Social")#5
c6 = Calendar.create!(user: rob,name:"Work")#6
c7 = Calendar.create!(user: jeff,name:"Social")#7
c8 = Calendar.create!(user: jeff,name:"Work")#8

#DateTime Seeds##
may05noon = DateTime.new(2019,5,5,12)
may05fivepm = DateTime.new(2019,5,5,17)
apr08onepm = DateTime.new(2019,4,8,13)
apr08twopm = DateTime.new(2019,4,8,14)
apr12onepm = DateTime.new(2019,4,12,13)
march01nineam = DateTime.new(2019,3,1,9)
march01tenam = DateTime.new(2019,3,1,10)


##Event Seeds##
e1 = Event.create!(calendar:c1,visibility:"public",organizer:"Mom", title:"Sunday Dinner",start:may05noon,end:may05fivepm,location:"Home")
e2 = Event.create!(calendar:c1,visibility:"public",organizer:"Dad",title:"game night",start:apr08onepm,end:apr12onepm,location:"Home")
e3 = Event.create!(calendar:c1,visibility:"public",organizer:"Dad",title:"game night",start:apr08onepm,end:apr12onepm,location:"Home")


##Afterthought Seeds##
at1 = Afterthought.create!(actual_location: "Home", actual_start: may05noon, actual_end: may05fivepm, actual_description: "It really was Sunday Dinner", thoughts:"It was great",rating:5, event: e1)
at2 = Afterthought.create!(actual_location: "Home", actual_start: apr08twopm, actual_end: apr12onepm, actual_description: "a fun game night", thoughts:"good",rating:4, event: e2)


##Attendee Seeds##
att1 = Attendee.create!(name:"Buddy",notes:"Kind of a jerk")
att2 = Attendee.create!(name:"The Other One",notes:"Blah Blah")
att3 = Attendee.create!(name:"Dad",notes:"ugh")
att4 = Attendee.create!(name:"Mom",notes:"ughhhh")

##EventAttendee Seeds##
ea1 = EventAttendee.create!(event: e1, attendee: att1)
ea2 = EventAttendee.create!(event: e1, attendee: att2)
ea3 = EventAttendee.create!(event: e2, attendee: att3)
ea3 = EventAttendee.create!(event: e3, attendee: att3)

##AfterthoughtAttendee Seeds##
aa1 = AfterthoughtAttendee.create!(afterthought: at1, attendee: att1)
aa2 = AfterthoughtAttendee.create!(afterthought: at1, attendee: att4)
aa3 = AfterthoughtAttendee.create!(afterthought: at2, attendee: att3)
aa4 = AfterthoughtAttendee.create!(afterthought: at2, attendee: att1)
