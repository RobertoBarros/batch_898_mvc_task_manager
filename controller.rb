class Controller
  def initialize(repository)
    @repository = repository
    @view = View.new
  end

  def list
    # 1. Pegar todas as tasks do repositório
    tasks = @repository.all
    # 2. Mandar a view exibir as tasks
    @view.list(tasks)
  end

  def add
    # 1. Perguntar para o usuário qual a descrição da task
    description = @view.ask_description
    # 2. Instanciar a task
    task = Task.new(description)

    # 3. Adicionar a task ao repositório
    @repository.add_task(task)
  end

  def destroy
    # 1. Listar todas as task
    list

    # Perguntar o index da task a ser removida
    index = @view.ask_index

    # Mandar o repositório remover a task
    @repository.remove_task(index)
  end

  def mark_as_done
    # 1. Listar todas task
    list
    # 2. Perguntar o index da task
    index = @view.ask_index

    # 3. Mandar o repositorio marcar como done
    @repository.mark_as_done(index)
  end


end
