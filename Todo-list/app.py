from bottle import get, run, static_file, post, request, delete
import sqlite3 as sq

# Establish a global database connection and cursor
conn = sq.connect('data.db')
c = conn.cursor()

def get_todos_html():
    c.execute("SELECT * FROM todos")
    todos = c.fetchall()

    html = ''
    for todo in todos:
        checked = 'checked' if todo[2] else ''
        todo_item_class = "line-through" if todo[2] else ""
        html += f'''
            <div id="todo-{todo[0]}" class="flex items-center">
                <input type="checkbox" class="form-checkbox h-5 w-5 text-blue-600" {checked} hx-post="/api/todos/{todo[0]}/toggle" hx-target="#todo-list">
                <span class="ml-2 text-lg {todo_item_class}">{todo[1]}</span>
                <button class="ml-auto text-red-600" hx-delete="/api/todos/{todo[0]}" hx-target="#todo-list">x</button>
            </div>
        '''
    return html

@get('/')
def index():
    return static_file('index.html', root='public')

@get("/api/todos")
def get_all_todos():
    return get_todos_html()

@post("/api/todos")
def create_todo():
    todo = request.forms.get('todo')
    c.execute("INSERT INTO todos (content, done) VALUES (?, ?)", (todo, False))
    conn.commit()
    return get_todos_html()

@delete("/api/todos/<todo_id>")
def delete_todo(todo_id):
    c.execute("DELETE FROM todos WHERE id=?", (todo_id,))
    conn.commit()
    return get_todos_html()

@post("/api/todos/<todo_id>/toggle")
def toggle_todo(todo_id):
    c.execute("SELECT done FROM todos WHERE id=?", (todo_id,))
    current_status = c.fetchone()[0]
    new_status = not current_status
    c.execute("UPDATE todos SET done=? WHERE id=?", (new_status, todo_id))
    conn.commit()
    return get_todos_html()

if __name__ == "__main__":
    run(host='localhost', port=8080, debug=True, reloader=True)
