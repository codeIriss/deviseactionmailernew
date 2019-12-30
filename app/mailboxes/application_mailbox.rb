class ApplicationMailbox < ActionMailbox::Base
  
  routing :all => :comments
   

  # routing /something/i => :somewhere
end
