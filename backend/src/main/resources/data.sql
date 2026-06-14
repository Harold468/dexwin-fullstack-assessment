INSERT INTO users (id, username, email, password) VALUES
    (1, 'alice', 'alice@dexwin.test', 'password123'),
    (2, 'bob', 'bob@dexwin.test', 'hunter2'),
    (3, 'carol', 'carol@dexwin.test', 'letmein')
ON CONFLICT (id) DO NOTHING;

INSERT INTO projects (id, name, description, owner_id) VALUES
    (1, 'Website Redesign', 'Revamp the marketing site', 1),
    (2, 'Mobile App', 'Build the v1 mobile client', 2)
ON CONFLICT (id) DO NOTHING;

INSERT INTO tasks (id, title, description, status, priority, project_id, assignee_id, created_at) VALUES
    (1, 'Design landing page', 'Hero, features, footer', 'IN_PROGRESS', 1, 1, 1, NOW()),
    (2, 'Set up CI pipeline', 'GitHub Actions build + test', 'TODO', 2, 1, 2, NOW()),
    (3, 'Implement login screen', 'Email + password auth', 'TODO', 1, 2, 3, NOW()),
    (4, 'Push notifications', 'Integrate FCM', 'DONE', 3, 2, 2, NOW())
ON CONFLICT (id) DO NOTHING;

INSERT INTO comments (id, content, task_id, author_id, created_at) VALUES
    (1, 'Started on the hero section', 1, 1, NOW()),
    (2, 'Use the new brand palette', 1, 2, NOW()),
    (3, 'Blocked on design tokens', 3, 3, NOW())
ON CONFLICT (id) DO NOTHING;

-- Advance identity sequences past the seeded rows so generated inserts don't collide.
SELECT setval(pg_get_serial_sequence('users', 'id'), (SELECT MAX(id) FROM users));
SELECT setval(pg_get_serial_sequence('projects', 'id'), (SELECT MAX(id) FROM projects));
SELECT setval(pg_get_serial_sequence('tasks', 'id'), (SELECT MAX(id) FROM tasks));
SELECT setval(pg_get_serial_sequence('comments', 'id'), (SELECT MAX(id) FROM comments));
