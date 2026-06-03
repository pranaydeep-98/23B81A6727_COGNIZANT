let allEvents = [];

function addEvent(event) {
    allEvents.push(event);
}

function registerUser(eventName) {
    console.log(`Registered for ${eventName}`);
}

function filterEventsByCategory(category, callback) {
    const result = allEvents.filter(
        event => event.category === category
    );

    callback(result);
}

function registrationCounter() {
    let count = 0;

    return function () {
        count++;
        return count;
    };
}

const trackRegistration = registrationCounter();
console.log(trackRegistration());