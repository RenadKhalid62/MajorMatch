<?php
$page_title = 'Major Quiz';
$active = 'try';
$scripts = ['quiz.js'];

include __DIR__ . '/header.php';

// The three supported majors
$allowedMajors = [
    'cs' => true,
    'it' => true,
    'ce' => true
];

// Get majors from database
$slugById = [];

foreach (mm_rows('majors') as $m) {
    $slugById[(int) $m['id']] = $m['slug'];
}

// Load quiz questions and options
$questions = mm_rows('quiz_questions');
$options = mm_rows('quiz_options');
$letters = ['A', 'B', 'C', 'D'];
?>

<section class="page-head">
  <div class="container">
    <p class="eyebrow">Step 4 · Quiz</p>
    <h1>What fits the way you think?</h1>
    <p class="muted">
      No right answers. Choose what sounds most fun.
    </p>
  </div>
</section>

<section class="section">
  <div class="container quiz-wrap">

    <p class="muted small" id="quizCount"></p>

    <div class="progress">
      <div id="quizBar"></div>
    </div>

    <div class="card" style="margin-top:18px">

      <?php foreach ($questions as $q): ?>

        <div
          class="quiz-q"
          data-question-id="<?= (int) $q['id'] ?>"
        >

          <h2><?= e($q['question']) ?></h2>

          <?php
          $i = 0;

          foreach ($options as $o):

              if ((int) $o['question_id'] !==
                  (int) $q['id']) {
                  continue;
              }

              $mainSlug =
                  $slugById[(int) $o['major_id']] ?? null;

              // Skip removed majors
              if (!$mainSlug ||
                  !isset($allowedMajors[$mainSlug])) {
                  continue;
              }

              $secondarySlug = !empty($o['major2_id'])
                  ? ($slugById[(int) $o['major2_id']] ?? null)
                  : null;
          ?>

            <button
              type="button"
              class="quiz-option"

              data-option-id="<?= (int) $o['id'] ?>"

              data-m1="<?= e($mainSlug) ?>"
              data-s1="<?= (int) $o['score'] ?>"

              <?php if (
                  $secondarySlug &&
                  isset($allowedMajors[$secondarySlug])
              ): ?>

                data-m2="<?= e($secondarySlug) ?>"
                data-s2="<?= (int) $o['score2'] ?>"

              <?php endif; ?>

              data-dim="<?= e($o['dim'] ?? '') ?>"
            >

              <span class="letter">
                <?= e($letters[$i] ?? (string) ($i + 1)) ?>
              </span>

              <?= e($o['option_text']) ?>

            </button>

          <?php
              $i++;
          endforeach;
          ?>

        </div>

      <?php endforeach; ?>

      <div class="quiz-nav">

        <button
          type="button"
          class="btn btn-soft"
          id="quizBack"
        >
          Back
        </button>

        <button
          type="button"
          class="btn btn-primary"
          id="quizNext"
          disabled
        >
          Next
        </button>

      </div>

    </div>
  </div>
</section>

<?php include __DIR__ . '/footer.php'; ?>