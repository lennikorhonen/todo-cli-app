require 'yaml'

# Show current tasks in tasks.yml
def show
  tasks_file = YAML.load_file('tasks.yml')
  puts tasks_file['tasks']
end

# Adds new task to tasks.yml
def add_task(name:, category:, has_deadline: false, deadline: '0000-00-00', done: false)
  tasks = YAML.load_file('tasks.yml')

  new_id = tasks['tasks'].length + 1
  new_task = {
    "task_#{new_id}" => [
      { 'name' => name },
      { 'category' => category },
      { 'has_deadline' => has_deadline },
      { 'deadline' => deadline },
      { 'done' => done }
    ]
  }
  tasks['tasks'].merge!(new_task)
  File.open('tasks.yml', 'w') do |f|
    f.write(tasks.to_yaml)
  end
end

def edit_task(id, name, category, has_deadline: false, deadline: '0000-00-00', done: false)
end

def delete_task(id)
end

def mark_as_done(id)
end

show
add_task(name: 'test', category: 'easy')
