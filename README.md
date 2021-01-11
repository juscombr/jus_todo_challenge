# TODOLIST - API

API de lista de tarefas

## Instruções para executar o projeto:

### ambiente

* Ruby 2.7

* Rails 6.1.0

### dependências do projeto

- faker
- rspec
- rake
- httparty

### criando banco de dados

- `rails db:create`
- `rails db:migrate`
- `rails db:seed`

### executando projeto

- `rails s`

### executando testes

- `rake spec`

## Rotas da API

| Verb | URI  Pattern | Controller#Action|
|------|--------------|------------------|
|GET  |  /api/tasks(.:format) | api/tasks#index |
|POST |  /api/tasks(.:format) | api/tasks#create|
|GET  |  /api/tasks/:id(.:format) | api/tasks#show|
|PATCH | /api/tasks/:id(.:format) | api/tasks#update|
|PUT   | /api/tasks/:id(.:format) | api/tasks#update|
|DELETE| /api/tasks/:id(.:format) | api/tasks#destroy|
