json.array!(@tasks) do |task|
  json.extract! task, :id, :content, :state, :board_id
  json.url task_url(task, format: :json)
end
