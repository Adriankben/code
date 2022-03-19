const daysEl = document.getElementById("days");
const hoursEl = document.getElementById("hours");
const minsEl = document.getElementById("mins");
const secondsEl = document.getElementById("seconds");

// curent date
const currentDate = new Date();

//E - currentDate.getFullYear(), 9, 18
//A - currentDate.getFullYear(), 9, 18
// Set the date we're counting down to
const birthdayDate = new Date(currentDate.getFullYear(), 0, 8);

// Update the count down every 1 second
var x = setInterval(function() {

    var now = new Date().getTime();

    // Find the distance between now and the count down date
    var distance = (birthdayDate - now);
    
    // Time calculations for days, hours, minutes and seconds
    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var mins = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);

    daysEl.innerHTML = days;
    hoursEl.innerHTML = hours;
    minsEl.innerHTML = mins;
    secondsEl.innerHTML = seconds;

    // If the count down is over for this year, add a year and continue counting down 
    if (distance < 0) {birthdayDate.setFullYear(birthdayDate.getFullYear() + 1)
    }
}, 1000);
