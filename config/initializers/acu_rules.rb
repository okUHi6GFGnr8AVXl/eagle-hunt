# This is an examble, modify it as well
Acu::Rules.define do
  # anyone make a request could be count as everyone!
  whois :everyone { true }
  # folks who signed in
  whois :signed_in, args: [:user] { |user| user }
  # folks who didn't signed in
  whois :guest, args: [:user] { |user| not user }
  # other user entities
  [
    :ADMIN, :GRAPHIC, :FANI,
    :MARKETER, :MARKLINE, :NAGASH,
    :NAJAR, :PR, :CLIENT, :KANDE
  ].each do |symbol|
    whois symbol.downcase.to_sym, args: [:user] { |user| user and user.user_type && user.user_type.symbol == symbol.to_s }
  end
  
  # employees are those who are members and not (:ADMIN or :CLIENT) 
  whois :employee, args: [:user] { |user| user and user.user_type && not([:ADMIN, :CLIENT].include? user.user_type.symbol.to_sym) }

  # by default admin can go everywhere
  allow :admin

  # default namespace
  namespace except: [:profiles] do
    allow :everyone
  end

  namespace do
    controller :profiles do
      deny :everyone, on: [:destroy]
      allow :signed_in
    end
  end

  namespace :admin do
    # define the none-destroyable controllers
    controller [:users, :user_types, :furniture_specs] do
      deny :everyone, on: [:destroy]
    end
    # allowing employees to see the list images for a furniture
    controller :furnitures do
      allow :employee, on: [:list_images]
    end
  end
  
  namespace :employee do
    allow :employee
    # people can only create new stuff in database
    # not updating them
    deny  :everyone, on: [:destroy, :update, :new, :show]
    
    controller :home do
      deny :employee, on: [:as]
    end
  end

  # devise login namespace
  namespace :devise, :users do
    allow :everyone
  end
end