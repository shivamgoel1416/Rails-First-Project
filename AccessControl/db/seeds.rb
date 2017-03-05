# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user_list = [['Shivam Goel','shivamgoel1008@gmail.com','vaibhavgl'],
['Rahul Negi','rahul1@gmail.com','rahul_123'],
['Anurag Barthwal','anurag@yahoo.com','anurag'],
['Priyanka Das','pdass@outlook.com','priyanka'],
['Anamika Oberai','oberai@gmail.com','anamika']]

# user_list.each do |username,email,password|
#     User.create(username: username,email: email,password: password)
# end

role_list = ['Admin',
'Employee',
'Manager',
'Consultant']

# role_list.each do |role_type|
#     Role.create(role_type: role_type)
# end

page_list = [['admin',1],
             ['employee',2],
            ['manager',3],
            ['consultant',4]]

 page_list.each do |page_name,role_id|
   Page.create(page_name: page_name,role_id: role_id)
 end
