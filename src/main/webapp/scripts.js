document.addEventListener("DOMContentLoaded", function() {
    const adminLoginBtn = document.getElementById("adminLoginBtn");
    const officerLoginBtn = document.getElementById("officerLoginBtn");

    function openLoginWindow(userType) {
        const username = window.prompt("Enter username:");
        const password = window.prompt("Enter password:");

        // Simulating authentication, replace with actual backend logic
        const adminCredentials = { username: "admin", password: "admin123" };
        const officerCredentials = { username: "officer", password: "officer123" };

        if (userType === "admin" && username === adminCredentials.username && password === adminCredentials.password) {
            window.location.href = "welcome_admin.html"; // Redirect to welcome_admin.html
        } else if (userType === "officer" && username === officerCredentials.username && password === officerCredentials.password) {
            window.location.href = "welcome_officer.html"; // Redirect to welcome_officer.html
        } else {
            alert("Invalid username or password");
        }
    }

    adminLoginBtn.addEventListener("click", function() {
        openLoginWindow("admin");
    });

    officerLoginBtn.addEventListener("click", function() {
        openLoginWindow("officer");
    });
});
