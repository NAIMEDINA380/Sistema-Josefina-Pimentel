document.getElementById('loginForm').addEventListener('submit', function(e) {
    e.preventDefault();

    const user = document.getElementById('username').value;
    const pass = document.getElementById('password').value;
    const message = document.getElementById('message');

    if (user === "NAYMEDINA12" && pass === "Nayson123*") {
        message.style.color = "green";
        message.textContent = "Acceso concedido. Redirigiendo...";
        setTimeout(() => {
            window.location.href = "dashboard.html";
        }, 1500);
    } else {
        message.style.color = "red";
        message.textContent = "Usuario o contraseña incorrectos.";
    }
});