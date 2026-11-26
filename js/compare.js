// Compare selected majors using their course codes.
document.addEventListener('DOMContentLoaded', function () {
var picker = document.getElementById('comparePicker');
if (!picker) return;

var slugs = Object.keys(MAJORS);
var selected = [];
var params = new URLSearchParams(window.location.search).get('majors');

if (params) {
selected = Array.from(new Set(
params.split(',').filter(function (major) {
return MAJORS[major];
})
)).slice(0, 3);
}

if (selected.length < 2) selected = ['cs', 'it'];

var allCourses = [];
var compareMsg = document.getElementById('compareMsg');
var topicTable = document.getElementById('topicTable');
var sharedCount = document.getElementById('sharedCount');
var differCount = document.getElementById('differCount');
var sharedList = document.getElementById('sharedList');
var differList = document.getElementById('differList');

// Escape text before displaying it.
function escapeHTML(value) {
return String(value == null ? '' : value).replace(/[&<>"']/g, function (char) {
return {
'&': '&amp;',
'<': '&lt;',
'>': '&gt;',
'"': '&quot;',
"'": '&#39;'
}[char];
});
}

// Remove spaces and make course codes uppercase.
function normalizeCode(code) {
return String(code || '').replace(/\s+/g, '').toUpperCase();
}

// Show a message for a short time.
function flash(message) {
if (!compareMsg) return;

compareMsg.textContent = message;

setTimeout(function () {
  compareMsg.textContent = '';
}, 2000);
}

// Display topic dots.
function dots(number) {
var html = '';

for (var i = 0; i < 5; i++) {
  html += '<i class="dot' + (i < number ? ' on' : '') + '"></i>';
}

return '<span class="dots" title="' + number + ' / 5">' + html + '</span>';
}

// Keywords used to match courses with topics.
var topicRules = [
{ topic: 'Programming', words: ['برمجة', 'Programming'] },
{ topic: 'AI / Machine Learning', words: ['ذكاء اصطناعي', 'تعلم الآلة', 'Artificial Intelligence', 'Machine Learning'] },
{ topic: 'Web', words: ['الويب', 'Web'] },
{ topic: 'Networks', words: ['شبكات', 'Networks'] },
{ topic: 'Security', words: ['أمن', 'امن', 'تشفير', 'اختراق', 'Cybersecurity', 'Security', 'Cryptography', 'Hacking'] },
{ topic: 'Hardware / Embedded', words: ['دوائر', 'إلكترونيات', 'معالج', 'أنظمة مدمجة', 'VLSI', 'Hardware', 'Embedded'] },
{ topic: 'Robotics / Control', words: ['روبوت', 'تحكم', 'Robotics', 'Control'] },
{ topic: 'Databases', words: ['قواعد بيانات', 'Database'] },
{ topic: 'Mathematics', words: ['رياضيات', 'حساب', 'جبر', 'تفاضل', 'إحصاء', 'Mathematics', 'Calculus'] },
{ topic: 'Systems', words: ['نظام التشغيل', 'النظم', 'Systems', 'Operating System'] }
];

var COMPARE_ROWS = [
  { topic: "Programming", cs: 5, it: 4, ce: 3 },
  { topic: "AI / Machine Learning", cs: 4, it: 2, ce: 4 },
  { topic: "Web", cs: 3, it: 4, ce: 1 },
  { topic: "Networks", cs: 2, it: 3, ce: 1 },
  { topic: "Security", cs: 2, it: 3, ce: 1},
  { topic: "Hardware / Embedded", cs: 1, it: 0, ce: 5 },
  { topic: "Robotics / Control", cs: 1, it: 0, ce: 5 },
  { topic: "Databases", cs: 2, it: 5, ce: 2 },
  { topic: "Mathematics", cs: 4, it: 2, ce: 4 },
  { topic: "Systems", cs: 3, it: 3, ce: 4 }
];

// Count courses that match each topic.
function coverage(major, rule) {
  var row = COMPARE_ROWS.find(function (item) {
    return item.topic === rule.topic;
  });

  if (!row || typeof row[major] === 'undefined') return 0;

  return Math.max(0, Math.min(5, Number(row[major]) || 0));
}

// Create the major selection buttons.
slugs.forEach(function (major) {
var button = document.createElement('button');

button.type = 'button';
button.className = 'pick-card';
button.dataset.m = major;

button.innerHTML =
  '<span>' + escapeHTML(MAJORS[major].icon) + '</span>' +
  '<b>' + escapeHTML(MAJORS[major].name) + '</b>';

button.addEventListener('click', function () {
  var index = selected.indexOf(major);

  if (index !== -1) {
    if (selected.length > 2) {
      selected.splice(index, 1);
    } else {
      flash('Keep at least 2 majors selected.');
      return;
    }
  } else {
    if (selected.length < 3) {
      selected.push(major);
    } else {
      flash('You can compare up to 3 majors.');
      return;
    }
  }

  render();
});

picker.appendChild(button);
});

// Update the comparison results.
function render() {
picker.querySelectorAll('.pick-card').forEach(function (button) {
button.classList.toggle(
'selected',
selected.indexOf(button.dataset.m) !== -1
);
});

var header = '<tr><th>Topic</th>' +
  selected.map(function (major) {
    return '<th>' +
      escapeHTML(MAJORS[major].icon) + ' ' +
      escapeHTML(MAJORS[major].name) +
      '</th>';
  }).join('') +
  '</tr>';

var rows = topicRules.map(function (rule) {
var values = selected.map(function (major) {
return coverage(major, rule);
});

var maxValue = Math.max.apply(null, values);

return '<tr>' +
    '<td><b>' + escapeHTML(rule.topic) + '</b></td>' +
    values.map(function (value) {
        var bestClass = value === maxValue && maxValue > 0 ? 'best' : '';

        return '<td class="' + bestClass + '">' +
            dots(value) + '</td>';
    }).join('') +
    '</tr>';
}).join('');

topicTable.innerHTML = header + rows;

// Group courses by their code.
var byCode = Object.create(null);

allCourses.forEach(function (course) {
  if (selected.indexOf(course.major) === -1) return;

  var code = normalizeCode(course.code);
  if (!code) return;

  if (!byCode[code]) {
    byCode[code] = {
      code: course.code,
      name: course.name || course.name_ar || course.name_en || '',
      majors: Object.create(null)
    };
  }

  if (!byCode[code].majors[course.major]) {
    byCode[code].majors[course.major] = course.level;
  }
});

var shared = [];
var different = [];

Object.keys(byCode).forEach(function (code) {
  var course = byCode[code];

  if (Object.keys(course.majors).length === selected.length) {
    shared.push(course);
  } else {
    different.push(course);
  }
});

// Sort courses by code.
shared.sort(function (a, b) {
  return normalizeCode(a.code).localeCompare(normalizeCode(b.code));
});

different.sort(function (a, b) {
  return normalizeCode(a.code).localeCompare(normalizeCode(b.code));
});

sharedCount.textContent = shared.length;
differCount.textContent = different.length;

// Display shared courses.
sharedList.innerHTML = shared.length
  ? shared.map(function (course) {
      return '<div class="course-row">' +
        '<span class="code">' + escapeHTML(course.code) + '</span>' +
        '<span>' + escapeHTML(course.name) + '</span>' +
        '</div>';
    }).join('')
  : '<p class="muted">No shared courses in the selected plans.</p>';

// Display different courses.
differList.innerHTML = different.length
  ? different.map(function (course) {
      var tags = selected.map(function (major) {
        return course.majors[major]
          ? '<em>' + escapeHTML(major.toUpperCase()) + '</em>'
          : '';
      }).join('');

      return '<div class="course-row">' +
        '<span class="code">' + escapeHTML(course.code) + '</span>' +
        '<span>' + escapeHTML(course.name) + '</span>' +
        '<span class="tags">' + tags + '</span>' +
        '</div>';
    }).join('')
  : '<p class="muted">Every course is shared.</p>';
}

sharedList.innerHTML = '<p class="muted">Loading courses...</p>';
differList.innerHTML = '<p class="muted">Loading courses...</p>';

render();

// Load the courses from PHP.
fetch('get-courses.php')
.then(function (response) {
if (!response.ok) throw new Error('Could not load course data.');
return response.json();
})
.then(function (data) {
if (!Array.isArray(data)) throw new Error('Invalid course data.');

  allCourses = data;
  render();
})
.catch(function (error) {
  console.error('Compare page error:', error);

  sharedList.innerHTML =
    '<p class="warn">Could not load courses. Check the PHP server and course data.</p>';

  differList.innerHTML = '';
});
});
