<?php
$page_title = 'Compare';
$active = 'compare'; 
$scripts = ['compare.js'];

include 'header.php';
?>
<!-- Topic comparison -->
<div class="step-label">STEP 6 · COMPARE</div>

<h2>Course Comparison</h2>

<p class="muted small">
Explore the topics covered by each major based on its study plan.
</p>

<div class="table-wrap">
  <table class="compare" id="topicTable"></table>
</div>

<!-- Course comparison -->
<div class="two-col wide">

  <!-- Shared courses -->
  <div class="card">
    <h3>Courses you share
      <span class="count-pill" id="sharedCount">0</span>
    </h3>
    <div id="sharedList"></div>
  </div>

  <!-- Different courses -->
  <div class="card">
    <h3>Courses that differ
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
