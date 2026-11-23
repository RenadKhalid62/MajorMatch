<?php
// Return courses as JSON for the study plans and compare pages.
require_once DIR . '/db.php';
header('Content-Type: application/json; charset=utf-8');

// Match each course's major ID with its major name.
$majors = mm_rows('majors');
$slugById = [];

foreach ($majors as $major) {
    $slugById[$major['id']] = $major['slug'];
}

// If a major was selected, return its courses only.
$where = [];

if (isset($_GET['major']) && $_GET['major'] !== '') {
    $major = mm_major($_GET['major']);

    if (!$major) {
        echo json_encode([]);
        exit;
    }

    $where['major_id'] = $major['id'];
}

// Get the courses and prepare the JSON data.
$courses = [];

foreach (mm_rows('courses', $where) as $course) {
    if (!isset($slugById[$course['major_id']])) continue;

    $courses[] = [
        'major' => $slugById[$course['major_id']],
        'level' => (int) $course['level'],
        'code' => $course['course_code'],
        'name' => $course['course_name'],
        'name_ar' => $course['course_name_ar'] ?? $course['course_name'],
        'name_en' => $course['course_name_en'] ?? '',
        'credits' => (int) $course['credit_hours'],
        'prerequisite' => $course['prerequisite'],
        'sample' => (int) $course['is_sample'] === 1,
    ];
}

echo json_encode($courses, JSON_UNESCAPED_UNICODE);