<?php include 'header.php'; ?>
<link rel="stylesheet" href="../css/all_styles.css">

<div class="exp-container">
    <h1>Major Experiences</h1>
    <hr>
    
    <!-- IT -->
    <div class="exp-card" style="text-align: left;">
        <div style="display: flex; justify-content: space-between; align-items: center;">
            <div>
                <span class="tag">Networks (IT)</span>
                <h3 style="margin: 10px 0 5px 0;">Connect the network</h3>
                <p style="color: #64748b; font-size: 0.95em; margin: 0;">Can you connect the devices in the correct order to establish a network?</p>
            </div>
            <div>
                <button id="btn-network" class="btn-try" onclick="startNetworkExp()">Try it</button>
            </div>
        </div>
        
        <div id="body-network"></div>
    </div>

    <!-- CS -->
    <div class="exp-card" style="text-align: left;">
        <div style="display: flex; justify-content: space-between; align-items: center;">
            <div>
                <span class="tag">Image Processing (CS)</span>
                <h3 style="margin: 10px 0 5px 0;">Photo filters</h3>
                <p style="color: #64748b; font-size: 0.95em; margin: 0;">Learn how computers manipulate pixels using code-like filters.</p>
            </div>
            <div>
                <button id="btn-filters" class="btn-try" onclick="startFiltersExp()">Try it</button>
            </div>
        </div>
        <div id="body-filters"></div>
    </div>

    <!-- CE -->
    <div class="exp-card" style="text-align: left;">
        <div style="display: flex; justify-content: space-between; align-items: center;">
            <div>
                <span class="tag">Digital Logic (CE)</span>
                <h3 style="margin: 10px 0 5px 0;">Logic gates</h3>
                <p style="color: #64748b; font-size: 0.95em; margin: 0;">Control the light bulb by understanding boolean logic and gates.</p>
            </div>
            <div>
                <button id="btn-logic" class="btn-try" onclick="startLogicExp()">Try it</button>
            </div>
        </div>
        <div id="body-logic"></div>
    </div>
</div>

<script src="../js/experiences.js"></script>
<?php include 'footer.php'; ?>