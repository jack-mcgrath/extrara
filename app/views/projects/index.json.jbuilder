json.array!(@projects) do |project|
  json.extract! project, :id, :title, :subtitle, :des, :s1, :s2, :s3, :s4, :s5
  json.url project_url(project, format: :json)
end
