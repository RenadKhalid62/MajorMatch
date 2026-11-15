var currentPath = "";
var clickCount = 0;
var valA = 0; 
var valB = 0;

function startNetworkExp() {
    document.getElementById("btn-network").style.display = "none";
    renderNetworkGame(document.getElementById("body-network"));
}
function startFiltersExp() {
    document.getElementById("btn-filters").style.display = "none";
    renderFiltersGame(document.getElementById("body-filters"));
}
function startLogicExp() {
    document.getElementById("btn-logic").style.display = "none";
    renderLogicGame(document.getElementById("body-logic"));
}

function getRatingHTML(expName) {
    var html = "<div style='margin-top:20px; padding-top:15px; border-top:1px dashed #ccc; text-align:center;'>";
    html += "<p style='color:#666; margin-bottom:10px;'>How was this experience?</p>";
    
    html += "<div id='rating-btns-" + expName + "'>";
    html += "<button class='modern-btn' onclick='saveRating(\"" + expName + "\", \"Liked\")'>👍 Liked it</button> ";
    html += "<button class='modern-btn' onclick='saveRating(\"" + expName + "\", \"Normal\")'>😐 Normal</button> ";
    html += "<button class='modern-btn' onclick='saveRating(\"" + expName + "\", \"Disliked\")'>👎 Disliked</button>";
    html += "</div>";
    html += "<p id='rating-msg-" + expName + "' style='margin-top:10px; font-weight:bold; color:green;'></p>";
    html += "</div>";
    return html;
}

function saveRating(expName, ratingValue) {
    document.getElementById("rating-msg-" + expName).innerHTML = "Saving your rating...";
    document.getElementById("rating-msg-" + expName).style.color = "blue";

    var formData = new FormData();
    formData.append("exp_name", expName);
    formData.append("rating_value", ratingValue);

    fetch('save_rating.php', {
        method: 'POST',
        body: formData
    })
    .then(function(response) {
        return response.text();
    })
    .then(function(result) {
        if (result.trim() === "Success") {
            document.getElementById("rating-msg-" + expName).innerHTML = "✅ Rating saved (" + ratingValue + ")! Thank you.";
            document.getElementById("rating-msg-" + expName).style.color = "green";
            // إخفاء الأزرار باستخدام طريقة المنهج
            document.getElementById("rating-btns-" + expName).style.display = "none";
        } else {
            document.getElementById("rating-msg-" + expName).innerHTML = "❌ Error saving rating!";
            document.getElementById("rating-msg-" + expName).style.color = "red";
        }
    })
    .catch(function(error) {
        console.log("Network error:", error);
    });
}

function checkSavedRating(expName) {
    fetch('get_rating.php?exp_name=' + expName)
    .then(function(response) {
        return response.text();
    })
    .then(function(result) {
        var res = result.trim();
        if (res !== "none" && res !== "") {
            document.getElementById("rating-msg-" + expName).innerHTML = "✅ You already rated this: <b>" + res + "</b>";
            document.getElementById("rating-msg-" + expName).style.color = "green";
            // إخفاء الأزرار باستخدام طريقة المنهج
            document.getElementById("rating-btns-" + expName).style.display = "none";
        }
    })
    .catch(function(error) {
        console.log("Error loading rating:", error);
    });
}

// Game 1 : Networks (IT)
function renderNetworkGame(container) {
    container.innerHTML = 
        "<div style='padding:15px; border-top:1px solid #eee; margin-top:15px; text-align:center;'>" +
        "<h4 style='color:#333;'>Connect: Computer ➔ Router ➔ Server</h4>" +
        "<div id='devices-box' style='display:flex; justify-content:center; gap:15px; margin-top:15px;'>" +
        "<button id='dev-comp' class='dev-btn' onclick='addDevice(\"Computer\")'>💻 Computer</button>" +
        "<button id='dev-rout' class='dev-btn' onclick='addDevice(\"Router\")'>📡 Router</button>" +
        "<button id='dev-serv' class='dev-btn' onclick='addDevice(\"Server\")'>💾 Server</button>" +
        "</div>" +
        "<p style='margin-top:20px; font-size:18px;'>Path: <b id='net-path' style='color:#4f46e5;'>(empty)</b></p>" +
        "<p id='net-msg' style='font-weight:bold; font-size:16px;'></p>" +
        "<button id='net-reset' class='modern-btn' onclick='resetNetwork()' style='display:none; margin:10px auto;'>🔄 Try Again</button>" +
        "</div>" + getRatingHTML("Network");

    shuffleDevices();
    checkSavedRating("Network");
}

function shuffleDevices() {
    document.getElementById("dev-comp").style.order = Math.floor(Math.random() * 10);
    document.getElementById("dev-rout").style.order = Math.floor(Math.random() * 10);
    document.getElementById("dev-serv").style.order = Math.floor(Math.random() * 10);
}

function addDevice(deviceName) {
    if (clickCount >= 3) return;
    
    if (currentPath.indexOf(deviceName) !== -1) {
        return;
    }
    
    if (clickCount == 0) {
        currentPath = deviceName;
    } else {
        currentPath = currentPath + " ➔ " + deviceName;
    }
    
    document.getElementById("net-path").innerHTML = currentPath;
    clickCount++;

    if (clickCount == 3) {
        if (currentPath == "Computer ➔ Router ➔ Server") {
            document.getElementById("net-msg").innerHTML = "✅ Correct! Network Connected.";
            document.getElementById("net-msg").style.color = "green";
        } else {
            document.getElementById("net-msg").innerHTML = "❌ Wrong Order! The data is lost.";
            document.getElementById("net-msg").style.color = "red";
            document.getElementById("net-reset").style.display = "block";
        }
    }
}

function resetNetwork() {
    currentPath = "";
    clickCount = 0;
    document.getElementById("net-path").innerHTML = "(empty)";
    document.getElementById("net-msg").innerHTML = "";
    document.getElementById("net-reset").style.display = "none";
    shuffleDevices(); 
}

// Game 2 : Image Processing (CS)
function renderFiltersGame(container) {
    container.innerHTML = 
        "<div style='padding:15px; border-top:1px solid #eee; margin-top:15px; text-align:center;'>" +
        "<p style='color:#666; font-size:14px;'>Image processing is how computers manipulate pixels (like Snapchat lenses).</p>"+
        "<img id='myImage' src='https://images.unsplash.com/photo-1629654297299-c8506221ca97?w=400' style='border-radius:12px; box-shadow:0 4px 10px rgba(0,0,0,0.2); transition: 0.3s;'>" +
        "<div style='margin-top:15px; display:flex; flex-wrap:wrap; justify-content:center; gap:5px;'>" +
        "<button class='modern-btn' onclick='changeFilter(\"grayscale(100%)\")'>🖤 Grayscale</button> " +
        "<button class='modern-btn' onclick='changeFilter(\"blur(4px)\")'>🌫️ Blur</button> " +
        "<button class='modern-btn' onclick='changeFilter(\"sepia(100%)\")'>📜 Sepia</button> " +
        "<button class='modern-btn' onclick='changeFilter(\"invert(100%)\")'>👻 Invert</button> " +
        "<button class='modern-btn' onclick='changeFilter(\"brightness(150%)\")'>☀️ Bright</button> " +
        "<button class='modern-btn' style='background:#fee2e2; color:#991b1b;' onclick='changeFilter(\"none\")'>❌ Reset</button>" +
        "</div></div>" + getRatingHTML("Filters");
        
    checkSavedRating("Filters");
}

function changeFilter(filterType) {
    document.getElementById("myImage").style.filter = filterType;
}

// Game 3 : Digital Logic (CE)
function renderLogicGame(container) {
    container.innerHTML = 
        "<div style='padding:15px; border-top:1px solid #eee; margin-top:15px; text-align:center;'>" +
        "<p style='color:#666;'>Change the inputs and see if the light bulb turns ON.</p>" +
        "<div style='background:#f8fafc; padding:15px; border-radius:10px; display:inline-block;'>" +
        "<p><strong>Select Gate:</strong> " +
        "<select id='gate-type' onchange='checkLogic()' style='padding:5px; font-weight:bold; border-radius:5px;'>" +
        "<option value='AND'>AND Gate (All must be 1)</option>" +
        "<option value='OR'>OR Gate (Any can be 1)</option>" +
        "<option value='NOT'>NOT Gate (Reverses Input A)</option>" +
        "</select></p>" +
        "<div style='display:flex; justify-content:center; align-items:center; gap:30px; margin-top:20px;'>" +
        "<div style='display:flex; flex-direction:column; gap:10px;'>" +
        "<div>Input A: <button id='btn-A' class='logic-btn' onclick='toggleA()'>0</button></div>" +
        "<div>Input B: <button id='btn-B' class='logic-btn' onclick='toggleB()'>0</button></div>" +
        "</div>" +
        "<div style='font-size:24px; color:#94a3b8;'>➡️</div>" +
        "<div style='text-align:center;'>" +
        "<div id='bulb-icon' style='font-size:50px; filter:grayscale(100%); transition:0.3s;'>💡</div>" +
        "<div id='logic-out' style='font-weight:bold; font-size:20px; color:red; margin-top:5px;'>Output: 0</div>" +
        "</div>" +
        "</div></div></div>" + getRatingHTML("Logic");
        
    checkSavedRating("Logic");
}

function toggleA() {
    if (valA == 0) { valA = 1; } else { valA = 0; }
    var btn = document.getElementById("btn-A");
    btn.innerHTML = valA;
    btn.style.borderColor = (valA == 1) ? "green" : "#ccc";
    checkLogic();
}

function toggleB() {
    if (valB == 0) { valB = 1; } else { valB = 0; }
    var btn = document.getElementById("btn-B");
    btn.innerHTML = valB;
    btn.style.borderColor = (valB == 1) ? "green" : "#ccc";
    checkLogic();
}

function checkLogic() {
    var gate = document.getElementById("gate-type").value;
    var output = 0;

    if (gate == "AND") {
        document.getElementById("btn-B").disabled = false;
        if (valA == 1 && valB == 1) { output = 1; } else { output = 0; }
    } 
    else if (gate == "OR") {
        document.getElementById("btn-B").disabled = false;
        if (valA == 1 || valB == 1) { output = 1; } else { output = 0; }
    }
    else if (gate == "NOT") {
        document.getElementById("btn-B").disabled = true; 
        document.getElementById("btn-B").style.borderColor = "#ccc";
        if (valA == 0) { output = 1; } else { output = 0; }
    }

    var outElement = document.getElementById("logic-out");
    var bulbIcon = document.getElementById("bulb-icon");
    
    outElement.innerHTML = "Output: " + output;
    
    if (output == 1) {
        outElement.style.color = "green";
        bulbIcon.style.filter = "drop-shadow(0 0 15px gold) brightness(1.2)";
    } else {
        outElement.style.color = "red";
        bulbIcon.style.filter = "grayscale(100%)";
    }
}