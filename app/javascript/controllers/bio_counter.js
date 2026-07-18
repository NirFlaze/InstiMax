document.addEventListener("turbo:load", () => {
    const bio = document.getElementById("bio-field");
    const counter = document.getElementById("bio-count");

    if (!bio || !counter) return;

    const updateCounter = () => {
        counter.textContent = bio.value.length;
    };

    bio.addEventListener("input", updateCounter);
    updateCounter();
});