

  function formValidation()
  {
    
  var uid = document.registration.uid;
  var uname = document.registration.Employeename;
  var uadd = document.registration.address;
  var location = document.registration.country;
  var email = document.registration.email;
  var umsex = document.registration.msex;
  var ufsex = document.registration.fsex; 
  if(userid_validation(uid,5,12))
  {
  
  if(allLetter(uname))
  {
  if(alphanumeric(uadd))
  { 
  if(countryselect(location))
  {
 
  if(ValidateEmail(email))
  {
  if(validsex(umsex,ufsex))
  {
  }
  } 
  } 
  }
  }
  }
  return false;

 
  }
 
  function userid_validation(uid,mx,my)
  {
  var uid_len = uid.value.length;
  if (uid_len == 0 || uid_len >= my || uid_len < mx)
  {
  alert("User Id should not be empty  length be between "+mx+" to "+my);
  uid.focus();
  return false;
  }
  return true;

  }
  
    
  


