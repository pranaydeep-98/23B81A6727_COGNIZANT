const events = [
    { name: "Music Fest", seats: 20, upcoming: true },
    { name: "Workshop", seats: 0, upcoming: true },
    { name: "Old Event", seats: 15, upcoming: false }
];

events.forEach(event => {
    if (event.upcoming && event.seats > 0) {
        console.log(event.name);
    }
});

function register(event) {
    try {
        if (event.seats <= 0) {
            throw "No seats available";
        }
        event.seats--;
        console.log("Registered Successfully");
    } catch (error) {
        console.log(error);
    }
}