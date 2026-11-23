<?php
/*
 * MajorMatch - Save Quiz
 * Student 3: Quiz and Results
 *
 * Validates answers, calculates scores
 * and saves the quiz attempt in MySQL.
 */

require_once __DIR__ . '/db.php';

header('Content-Type: application/json; charset=utf-8');
header('Cache-Control: no-store');

// Send a JSON response
function reply($status, $body) {
    http_response_code($status);
    echo json_encode($body, JSON_UNESCAPED_UNICODE);
    exit;
}

// Only accept POST requests
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    reply(405, [
        'saved' => false,
        'error' => 'Method not allowed'
    ]);
}

// Read submitted answers
$input = json_decode(
    file_get_contents('php://input'),
    true
);

if (!is_array($input)) {
    reply(400, [
        'saved' => false,
        'error' => 'Invalid JSON'
    ]);
}

$session = $input['session'] ?? '';
$answers = $input['answers'] ?? null;

// Validate session and answer list
if (
    !is_string($session) ||
    !preg_match('/^[a-zA-Z0-9_-]{8,64}$/', $session) ||
    !is_array($answers) ||
    !$answers ||
    count($answers) > 100
) {
    reply(422, [
        'saved' => false,
        'error' => 'Invalid session or answers'
    ]);
}

// Connect to MySQL
$pdo = mm_pdo();

if (!$pdo) {
    reply(503, [
        'saved' => false,
        'error' => 'Database unavailable'
    ]);
}

// Only three supported majors
$majors = [
    'cs' => 0,
    'it' => 0,
    'ce' => 0
];

$dims = [];
$allowed = array_keys($majors);
$usedQuestions = [];
$clean = [];

try {

    // Count all quiz questions
    $expected = (int) $pdo->query(
        'SELECT COUNT(*) FROM quiz_questions'
    )->fetchColumn();

    if ($expected < 1 || count($answers) !== $expected) {
        reply(422, [
            'saved' => false,
            'error' => 'Incomplete quiz'
        ]);
    }

    // Get valid answer information from MySQL
    $stmt = $pdo->prepare(
        'SELECT
            o.id,
            o.question_id,
            o.score,
            o.score2,
            o.dim,
            m.slug AS m1,
            m2.slug AS m2
         FROM quiz_options o
         JOIN majors m ON m.id = o.major_id
         LEFT JOIN majors m2 ON m2.id = o.major2_id
         WHERE o.id = ? AND o.question_id = ?'
    );

    foreach ($answers as $answer) {

        if (
            !is_array($answer) ||
            !isset($answer['question_id'], $answer['option_id']) ||
            !filter_var($answer['question_id'], FILTER_VALIDATE_INT) ||
            !filter_var($answer['option_id'], FILTER_VALIDATE_INT)
        ) {
            reply(422, [
                'saved' => false,
                'error' => 'Invalid answer'
            ]);
        }

        $qid = (int) $answer['question_id'];
        $oid = (int) $answer['option_id'];

        // Prevent duplicate questions
        if (isset($usedQuestions[$qid])) {
            reply(422, [
                'saved' => false,
                'error' => 'Repeated question'
            ]);
        }

        $stmt->execute([$oid, $qid]);
        $row = $stmt->fetch();

        // Reject options belonging to removed majors
        if (!$row || !in_array($row['m1'], $allowed, true)) {
            reply(422, [
                'saved' => false,
                'error' => 'Option not allowed'
            ]);
        }

        $usedQuestions[$qid] = true;

        // Main major score
        $majors[$row['m1']] += (int) $row['score'];

        // Secondary major score
        if (in_array($row['m2'], $allowed, true)) {
            $majors[$row['m2']] += (int) $row['score2'];
        }

        // Track student interests
        if (
            is_string($row['dim']) &&
            $row['dim'] !== ''
        ) {
            $dims[$row['dim']] =
                ($dims[$row['dim']] ?? 0) + 1;
        }

        // Store selected question and option IDs
        $clean[] = [
            'question_id' => $qid,
            'option_id' => $oid
        ];
    }

    // Save or update the student's quiz attempt
    $insert = $pdo->prepare(
        'INSERT INTO quiz_results
         (
            session_id,
            answers_json,
            cs_score,
            it_score,
            ce_score,
            dims_json,
            answered
         )
         VALUES (?, ?, ?, ?, ?, ?, ?)
         ON DUPLICATE KEY UPDATE
            answers_json = VALUES(answers_json),
            cs_score = VALUES(cs_score),
            it_score = VALUES(it_score),
            ce_score = VALUES(ce_score),
            dims_json = VALUES(dims_json),
            answered = VALUES(answered),
            updated_at = CURRENT_TIMESTAMP'
    );

    $insert->execute([
        $session,
        json_encode($clean, JSON_UNESCAPED_UNICODE),
        $majors['cs'],
        $majors['it'],
        $majors['ce'],
        json_encode($dims, JSON_UNESCAPED_UNICODE),
        count($clean)
    ]);

    // Successful response
    reply(200, [
        'saved' => true,
        'majors' => $majors,
        'answered' => count($clean)
    ]);

} catch (PDOException $ex) {

    error_log(
        'MajorMatch save-quiz error: ' .
        $ex->getMessage()
    );

    reply(503, [
        'saved' => false,
        'error' => 'Database table or connection unavailable'
    ]);
}