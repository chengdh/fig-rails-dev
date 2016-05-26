json.id @user.id
json.user_name @user.user_name
json.email @user.email
json.phone @user.phone
json.errors @user.errors.blank? ? "" : @user.errors.values.join(";")
