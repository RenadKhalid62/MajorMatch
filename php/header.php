<?php
/*
 * header.php
 * Shared header included at the top of all PHP pages.
 * Set $page_title and $active before including this file.
 */
// Connect to the database
require_once __DIR__ . '/db.php';
// Set default page title and active navigation item
$page_title = isset($page_title) ? $page_title : 'MajorMatch';
$active = isset($active) ? $active : '';
/*
 * Navigation menu
 * All PHP pages are inside the php folder,
 * so their links do not need ../
 */
$nav = [
    'home'    => ['index.php', 'Home'],
    'majors'  => ['majors.php', 'Explore Majors'],
    'try'     => ['experience.php', 'Try & Discover'],
    'compare' => ['compare.php', 'Compare'],
    'plans'   => ['study-plans.php', 'Study Plans'],
];
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Page character encoding and responsive settings -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Dynamic page title -->
    <title><?= e($page_title) ?> · MajorMatch</title>
    <!-- Load CSS files from the main css folder -->
    <link rel="stylesheet" href="../css/all_styles.css">
</head>
<body>
<!-- Website header -->
<header class="navbar">
    <div class="container nav-inner">
        <!-- Website logo -->
        <a class="logo" href="index.php">
            <span class="logo-mark">M</span>Major<span>Match</span>
        </a>
        <!-- Mobile navigation toggle button -->
        <button class="nav-toggle" id="navToggle" aria-label="Menu">
            ☰
        </button>
        <!-- Navigation menu -->
        <nav class="nav-links" id="navLinks">
         <?php foreach ($nav as $key => $item): ?>
         <!-- Highlight the active page -->
         <a href="<?= $item[0] ?>"
           class="<?= $active === $key ? 'active' : '' ?>">
           <?= $item[1] ?>
                </a>
            <?php endforeach; ?>
            <!-- Start exploring button -->
            <a class="btn btn-primary btn-small" href="majors.php">
                Start Exploring
            </a>
    </nav>
    </div>
</header>
<!-- Main page content starts here -->
<main>
