function signIn(e) {
  let email = document.getElementById('email').value, pwd = document.getElementById('pwd').value;
  let formData = JSON.parse(localStorage.getItem('formData')) || [];
  let exist = formData.length && 
  JSON.parse(localStorage.getItem('formData')).some(data => data.email.toLowerCase() == email && data.pwd.toLowerCase() == pwd);
  if(exist){
      alert("login successfull");
      window.location.assign("users.html")
  }
  else{
      alert("login fail")
  }
  e.preventDefault();
}