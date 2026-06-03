const container =document.querySelector("#eventContainer");

const card = document.createElement("div");

card.innerHTML = `
<h3>Music Fest</h3>
<button>Register</button>
`;

container.appendChild(card);