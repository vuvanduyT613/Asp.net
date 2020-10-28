function validatePass() {
    var pass = document.getElementById("txt_password").value;
    var repass = document.getElementById("txt_repassword").value;

    if (pass != repass) {
        alert("Vui lòng nhập lại mật khẩu!");
        document.getElementById("txt_repassword").value = "";
        return false;
    }
    return true;
}

function ValidateEmail() {
    var mail = document.getElementById("txt_email");
    var mailformat = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
    if (mailformat.test(String(mail.value).toLowerCase())) {
        return true;
    }
    else {
        alert("Địa chỉ Email không hợp lệ!");
        mail.value = '';
        mail.focus();
        return false;
    }
}


function main() {
    var fullname = document.getElementById("txt_fullname");
    var username = document.getElementById("txt_username");
    var mail = document.getElementById("txt_email");
    var numberphone = document.getElementById("txt_numberphone");
    var pass = document.getElementById("txt_password");
    var repass = document.getElementById("txt_repassword");
    if (fullname == '' && username == '' && mail == '' && numberphone == '' && pass == '' && repass == '') {
        alert("Vui lòng nhập đầy đủ thông tin !");
    }
    else {
        if (mail.value != '' || mail.value != null) {
            ValidateEmail();
        }
        if (pass.value != '' && pass.value != null || repass.value != '' && repass.value != null) {
            validatePass();
        }
    }
}