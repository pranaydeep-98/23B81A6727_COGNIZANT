fetch("https://jsonplaceholder.typicode.com/posts")
.then(response => response.json())
.then(data => console.log(data))
.catch(error => console.log(error));

async function loadEvents() {

    console.log("Loading...");

    try {
        const response =
        await fetch(
        "https://jsonplaceholder.typicode.com/posts"
        );

        const data =
        await response.json();

        console.log(data);
    }
    catch(error) {
        console.log(error);
    }
}

loadEvents();