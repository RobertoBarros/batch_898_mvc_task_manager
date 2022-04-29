class View
  def list(tasks)
    tasks.each_with_index do |task, index|
      done = task.done? ? '[X]' : '[ ]'
      puts "#{index + 1} - #{done} #{task.description}"
    end
  end

  def ask_description
    puts "Enter task description"
    gets.chomp
  end

  def ask_index
    puts "Enter task index:"
    gets.chomp.to_i - 1
  end
end
