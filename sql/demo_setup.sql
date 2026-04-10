-- sql/demo_setup.sql
-- Run this to create 5 demo users with varying levels of progress.
-- Default password for all: 'password123' (hash: $2y$10$Wydte.TtOKQ0FrzIey11OOayw.L1gfkpptUIV/a8jUfCD4HEiplYi)

USE signbridge;

-- Clear any existing demo users if you want, or just append.
-- DELETE FROM users WHERE email LIKE '%@demo.com';

-- 1. Beginner User (Level 1, No progress)
INSERT INTO users (name, email, password, role, xp, level, streak, created_at)
VALUES ('Beginner Ben', 'beginner@demo.com', '$2y$10$Wydte.TtOKQ0FrzIey11OOayw.L1gfkpptUIV/a8jUfCD4HEiplYi', 'user', 0, 1, 0, NOW());

-- 2. Alphabet Master (Level 3, All alphabets mastered)
INSERT INTO users (id, name, email, password, role, xp, level, streak, created_at)
VALUES (102, 'Alphabet Alice', 'alice@demo.com', '$2y$10$Wydte.TtOKQ0FrzIey11OOayw.L1gfkpptUIV/a8jUfCD4HEiplYi', 'user', 450, 3, 5, NOW());

-- Add history for all 26 letters (3 correct each)
-- A-M (Lesson 0)
INSERT INTO lesson_progress (user_id, lesson_id, completed, score) VALUES (102, 0, 1, 100);
-- N-Z (Lesson 1)
INSERT INTO lesson_progress (user_id, lesson_id, completed, score) VALUES (102, 1, 1, 100);

-- Loop simulation for Alice (A-Z)
-- Just adding a few to history for the "Rule of 3" badges
INSERT INTO history (user_id, letter, is_correct, category) VALUES (102, 'A', 1, 'alphabet'),(102, 'A', 1, 'alphabet'),(102, 'A', 1, 'alphabet');
INSERT INTO history (user_id, letter, is_correct, category) VALUES (102, 'B', 1, 'alphabet'),(102, 'B', 1, 'alphabet'),(102, 'B', 1, 'alphabet');

-- 3. Mid Learner (Level 5, Alphabets + Greetings)
INSERT INTO users (id, name, email, password, role, xp, level, streak, created_at)
VALUES (103, 'Charlie Greetings', 'charlie@demo.com', '$2y$10$Wydte.TtOKQ0FrzIey11OOayw.L1gfkpptUIV/a8jUfCD4HEiplYi', 'user', 850, 5, 12, NOW());

INSERT INTO lesson_progress (user_id, lesson_id, completed, score) VALUES (103, 0, 1, 100), (103, 1, 1, 100), (103, 2, 1, 85);

-- 4. Advanced Learner (Level 7, Alphabets + Greetings + Numbers)
INSERT INTO users (id, name, email, password, role, xp, level, streak, created_at)
VALUES (104, 'David Numbers', 'david@demo.com', '$2y$10$Wydte.TtOKQ0FrzIey11OOayw.L1gfkpptUIV/a8jUfCD4HEiplYi', 'user', 1400, 7, 20, NOW());

INSERT INTO lesson_progress (user_id, lesson_id, completed, score) VALUES (104, 0, 1, 100), (104, 1, 1, 100), (104, 2, 1, 100), (104, 3, 1, 95);

-- 5. Expert User (Level 12, 100% platform completion)
INSERT INTO users (id, name, email, password, role, xp, level, streak, created_at)
VALUES (105, 'Expert Emma', 'emma@demo.com', '$2y$10$Wydte.TtOKQ0FrzIey11OOayw.L1gfkpptUIV/a8jUfCD4HEiplYi', 'user', 2500, 12, 45, NOW());

INSERT INTO lesson_progress (user_id, lesson_id, completed, score) VALUES (105, 0, 1, 100), (105, 1, 1, 100), (105, 2, 1, 100), (105, 3, 1, 100), (105, 4, 1, 100);

-- Add achievements for Emma
INSERT INTO user_achievements (user_id, achievement_id) VALUES (105, 1), (105, 2), (105, 3), (105, 4), (105, 7), (105, 10);
