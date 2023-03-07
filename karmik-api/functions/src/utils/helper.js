const isEmpty = (string) => {
  if (string.trim() == "") {
    return true;
  } else {
    return false;
  }
};

const isEmail = (email) => {
  const regx =
    /^(([^<>()\[\]\\.,;:\s@”]+(\.[^<>()\[\]\\.,;:\s@”]+)*)|(“.+”))@((\[[0–9]{1,3}\.[0–9]{1,3}\.[0–9]{1,3}\.[0–9]{1,3}\])|(([a-zA-Z\-0–9]+\.)+[a-zA-Z]{2,}))$/;
  if (email.match(regx)) {
    return true;
  } else {
    return false;
  }
};

exports.validateSignUPData = (data) => {
  let errors = {};
  if (isEmpty(data.email)) {
    errors.email = "Email Field is Required";
  } else if (!isEmail(data.email)) {
    errors.email = "Must be valid email address";
  }
  if (data.password !== data.confirmPassword) {
    errors.confirmPassword = "Password Did not match";
  }
  if(isEmpty(data.phoneNumber)) {
    errors.phoneNumber = "Please enter Phone Number"
  }
  if(isEmpty(data.displayName)) {
    errors.displayName = "Please enter Name"
  }
  return {
    errors,
    valid: Object.keys(errors).length === 0 ? true : false,
  };
};

exports.validateLoginData = (data) => {
  let errors = {};
  if (isEmpty(data.email)) {
    errors.email = "Email filed is required!";
  } else if (isEmpty(data.password)) {
    errors.password = "Password filed is required!";
  } else if (!isEmail(data.email)) {
    error.email = "Must be valid email address";
  }
  return {
    errors,
    valid: Object.keys(errors).length === 0 ? true : false,
  };
};
