FactoryGirl.define do
  factory :user do
    first_name "Jane"
    last_name "Doe"
    username "janedoe"
    email "janedoe@email.com"
    password "password"
    password_confirmation "password"
    role 0
  end

  factory :admin, class: User do
    first_name "Admin"
    last_name "Jane"
    username "admin"
    email "admin@email.com"
    password "password"
    password_confirmation "password"
    role 1
  end

  factory :category do
    title "programming"
  end

  factory :gif do
    title "programming"
    image_path "http://s2.quickmeme.com/img/cf/cfb22a3d590a0199837557503630b6c028ab01ed09ef5dcec434a7c33090d816.jpg"
  end
end
