  json.members @members, partial: 'api/v1/members/show', as: :member
  json.total_count @members.respond_to?(:total_entries) ?
  @members.total_entries : @members.to_a.count