Factory.define :valid_user , :class => User do |u|
  u.login "kalpesh"
  u.email "kdave@fourthmedia.co.uk"
  u.password "123123"
  u.password_confirmation "123123"
  u.perishable_token "mGyffCmtFALP8SvRtXkW"
  u.single_access_token "k3cFzLIQnZ4MHRmJvJzg"
end

Factory.define :invalid_user , :class => User do |u|
  u.login "test"
  u.password "password"
  u.password_confirmation "incorrect"
  u.email "test@fourthmedia.co.uk"
  u.single_access_token "k3cFzLIQnZ4MHRmJvJzg"
end