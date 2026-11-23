/*
 * main.js - loaded on every page.
 *
 * Main responsibilities:
 *  - Mobile navigation menu.
 *  - Saving the student's data using localStorage.
 *  - Calculating the student's profile and final major results.
 *  - Displaying interest cards on the home page.
 */
// ---------- 1. State Management ----------
// Store the student's choices in the browser without requiring login.
var MMState = {
  KEY: 'majormatch_state',
  // Get saved user data from localStorage
  get: function () {
    var s = {};
    try {
      s = JSON.parse(localStorage.getItem(this.KEY)) || {};
    } catch (e) {
      s = {};
    }
    // Create a unique session ID for the user
    if (!s.session) {
      s.session = 's' + Date.now().toString(36) +
        Math.random().toString(36).slice(2, 8);
    }
    // Initialize ratings, interests, and quiz data
    if (!s.ratings) s.ratings = {};
    if (!s.interests) s.interests = [];
    if (!s.quiz) s.quiz = null;
    return s;
  },
  // Save user data in localStorage
  save: function (s) {
    try {
      localStorage.setItem(this.KEY, JSON.stringify(s));
    } catch (e) {}
  },
  // Save a rating for an experience
  rate: function (type, rating) {
    var s = this.get();
    s.ratings[type] = rating;
    this.save(s);
    this.sync();
  },
  // Add or remove an interest from the user's profile
  toggleInterest: function (key) {
    var s = this.get();
    var i = s.interests.indexOf(key);
    if (i === -1) s.interests.push(key);
    else s.interests.splice(i, 1);
    this.save(s);
    return i === -1;
  },
  // Clear all saved user data
  reset: function () {
    try {
      localStorage.removeItem(this.KEY);
    } catch (e) {}
  },
  // Send the ratings to PHP/MySQL
  // The PHP file is in the same folder as the current PHP page
  sync: function () {
    var s = this.get();
    if (!window.fetch) return;
    fetch('save-result.php', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        session: s.session,
        ratings: s.ratings
      })
    }).catch(function () {});
  }
};
// ---------- 2. Scoring ----------
// Values assigned to each experience rating
var RATING_VALUE = { love: 1, ok: 0.55, no: 0 };
// Calculate how much the student likes each dimension (0-100)
function computeProfile() {
  var s = MMState.get();
  var raw = {}, k;
  // Initialize all dimensions with zero
  for (k in DIMS) raw[k] = 0;
  // Calculate scores from mini experiences
  for (var type in s.ratings) {
    var meta = EXPERIENCE_META[type];
    if (!meta) continue;
    for (k in meta.dims) {
      raw[k] += meta.dims[k] * RATING_VALUE[s.ratings[type]];
    }
  }
  // Add scores from selected interests
  s.interests.forEach(function (key) {
    INTERESTS.forEach(function (it) {
      if (it.key !== key) return;
      for (var d in it.dims) {
        raw[d] += 0.6 * it.dims[d];
      }
    });
  });
  // Add scores from quiz answers
  if (s.quiz && s.quiz.dims) {
    for (k in s.quiz.dims) {
      raw[k] += 0.5 * s.quiz.dims[k];
    }
  }
  // Convert scores into percentages
  var out = [];
  for (k in DIMS) {
    out.push({
      key: k,
      label: DIMS[k],
      pct: Math.min(100, Math.round(raw[k] / 2 * 100))
    });
  }
  // Sort dimensions from highest score to lowest
  out.sort(function (a, b) {
    return b.pct - a.pct;
  });
  return out;
}
// Calculate the final score for every major (0-100)
function computeResult() {
  var s = MMState.get();
  var slugs = Object.keys(MAJORS);
  var res = {};
  var tried = Object.keys(s.ratings).length;
  slugs.forEach(function (m) {
    var parts = [];   // Store weights and scores
    // (A) Quiz score - 50%
    if (s.quiz && s.quiz.answered) {
      parts.push([
        0.5,
        Math.min(1, s.quiz.majors[m] / (s.quiz.answered * 3))
      ]);
    }
    // (B) Ratings of mini experiences - 35%
    var sum = 0, n = 0;
    for (var type in s.ratings) {
      if (EXPERIENCE_META[type] && EXPERIENCE_META[type].major === m) {
        sum += RATING_VALUE[s.ratings[type]];
        n++;
      }
    }
    if (n > 0) parts.push([0.35, sum / n]);
    // (C) Selected interests - 15%
    if (s.interests.length) {
      var pts = 0;
      s.interests.forEach(function (key) {
        INTERESTS.forEach(function (it) {
          if (it.key === key && it.majors[m]) {
            pts += it.majors[m];
          }
        });
      });
      parts.push([
        0.15,
        Math.min(1, pts / (3 * s.interests.length))
      ]);
    }
    // Calculate the weighted average score
    var w = 0, v = 0;
    parts.forEach(function (p) {
      w += p[0];
      v += p[0] * p[1];
    });
    res[m] = w
      ? Math.max(5, Math.min(98, Math.round(v / w * 100)))
      : 0;
  });
  // Sort majors according to their final scores
  var list = slugs.map(function (m) {
    return { slug: m, pct: res[m] };
  }).sort(function (a, b) {
    return b.pct - a.pct;
  });
  return {
    majors: list,
    hasData: tried > 0 || s.interests.length > 0 ||
      !!(s.quiz && s.quiz.answered),
    tried: tried
  };
}
// ---------- 3. Small Helpers ----------
// Select one HTML element
function $(sel, root) {
  return (root || document).querySelector(sel);
}
// Select multiple HTML elements
function $all(sel, root) {
  return Array.prototype.slice.call(
    (root || document).querySelectorAll(sel)
  );
}
// ---------- 4. Page Setup ----------
// Run the setup after the HTML page has loaded
document.addEventListener('DOMContentLoaded', function () {
  // Mobile navigation menu
  var toggle = $('#navToggle'), links = $('#navLinks');
  if (toggle) {
    toggle.addEventListener('click', function () {
      links.classList.toggle('open');
    });
  }
  // Initialize interest cards on the home page
  initInterestCards();
});
// ---------- 5. Home Page Interest Cards ----------
// Display the question: "What are you curious about?"
function initInterestCards() {
  var grid = $('#interestGrid');
  // Stop if the interest section does not exist
  if (!grid) return;
  var panel = $('#interestResult');
  var chosen = MMState.get().interests;
  // Create a card for each available interest
  INTERESTS.forEach(function (it) {
    var b = document.createElement('button');
    // Highlight previously selected interests
    b.className = 'interest-card' +
      (chosen.indexOf(it.key) > -1 ? ' selected' : '');
    // Display the interest icon and name
    b.innerHTML = '<span class="i-icon">' + it.icon +
      '</span><span>' + it.label + '</span>';
    // Handle clicks on interest cards
    b.addEventListener('click', function () {
      var on = MMState.toggleInterest(it.key);
      // Update the card appearance
      b.classList.toggle('selected', on);
      // Display related information
      showInterest(it, on);
    });
    grid.appendChild(b);
  });
  // Display related majors and save status
  function showInterest(it, on) {
    var html = '<h3>' + it.icon + ' ' + it.label +
      '</h3><div class="chips">';
    // Sort related majors by their scores
    Object.keys(it.majors)
      .sort(function (a, b) {
        return it.majors[b] - it.majors[a];
      })
      .forEach(function (m) {
        var strength = it.majors[m] >= 3
          ? 'Strong link'
          : (it.majors[m] === 2 ? 'Good link' : 'Some link');
        // Create a link to the related major
        html += '<a class="chip chip-link" href="major-details.php?major=' +
          m + '">' + MAJORS[m].icon + ' ' +
          MAJORS[m].name + ' <small>· ' + strength +
          '</small></a>';
      });
    // Display interest description
    html += '</div><p class="muted">' + it.note + '</p>';
    // Display whether the interest was saved or removed
    html += '<p class="muted small">' +
      (on ? 'Saved to your profile ✓' : 'Removed from your profile') +
      '</p>';
    panel.innerHTML = html;
    panel.classList.add('show');
  }
}
