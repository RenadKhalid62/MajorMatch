<?php include 'header.php'; ?>
<link rel="stylesheet" href="../css/all_styles.css">

<div class="explore-wrapper">
    <h1 class="explore-title">Explore IT Fields 🚀</h1>
    <p class="explore-subtitle">You're building your profile... Select the tech fields that interest you the most!</p>
    
    <div id="fields-container" class="fields-container"></div>

    <div style="margin-top: 40px; padding-bottom: 30px;">
        <button id="save-interests-btn" class="btn-save" onclick="saveInterests()">Save My Interests</button>
        <p id="save-msg" class="save-msg"></p>
    </div>
</div>

<script src="../js/explore.js"></script>
<?php include 'footer.php'; ?>