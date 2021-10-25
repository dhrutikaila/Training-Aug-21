function Submit(Name, LastName, ContactNumber, EmailId, Feedback) {
    var Feedback = {
        "Name": Name,
        "LastName": LastName,
        "ContactNumber": ContactNumber,
        "EmailId": EmailId,
        "Feedback": Feedback
    }

    var data = localStorage.getItem("Feedback")

    if (data == null) {
        var Feedback_arr = new Array();
        Feedback_arr.push(Feedback);
        localStorage.setItem("Feedback", JSON.stringify(Feedback_arr));
        alert("Your Feedback Is Successfully Submited..");
    } else {
        var Feedback_old_arr = JSON.parse(data);
        Feedback_old_arr.push(Feedback);
        localStorage.setItem("Feedback", JSON.stringify(Feedback_old_arr));
        alert("Your Feedback Is Successfully Submited..");
    }

}

function clearUserData() {
    localStorage.clear();
}