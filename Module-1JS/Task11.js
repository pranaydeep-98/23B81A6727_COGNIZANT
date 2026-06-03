document.getElementById("regForm")
.addEventListener("submit", function(event){

event.preventDefault();

const form = event.target;

const name =
form.elements.username.value;

const email =
form.elements.email.value;

if(name === "" || email === ""){

document.getElementById("error")
.innerText = "All fields required";

return;
}

alert("Registration Successful");
});