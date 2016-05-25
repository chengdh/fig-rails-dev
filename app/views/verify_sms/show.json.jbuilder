json.id @verify_sm.id
json.mobile @verify_sm.mobile
json.verify_type @verify_sm.verity_type
json.verify_code @verify_sm.verify_code
json.is_used @verify_sm.is_used
json.user_id User.find_by(phone: @verify_sm.mobile).try(:id)
