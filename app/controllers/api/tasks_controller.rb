module Api
    class TasksController < ApplicationController   

        # Listar todas as tarefas
        def index
            tasks = Task.where(deleted_at: nil).order('done_at DESC');
            render json: {status:'SUCCESS', message:'Listando tarefas.', data:tasks}, status: :ok
        end

        # Listar tarefa por ID
        def show
            task = Task.find(params[:id])
            render json: {status:'SUCCESS', message:'Exibindo tarefa.', data:task}, status: :ok
        end
        
        # Criar tarefa
        def create
            task = Task.new(task_params)
            if task.save
                render json: {status:'SUCCESS', message:'Tarefa criada!', data:task}, status: :ok
            else
                render json: {status:'ERROR', message:'Erro ao criar tarefa.', data:task.erros}, status: :unprocessable_entity
            end
        end

        # Atualizar tarefa
        def update
            task = Task.find(params[:id])
            if task.update(update_params)
                render json: {status:'SUCCESS', message:'Tarefa atualizada!', data:task}, status: :ok
            else
                render json: {status:'ERROR', message:'Erro ao atualizar tarefa.', data:task.erros}, status: :unprocessable_entity
            end
        end

        # Excluir tarefa
        def destroy
            task = Task.find(params[:id])
            task.soft_delete
            render json: {status:'SUCCESS', message:'Tarefa deletada!', data:task}, status: :ok
        end

        # Parametros aceitos
        private
        def create_params
            params.require(:title, :description, :done_at)
        end

        def update_params
            params.permit(:title, :description)
        end
    end
end