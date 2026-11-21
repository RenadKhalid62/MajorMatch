<?php include 'header.php'; ?>
<!-- Page stylesheet -->
<link rel="stylesheet" href="../css/all_styles.css">

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
</div>

<!-- JavaScript logic for selecting and saving interests -->
<script src="../js/explore.js"></script>
<?php include 'footer.php'; ?>