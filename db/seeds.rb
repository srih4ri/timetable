# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Classes 4 -5
# Subjects : English, Hindi, Malayalam, Maths, Science, Social, PT
# Teachers: Each subject has a special teacher


def object_persisted_msg(record)
  if record.previous_changes[:id].present?
    "Created new #{record.class} ID: #{record.id} : #{record.to_json}"
  else
    "Record found #{record.class} ID: #{record.id} : #{record.to_json}"
  end
end

def find_or_create_record_by_attribtues(collection, query_attributes, create_attributes)
  collection.find_by(query_attributes) || collection.create!(create_attributes)
end

def find_or_create_thing_by_attribtues(collection, query_attributes, create_attributes)
  existing_thing = collection.where("attrs @> hstore(:key, :value)",
    key: query_attributes.first.first, value: query_attributes.first.last
  ).first
  existing_thing || collection.create!(create_attributes)
end

def create_user( options = {} )
  user_attributes = { email: 'sam@example.com',
    password: 'welcome',
    first_name: "Sam",
    last_name: "Smith",
    role: "super_admin" }
  attributes = user_attributes.merge options
  user = find_or_create_record_by_attribtues(User, attributes.except(:password), attributes)
  puts object_persisted_msg(user)
end

def create_timetable_sheet( options = {} )
  timetable_sheet_attributes = {
    name: 'Timetable for 5C'
  }
  attributes = timetable_sheet_attributes.merge options
  timetable_sheet = find_or_create_record_by_attribtues(TimetableSheet, attributes, attributes)
  puts object_persisted_msg(timetable_sheet)
end

def create_teacher( options = {} )
  teacher_attributes = {
    name: 'Kumaran Saar'
  }
  attributes = teacher_attributes.merge options
  teacher = find_or_create_thing_by_attribtues(Teacher, {name: attributes[:name]}, {attrs: attributes})
  puts object_persisted_msg(teacher)
end

def create_classroom( options = {} )
  classroom_attributes = {
    name: 'Ozinja muri',
    std: '0',
    division: 'M'
  }
  attributes = classroom_attributes.merge options
  classroom = find_or_create_thing_by_attribtues(Classroom, {name: attributes[:name]}, {attrs: attributes})
  puts object_persisted_msg(classroom)
end

###
#User
sam = create_user email: 'sam@example.com'

#TimetableSheet
timetable_sheet = create_timetable_sheet name: "Time table for 5C", user: sam

#Teachers and Subject ids
[
  {name: 'Mattilda', subject_ids: [0]},

  {name: 'Preethi', subject_ids: [1]},

  {name: 'Rajesh', subject_ids: [2]},

  {name: 'Gopalan', subject_ids: [3]},

  {name: 'Shaheen', subject_ids: [4]},

  {name: 'Sudarsh', subject_ids: [5]},

  {name: 'Arpita', subject_ids: [6]},

  {name: 'Lena', subject_ids: [7]},

].each do |teacher_attrs|
  create_teacher(teacher_attrs)
end

[
  {name: '1', std: '1', division: '' },
  {name: '2', std: '2', division: '' },
  {name: '3', std: '3', division: '' },
  {name: '4', std: '4', division: '' },
  {name: '5', std: '5', division: '' },
].each do |classroom_attrs|
  create_classroom(classroom_attrs)
end

