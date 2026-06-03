document.getElementById("registerBtn").onclick =
function () {
    alert("Registered");
};

document.getElementById("category").onchange =
function () {
    console.log(this.value);
};

document.getElementById("search")
.addEventListener("keydown", function () {
    console.log(this.value);
});