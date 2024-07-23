const container = document.getElementById('container');
const registerBtn = document.getElementById('register');
const loginBtn = document.getElementById('login');

registerBtn.addEventListener('click', () => {
    container.classList.add("active");
});

loginBtn.addEventListener('click', () => {
    container.classList.remove("active");
});

document.addEventListener('DOMContentLoaded', () => {
    const numSparkles = 50; // Adjust number of sparkles as needed
    for (let i = 0; i < numSparkles; i++) {
        const sparkle = document.createElement('div');
        sparkle.classList.add('sparkle');
        sparkle.style.top = `${Math.random() * 100}%`;
        sparkle.style.left = `${Math.random() * 100}%`;
        sparkle.style.animationDuration = `${Math.random() * 2 + 1}s`; // Random duration for variety
        document.body.appendChild(sparkle);
    }
});
