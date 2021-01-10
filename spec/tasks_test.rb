
require 'httparty'

RSpec.describe 'Validar a api de tarefas' do

  example_task = {
    :title => 'Titulo da tarefa de teste',
    :description => 'Descrição da tarefa de teste'
  }

  task_id = 0;

  it 'Listando tarefas' do
    response = HttParty.get('/tasks')
    expect(response.code).to eql(200)
  end  

  it 'Criando tarefa' do
    response = HttParty.post('/tasks', :body => example_task)

    expect(response.code).to eql(200)

    task_id = response.parsed_response["data"]["id"]
  end

  it 'Visualizando tarefa criada' do
    response = HttParty.get("/tasks/#{task_id}")
    expect(response.code).to eql(200)

    task = response.parsed_response["data"]
    expect(task["id"]).to eql(task_id)
    expect(task["title"]).to eql(example_task[:title])
    expect(task["description"]).to eql(example_task[:description])
  end

  it 'Visualizando tarefa inexistente' do
    response = HttParty.get("/tasks/0")
    expect(response.code).to eql(404)
  end

  it 'Alterando tarefa criada' do
    updated_task = example_task = {
      :title => 'Titulo da tarefa de teste alterado',
      :description => 'Descrição da tarefa de teste alterado'
    }

    response = HttParty.put("/tasks/#{task_id}", :body => updated_task)
    expect(response.code).to eql(200)

    task = response.parsed_response["data"]
    expect(task["id"]).to eql(task_id)
    expect(task["title"]).to eql(updated_task[:title])
    expect(task["description"]).to eql(updated_task[:description])
  end

  it 'Deletando tarefa criada' do
    response = HttParty.delete("/tasks/#{task_id}")
    expect(response.code).to eql(200)
  end
end