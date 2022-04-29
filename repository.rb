require 'csv'

class Repository
  def initialize(csv_filename)
    @csv_filename = csv_filename
    @tasks = load_csv
  end

  def add_task(task)
    @tasks << task
    save_csv
  end

  def remove_task(index)
    @tasks.delete_at(index)
    save_csv
  end

  def mark_as_done(index)
    task = @tasks[index]
    task.done!
    save_csv
  end

  def all
    @tasks
  end

  private

  def save_csv
    CSV.open(@csv_filename, 'wb') do |csv|
      @tasks.each do |task|
        csv << [task.description, task.done?]
      end
    end
  end

  def load_csv
    tasks = []

    CSV.foreach(@csv_filename) do |row|
      description = row[0]
      done = row[1] == 'true'

      task = Task.new(description)
      task.done! if done

      tasks << task
    end

    tasks
  end
end
