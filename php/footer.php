<?php
/*
 * footer.php
 * Shared footer included at the bottom of every page.
 * Set $scripts before including this file.
 */
// Make sure the scripts array exists
$scripts = isset($scripts) ? $scripts : [];
?>
<!-- Main content ends here -->
</main>
<!-- Website footer -->
<footer class="footer">
    <div class="container">
     <!-- Website name and slogan -->
    <strong>MajorMatch</strong> · Don't just choose your major. Explore it.
    <!-- Project information -->
    <div class="footer-note">
        A university project prototype · College of Computer ·
        This is an exploration tool, not an official advisor.
        </div>
    </div>
</footer>
<!-- Load shared JavaScript files from the main js folder -->
<script src="../js/data.js"></script>
<script src="../js/main.js"></script>
<!-- Load page-specific JavaScript files -->
<?php foreach ($scripts as $s): ?>
    <script src="../js/<?= e($s) ?>"></script>
<?php endforeach; ?>
<!-- Close HTML document -->
</body>
</html>
