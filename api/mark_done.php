<?php
// api/mark_done.php
require_once __DIR__ . '/../config/helpers.php';
require_once __DIR__ . '/../config/db.php';
require_once __DIR__ . '/../config/achievement_checker.php';

if ($_SERVER['REQUEST_METHOD'] !== 'POST') jsonErr('POST only', 405);
$userId = requireAuth();

$letter = inputJson('letter');
$category = inputJson('category');

if (!$letter || !$category) jsonErr('Missing letter or category');

$db = getDB();

// We insert a manual successful history record so it counts as mastered
$stmt = $db->prepare('INSERT INTO history (user_id, letter, confidence, is_correct, category) VALUES (?, ?, 1.0, 1, ?)');
$stmt->execute([$userId, $letter, $category]);

// Check if this new activity triggers any achievements
$newAchievements = checkAndAwardAchievements($db, $userId);

jsonOk([ 'new_achievements' => $newAchievements ]);
