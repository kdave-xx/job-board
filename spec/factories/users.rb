Factory.define :valid_user , :class => User do |u|
  u.login "mathieu"
  u.password "mathieu"
  u.password_confirmation "mathieu"
  u.email "mathieu@fourthmedia.co.uk"
  u.single_access_token "k3cFzLIQnZ4MHRmJvJzg"
end

Factory.define :invalid_user , :class => User do |u|
  u.login "test"
  u.password "password"
  u.password_confirmation "incorrect"
  u.email "test@fourthmedia.co.uk"
  u.single_access_token "k3cFzLIQnZ4MHRmJvJzg"
end