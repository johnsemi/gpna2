 member ||= @member

  json.id member['id']
  json.firstname member['firstname']
  json.lastname member['lastname']
  json.orgname member['orgname']
  json.joindate member['joindate']
  if member.class == Hash
    json.active
  Donation.find(member['id']).active_for_user?(@api_key.user)
  else
    json.active member.active_for_user?(@api_key.user)
  end

  if member.class == ActiveRecord::Base && !member.persisted? &&
  !member.valid?
    json.errors member.errors.messages
  end