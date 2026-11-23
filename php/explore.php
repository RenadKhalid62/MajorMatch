<?php
$page_title = 'Build Your Profile';
$active = 'try';
include 'header.php';
?>

<section class="page-head">
    <div class="container">
        <p class="eyebrow">Step 3 · Build Your Profile</p>
        <h1>Explore Tech Fields</h1>
        <p class="muted">You're building your profile... Select the tech fields that interest you the most!</p>
    </div>
</section>

<div class="explore-wrapper">
    <!-- Page heading and instructions -->
    <h1 class="explore-title">Explore Tech Fields</h1>
    <p class="explore-subtitle">You're building your profile... Select the tech fields that interest you the most!</p>
    
    <!-- Field cards will be generated here using JavaScript -->
    <div id="fields-container" class="fields-container"></div>

    <!-- Save button and result message area -->
    <div style="margin-top: 40px; padding-bottom: 30px;">
        <button id="save-interests-btn" class="btn-save" onclick="saveInterests()">Save My Interests</button>
        <p id="save-msg" class="save-msg"></p>
    </div>

    <!-- Buttons (Back to Step 2 / Next to Step 4) -->
    <div class="center" style="margin-top: 24px; display: flex; justify-content: center; gap: 12px; flex-wrap: wrap;">
        <a class="btn btn-soft" href="experience.php">Try Tech Experiences</a>
        <a class="btn btn-primary" href="quiz.php">Take the Quiz</a>
    </div>
</div>

<!-- JavaScript logic for selecting and saving interests -->
<script src="../js/explore.js"></script>
<?php include 'footer.php'; ?>