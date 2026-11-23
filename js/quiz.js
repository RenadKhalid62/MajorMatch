/*
 * MajorMatch - Student 3
 * Quiz navigation, scoring and database save.
 * Uses quiz.php data and existing MMState from main.js.
 */
document.addEventListener('DOMContentLoaded', function () {
  var qs = $all('.quiz-q');
  var bar = $('#quizBar');
  var count = $('#quizCount');
  var next = $('#quizNext');
  var back = $('#quizBack');

  if (!qs.length || !bar || !count || !next || !back) return;

  var current = 0;
  var picks = [];
  var saving = false;

  function show(index) {
    qs.forEach(function (q, i) {
      q.style.display = (i === index) ? 'block' : 'none';
    });

    bar.style.width =
      Math.round(index / qs.length * 100) + '%';

    count.textContent =
      'Question ' + (index + 1) + ' of ' + qs.length;

    back.style.visibility =
      index === 0 ? 'hidden' : 'visible';

    next.textContent =
      index === qs.length - 1 ? 'See my result' : 'Next';

    next.disabled = !picks[index] || saving;
  }

  qs.forEach(function (q, questionIndex) {
    $all('.quiz-option', q).forEach(function (option) {
      option.addEventListener('click', function () {
        if (saving) return;

        $all('.quiz-option', q).forEach(function (item) {
          item.classList.remove('chosen');
        });

        option.classList.add('chosen');
        picks[questionIndex] = option;
        next.disabled = false;
      });
    });
  });

  next.addEventListener('click', function () {
    if (saving || !picks[current]) return;

    if (current < qs.length - 1) {
      current++;
      show(current);
    } else {
      finishQuiz();
    }
  });

  back.addEventListener('click', function () {
    if (saving) return;

    if (current > 0) {
      current--;
      show(current);
    }
  });

  async function finishQuiz() {
    if (
      picks.length !== qs.length ||
      picks.some(function (p) { return !p; })
    ) {
      alert('Please answer all questions first.');
      return;
    }

    var majors = { cs: 0, it: 0, ce: 0 };
    var dims = {};
    var answers = [];

    qs.forEach(function (q, i) {
      var option = picks[i];
      var mainMajor = option.dataset.m1;
      var secondMajor = option.dataset.m2;

      if (
        Object.prototype.hasOwnProperty.call(
          majors, mainMajor
        )
      ) {
        majors[mainMajor] +=
          Number(option.dataset.s1) || 0;
      }

      if (
        secondMajor &&
        Object.prototype.hasOwnProperty.call(
          majors, secondMajor
        )
      ) {
        majors[secondMajor] +=
          Number(option.dataset.s2) || 0;
      }

      if (option.dataset.dim) {
        dims[option.dataset.dim] =
          (dims[option.dataset.dim] || 0) + 1;
      }

      answers.push({
        question_id: Number(q.dataset.questionId),
        option_id: Number(option.dataset.optionId)
      });
    });

    // Save the quiz result in browser storage
    var state = MMState.get();

    state.quiz = {
      majors: majors,
      dims: dims,
      answered: answers.length
    };

    MMState.save(state);

    saving = true;
    next.disabled = true;
    back.disabled = true;
    next.textContent = 'Saving...';

    try {
      // Send answers to PHP for database storage
      var response = await fetch('save-quiz.php', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({
          session: state.session,
          answers: answers
        })
      });

      var data = await response.json();

      if (!response.ok || !data.saved) {
        throw new Error(
          data.error || 'Database save failed'
        );
      }

      // Use scores validated by the server
      state.quiz.majors = data.majors;
      state.quiz.answered = data.answered;
      MMState.save(state);

    } catch (error) {
      console.error('MajorMatch quiz save:', error);

      alert(
        'Your result is available, but it was NOT ' +
        'saved to MySQL. Please check the database ' +
        'connection later.'
      );
    }

    // Open the result page
    location.href = 'result.php';
  }

  show(0);
});
