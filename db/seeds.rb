# encoding: UTF-8

['getter', 'teacher', 'principal', 'admin'].each do |role|
  Role.find_or_create_by_name role
end

school = School.find_or_create_by_name_and_domain 'sp47', 'sp47'

unless school.users.find_by_username 'root'
  user = school.users.create! :username => 'root', :password => '1234qwer', :password_confirmation => '1234qwer'
  user.role = Role.find_by_name 'admin'
  user.save! 
end

school.weights.find_or_create_by_name 'aktywność'
school.weights.find_or_create_by_name 'odzpowiedź'
school.weights.find_or_create_by_name 'klasówka'
school.weights.find_or_create_by_name 'kartkówka'
school.weights.find_or_create_by_name 'praca domowa'
