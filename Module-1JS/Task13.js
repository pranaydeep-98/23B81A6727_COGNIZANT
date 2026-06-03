function submitForm() {

console.log("Step 1: Form Submitted");

const user = {
name: "John",
email: "john@gmail.com"
};

console.log("Step 2:", user);

debugger;

fetch("https://jsonplaceholder.typicode.com/posts",
{
method: "POST",
body: JSON.stringify(user)
});

console.log("Step 3: Request Sent");
}