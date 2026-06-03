function createEvent(
    name = "Community Event",
    category = "General"
) {
    return { name, category };
}

const event = {
    name: "Music Fest",
    date: "10-Jun-2026"
};

const { name, date } = event;

console.log(name, date);

const copiedEvents = [...eventList];