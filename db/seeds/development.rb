admin = User.create!(:email => "datong@berkeley.edu", :password => "datong", :fname => "Admin", :lname => "Datong", :is_core_member => true, :is_event_admin => true, :is_account_admin => true)
admin.confirm
admin.save!
#nathan = User.create!(:email => "nathan.su@berkeley.edu", :password => "password", :fname => "Nathan", :lname => "Su")
#jay.skip_confirmation!
#jay.save!
#nathan.skip_confirmation!
#nathan.save!
