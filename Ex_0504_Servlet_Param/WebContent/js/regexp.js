// id: a 6-12 letter combination of alphabet and/or numbers
// pwd: a 6-16 letter combination of alphabet, numbers and special characters
var reg_id = /^[a-zA-Z](?=.*[a-zA-Z])(?=.*[0-9]).{6,12}$/;
var reg_pwd = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,16}$/;
