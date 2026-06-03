const eventList = [];

eventList.push({
    name: "Music Fest",
    category: "Music"
});

eventList.push({
    name: "Baking Workshop",
    category: "Workshop"
});

const musicEvents =
    eventList.filter(event => event.category === "Music");

console.log(musicEvents);

const cards =
    eventList.map(event => `Workshop on ${event.name}`);

console.log(cards);