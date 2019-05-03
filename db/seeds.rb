User.destroy_all
Calendar.destroy_all
Event.destroy_all
Afterthought.destroy_all


##User Seeds##
dan = User.create!(username:"DanFyfe",password_digest: "password")#1
danielle = User.create!(username:"DanielleJasper", password_digest: "password")#2
rob = User.create!(username:"RobOGara", password_digest: "password")#3
jeff = User.create!(username:"JeffMarks", password_digest: "password")#4

##Calendar Seeds##
calendar1 = Calendar.create!(user:dan,name:"Social")#1
Calendar.create!(user: dan,name:"Work")#2
Calendar.create!(user: danielle,name:"Social")#3
Calendar.create!(user: danielle,name:"Work")#4
Calendar.create!(user: rob,name:"Social")#5
Calendar.create!(user: rob,name:"Work")#6
Calendar.create!(user: jeff,name:"Social")#7
Calendar.create!(user: jeff,name:"Work")#8

#DateTime Seeds##
may05noon = DateTime.new(2019,05,05,12)
may05five = DateTime.new(2019,05,05,17)


##Events Seeds##
 event1 = Event.create!(calendar: calendar1,visibility:"public",organizer:"Mom", title:"Sunday Dinner",start:may05noon,end:may05five,location:"Home")


##Afterthought Seeds##
Afterthought.create!(actual_location: "Home", actual_start: may05noon, actual_end: may05five, actual_description: "It really was Sunday Dinner", thoughts:"It was great",rating:5, event: event1)


##Attendee Seeds##
Attendee.create!(name:"Buddy",notes:"Kind of a jerk")
Attendee.create!(name:"The Other One",notes:"Blah Blah")



