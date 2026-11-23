// List of tech fields linked to our 3 majors (CS, IT, CE)
var techFields = [
    { id: "ai", name: "Artificial Intelligence", icon: "🤖", major: "CS" },
    { id: "games", name: "Game Development", icon: "🎮", major: "CS" },
    { id: "web", name: "Web Development", icon: "🌐", major: "IT" },
    { id: "networks", name: "Networks & Cloud", icon: "☁️", major: "IT" },
    { id: "robotics", name: "Robotics & Hardware", icon: "🦾", major: "CE" },
    { id: "embedded", name: "Embedded Systems", icon: "🔌", major: "CE" }
];

// Array to store the fields selected by the user
var selectedFields = [];

// Load saved interests from localStorage when the page opens
window.onload = function() {
    var savedData = localStorage.getItem("userInterests");
    if (savedData) {
        selectedFields = JSON.parse(savedData);
    }
    renderFields();
};

// Display all field cards and highlight the selected ones
function renderFields() {
    var container = document.getElementById("fields-container");
    container.innerHTML = "";

    for (var i = 0; i < techFields.length; i++) {
        var field = techFields[i];
        var isSelected = (selectedFields.indexOf(field.id) !== -1);

        // Change card style if it is selected
        var bgColor = isSelected ? "#e0e7ff" : "white";
        var borderColor = isSelected ? "#4f46e5" : "#cbd5e1";

        var cardHTML = "<div class='explore-card' onclick='toggleField(\"" + field.id + "\")' style='padding: 20px; border-radius: 12px; cursor: pointer; transition: 0.3s; width: 180px; text-align: center; border: 2px solid " + borderColor + "; background-color: " + bgColor + ";'>";
        cardHTML += "<div style='font-size: 2.5em; margin-bottom: 10px;'>" + field.icon + "</div>";
        cardHTML += "<div style='font-weight: bold; color: #334155;'>" + field.name + "</div>";
        cardHTML += "</div>";

        container.innerHTML += cardHTML;
    }

    // Show the save button only when at least one field is selected
    if (selectedFields.length > 0) {
        document.getElementById("save-interests-btn").style.display = "inline-block";
    } else {
        document.getElementById("save-interests-btn").style.display = "none";
    }
}

// Add or remove a field when the user clicks its card
function toggleField(fieldId) {
    var index = selectedFields.indexOf(fieldId);

    if (index === -1) {
        selectedFields.push(fieldId); // Add field
    } else {
        selectedFields.splice(index, 1); // Remove field
    }

    renderFields();
    document.getElementById("save-msg").innerHTML = "";
}

// Save interests to localStorage and recommend the closest major
function saveInterests() {
    localStorage.setItem("userInterests", JSON.stringify(selectedFields));

    // Counters for each major
    var cs = 0;
    var it = 0;
    var ce = 0;

    // Count how many selected fields belong to each major
    for (var i = 0; i < techFields.length; i++) {
        if (selectedFields.indexOf(techFields[i].id) !== -1) {
            if (techFields[i].major == "CS") { cs++; }
            else if (techFields[i].major == "IT") { it++; }
            else if (techFields[i].major == "CE") { ce++; }
        }
    }

    // Find the highest score and collect matching majors
    var maxScore = Math.max(cs, it, ce);
    var bestMajors = [];

    if (cs == maxScore) { bestMajors.push("Computer Science (CS)"); }
    if (it == maxScore) { bestMajors.push("Information Technology (IT)"); }
    if (ce == maxScore) { bestMajors.push("Computer Engineering (CE)"); }

    var resultText = bestMajors.join(" & ");

    // Show recommendation and a link to the experiences page
    document.getElementById("save-msg").innerHTML =
        "<div style='background:#ffffff; border:1px solid #e3e6f3; border-left:5px solid #4f46e5; border-radius:14px; padding:16px 24px; max-width:680px; margin:20px auto 0; box-shadow:0 4px 12px rgba(36,71,214,0.08);'>" +
        "<div style='color:#1fa463; margin-bottom:6px;'>✅ Your interests have been saved!</div>" +
        "<div style='color:#1e293b; font-weight:normal;'>Based on your choices, you lean towards: <b style='color:#4f46e5;'>" + resultText + "</b></div>" +
        "</div>";
}