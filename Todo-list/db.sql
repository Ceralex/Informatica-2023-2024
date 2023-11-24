-- todos(pk: id, content, done)
CREATE TABLE IF NOT EXISTS todos (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  content TEXT NOT NULL,
  done BOOLEAN DEFAULT 0
);