// Show study plans for the selected major.
document.addEventListener('DOMContentLoaded', function () {
var tabs = $('#planTabs');
if (!tabs) return;

var current = new URLSearchParams(location.search).get('major');
if (!MAJORS[current]) current = 'cs';

var courses = [];

// Create major buttons.
Object.keys(MAJORS).forEach(function (major) {
var btn = document.createElement('button');

btn.className = 'pick-card';
btn.dataset.m = major;
btn.innerHTML =
  '<span>' + MAJORS[major].icon + '</span>' +
  '<b>' + MAJORS[major].name + '</b>';

btn.addEventListener('click', function () {
  current = major;
  render();
});

tabs.appendChild(btn);
});

$('#courseSearch').addEventListener('input', render);

// Display the selected plan.
function render() {
$all('.pick-card', tabs).forEach(function (btn) {
btn.classList.toggle('selected', btn.dataset.m === current);
});

var term = $('#courseSearch').value.trim().toLowerCase();

var mine = courses.filter(function (course) {
  return course.major === current;
});

var requiredCourses = mine.filter(function (course) {
  return !course.course_type || course.course_type === 'required';
});

$('#planSummary').textContent =
  MAJORS[current].name + ' · ' + mine.length + ' courses';

var html = '';
var found = 0;

// Display courses by level.
for (var level = 1; level <= 10; level++) {
  var list = requiredCourses.filter(function (course) {
    return Number(course.level) === level &&
      (!term || (course.name + ' ' + course.code).toLowerCase().includes(term));
  });

  found += list.length;

  if (!list.length && term) continue;

  html += '<section class="level">' +
    '<h3><span class="level-badge">' + level + '</span> Level ' + level + '</h3>' +
    '<div class="course-grid">' +
    (list.length ? list.map(card).join('') : '<p class="muted">No courses listed.</p>') +
    '</div></section>';
}

// Display electives.
['major_elective', 'free_elective'].forEach(function (type) {
  var electives = mine.filter(function (course) {
    return course.course_type === type &&
      (!term || (course.name + ' ' + course.code).toLowerCase().includes(term));
  });

  found += electives.length;
  if (!electives.length && term) return;

  html += '<section class="level"><h3>' +
    (type === 'major_elective' ? 'Major Electives (Major Requirements)' : 'Free Electives (Category Requirements)') +
    '</h3><div class="course-grid">' +
    (electives.length ? electives.map(card).join('') : '<p class="muted">No courses listed.</p>') +
    '</div></section>';
});

$('#planLevels').innerHTML = found || !term
  ? html
  : '<p class="muted">No matching courses found.</p>';
}

// Create a course card.
function card(course) {
return '<div class="course-card">' +
'<span class="code">' + course.code + '</span>' +
'<h4>' + course.name + '</h4>' +
'<div class="course-meta">' +
'<span>⏱ ' + course.credits + ' credit hours</span>' +
'<span>' + (course.prerequisite ? 'Prerequisite: ' + course.prerequisite : 'No prerequisite') + '</span>' +
'<span>Type: ' + (course.course_type || 'required') + '</span>' +
'</div></div>';
}

// Load courses.
fetch('get-courses.php')
.then(function (response) {
return response.json();
})
.then(function (data) {
courses = data;
render();
})
.catch(function () {
$('#planLevels').innerHTML =
'<p class="warn">Could not load courses. Please check the PHP server.</p>';
});
});