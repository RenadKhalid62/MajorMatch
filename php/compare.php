
<?php
$page_title = 'Compare';
$active = 'compare';
$scripts = ['compare.js'];

include 'header.php';
?>

<section class="page-head">
<div class="container">
<p class="eyebrow">Step 6 · Compare</p>
<h1>Compare Majors</h1>
<p class="muted">Compare the topics covered by each major.</p>
</div>
</section>

<!-- Major selector -->
<div class="pick-row compare-picker" id="comparePicker"></div>

<!-- Feedback -->
<p class="feedback" id="compareMsg"></p>

<!-- Topic comparison -->
<div class="topic-section">
<h2>Topic emphasis</h2>
<p class="muted small">
Explore the topics covered by each major based on its study plan.
</p>

<div class="table-wrap">
  <table class="compare" id="topicTable"></table>
</div>
</div>
<!-- Course comparison -->
<div class="two-col wide">

  <!-- Shared courses -->
  <div class="card">
    <h3>shared Courses
      <span class="count-pill" id="sharedCount">0</span>
    </h3>
    <div id="sharedList"></div>
  </div>

  <!-- Different courses -->
  <div class="card">
    <h3>Different Courses
      <span class="count-pill" id="differCount">0</span>
    </h3>
    <div id="differList"></div>
  </div>

</div>

<!-- Study plans link -->
<p class="center" style="margin-top:26px">
  <a class="btn btn-primary" href="study-plans.php">
    Explore the study plans
  </a>
</p>

<?php include 'footer.php'; ?>
