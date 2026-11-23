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

        <div class="footer-brand">
            <strong>MajorMatch</strong> · Don't just choose your major , Explore it.
        </div>

        <!-- Team members -->
        <div class="footer-credits">
            <span class="made-by">Made by</span>
            <div class="team-names">
                Raghad Alharbi · Renad Altami · Sara Albaidhani · Ghala Alkuraydis
            </div>
        </div>

    </div>
</footer>

<!-- Load shared JavaScript files -->
<script src="../js/data.js"></script>
<script src="../js/main.js"></script>

<!-- Load page-specific JavaScript files -->
<?php foreach ($scripts as $s): ?>
    <script src="../js/<?= e($s) ?>"></script>
<?php endforeach; ?>

<!-- Close HTML document -->
</body>

</html>
