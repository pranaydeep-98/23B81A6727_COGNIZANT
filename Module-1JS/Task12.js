function submitRegistration() {

setTimeout(async () => {

try {

const response =
await fetch(
"https://jsonplaceholder.typicode.com/posts",
{
method: "POST",
headers: {
"Content-Type":
"application/json"
},
body: JSON.stringify({
name: "John"
})
}
);

alert("Registration Success");

}
catch(error) {
alert("Registration Failed");
}

}, 2000);
}