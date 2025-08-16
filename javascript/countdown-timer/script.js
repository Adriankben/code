const daysEl = document.getElementById("days");
const hoursEl = document.getElementById("hours");
const minsEl = document.getElementById("mins");
const secondsEl = document.getElementById("seconds");

// Current date and time
const currentDate = new Date();

// Set the date we're counting down to (Birthday Date)
let birthdayDate = new Date(currentDate.getFullYear(), 0, 8);

// Update the countdown every 1 second
var x = setInterval(function() {
    // Get the current time in milliseconds
    var now = new Date().getTime();

    // Calculate the distance between now and the birthday date
    var distance = birthdayDate - now;

    // If the countdown is over, set the birthday date to the next year
    if (distance < 0) {
        birthdayDate.setFullYear(birthdayDate.getFullYear() + 1);
        distance = birthdayDate - now;
    }

    // Time calculations for days, hours, minutes, and seconds
    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var mins = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);

    // Display the results in the corresponding HTML elements
    daysEl.innerHTML = days;
    hoursEl.innerHTML = hours;
    minsEl.innerHTML = mins;
    secondsEl.innerHTML = seconds;
}, 1000);
