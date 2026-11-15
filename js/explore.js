var techFields = [
    { id: "ai", name: "Artificial Intelligence", icon: "🤖" },
    { id: "web", name: "Web Development", icon: "🌐" },
    { id: "data", name: "Data Science", icon: "📊" },
    { id: "games", name: "Game Development", icon: "🎮" },
    { id: "networks", name: "Networks & Cloud", icon: "☁️" },
    { id: "uiux", name: "UI/UX Design", icon: "🎨" }
];

var selectedFields = [];

window.onload = function() {
    var savedData = localStorage.getItem("userInterests");
    if (savedData) {
        selectedFields = JSON.parse(savedData);
    }
    renderFields();
};

function renderFields() {
    var container = document.getElementById("fields-container");
    container.innerHTML = ""; 

    for (var i = 0; i < techFields.length; i++) {
        var field = techFields[i];
        
        var isSelected = (selectedFields.indexOf(field.id) !== -1);
        
        var bgColor = isSelected ? "#e0e7ff" : "white";
        var borderColor = isSelected ? "#4f46e5" : "#cbd5e1";
        
        var cardHTML = "<div class='explore-card' onclick='toggleField(\"" + field.id + "\")' style='padding: 20px; border-radius: 12px; cursor: pointer; transition: 0.3s; width: 180px; text-align: center; border: 2px solid " + borderColor + "; background-color: " + bgColor + ";'>";
        cardHTML += "<div style='font-size: 2.5em; margin-bottom: 10px;'>" + field.icon + "</div>";
        cardHTML += "<div style='font-weight: bold; color: #334155;'>" + field.name + "</div>";
        cardHTML += "</div>";
        
        container.innerHTML += cardHTML;
    }

    if (selectedFields.length > 0) {
        document.getElementById("save-interests-btn").style.display = "inline-block";
    } else {
        document.getElementById("save-interests-btn").style.display = "none";
    }
}

function toggleField(fieldId) {
    var index = selectedFields.indexOf(fieldId);
    
    if (index === -1) {
        selectedFields.push(fieldId);
    } else {
        selectedFields.splice(index, 1);
    }
    
    renderFields();
    document.getElementById("save-msg").innerHTML = "";
}

function saveInterests() {
    localStorage.setItem("userInterests", JSON.stringify(selectedFields));
    document.getElementById("save-msg").innerHTML = "✅ Great! Your interests have been saved to your profile.";
}