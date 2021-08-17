//Check
 let enameCheck = document.getElementById("enameCheck");
 let sexCheck = document.getElementById("sexCheck");
 let rocidCheck = document.getElementById("rocidCheck");
 let birthCheck = document.getElementById("birthCheck");
 let cnameCheck = document.getElementById("cnameCheck");
 let acntCheck = document.getElementById("acntCheck");
 let pwd1Check = document.getElementById("pwd1Check");
 let pwd2Check = document.getElementById("pwd2Check");
 let emailCheck = document.getElementById("emailCheck");
 let phoneCheck = document.getElementById("phoneCheck");
 let addr1Check = document.getElementById("addr1Check");
 let addr2Check = document.getElementById("addr2Check");
 let addr3Check = document.getElementById("addr3Check");
 let subBtnCheck = document.getElementById("subBtnCheck");


 document.getElementById("subBtn").onclick = checkSubBtn;

 let flagSubmit1 = true;
 let flagSubmit2 = true;
 let flagSubmit3 = true;
 let flagSubmit4 = true;
 let flagSubmit5 = true;
 let flagSubmit6 = true;
 let flagSubmit7 = true;
 let flagSubmit8 = true;
 let flagSubmit9 = true;
 let flagSubmit10 = true;
 let flagSubmit11 = true;
 let flagSubmit12 = true;
 let flagSubmit13 = true;

 //ename
 function checkEname() {
     flagSubmit1 = true;
     let enameObj = document.getElementById("ename1");
     let enameValue = enameObj.value;
     let enameLen = enameValue.length;
     let flag1 = false;

     if (enameLen == "") {
         enameCheck.innerHTML = "<img src ='../images/incorrect.png'>姓名不能為空";
         flagSubmit1 = false;
     } else if (enameLen >= 2) {
         for (let i = 0; i <= enameLen - 1; i++) {
             let ch = enameValue.charAt(i).toUpperCase();
             if (ch >= "一" && ch <= "鿕") {
                 flag1 = true;
             } else {
                 enameCheck.innerHTML = "<img src ='../images/incorrect.png'>姓名必須全部中文";
                 flag1 = false;
                 flagSubmit1 = false;
                 break;
             }
         } if (flag1) {
             enameCheck.innerHTML = "<img src ='../images/correct.jpg'>";
         }
     } else if (enameLen < 2 && enameLen > 0) {
         enameCheck.innerHTML = "<img src ='../images/incorrect.png'>姓名長度最少二字"
         flagSubmit1 = false;
     }
 }

//sex
function checkSex() {
    flagSubmit2 = true;
    var Total_Obj = document.getElementsByName('gender');
    let val=false;
    for (let i = 0; i < Total_Obj.length; i++) {
        if (Total_Obj[i].checked) {
            val=true;
        } 
    }
    if(val!=true) {
        flagSubmit2 = false;
        sexCheck.innerHTML = "<img src ='../images/incorrect.png'>請點選性別";

    }else{
        flagSubmit2 = true;
        sexCheck.innerHTML = "<img src ='../images/correct.jpg'>";       
    }
}

 //rocid     //pattern="[a-zA-Z]{1}[1-2]{1}\d{8}"
 function checkRocid() {
     flagSubmit3 = true;
     let rocidObj = document.getElementById("rocid1");
     let rocidValue = rocidObj.value;
     let rocidLen = rocidValue.length;
     let re1 = /^[A-Za-z]{1}[1-2]{1}\d{8}$/;
     // let rocid1 = rocidValue.substr(0, 1);
     // let rocid2 = rocidValue.substr(1, 1);
     // let rocid3 = rocidValue.substr(2, 8);
     // let flag1 = false, flag2 = false, flag3 = false;
     let flag1 = false;

     if (rocidLen == "") {
         rocidCheck.innerHTML = "<img src ='../images/incorrect.png'>身分證字號不可為空";
         flagSubmit3 = false;
     } else if (rocidLen > 0) {
         for (i = 0; i <= rocidLen; i++) {
             if (re1.test(rocidValue)) {
                 flag1 = true;
             } else {
                 flagSubmit3 = false;
                 flag1 = false;
             }
         }
         if (flag1) {
             rocidCheck.innerHTML = "<img src ='../images/correct.jpg'>";
         } else {
             rocidCheck.innerHTML = "<img src ='../images/incorrect.png'>身分證字號格式有誤";
             flagSubmit3 = false;
         }

     }
 }

 //checkBirth
 function checkBirth() {
     flagSubmit4 = true;
     let year1Obj = document.getElementById("year1");
     let month1Obj = document.getElementById("month1");
     let day1Obj = document.getElementById("day1");
     let year1Value = year1Obj.value;
     let month1Value = month1Obj.value;
     let day1Value = day1Obj.value;
     let year1Len = year1Value.length;
     let month1Len = month1Value.length;
     let day1Len = day1Value.length;
     let floatYear1 = parseFloat(year1Value);
     let floatMonth1 = parseFloat(month1Value);
     let floatDay1 = parseFloat(day1Value);
     let re1 = /^\d{1,3}$/;
     let re2 = /^\d{1,2}$/;
     let re3 = /^\d{1,2}$/;
     let flag1 = false, flag2 = false, flag3 = false;

     if (year1Len == 0 || month1Len == 0 || day1Len == 0) {
         birthCheck.innerHTML = "<img src ='../images/incorrect.png'>日期不可為空";
         flagSubmit4 = false;
     } else if (year1Len > 0) {
         // for (i = 0; i <= year1Len; i++) {
         if (re1.test(year1Value)) {
             if (re2.test(month1Value)) {
                 if (re3.test(day1Value)) {

                     if (floatYear1 <= 0 || floatYear1 >= 999) {      //年份不超過上下限
                         flag1 = false;
                     } else {
                         flag1 = true;
                         if (floatYear1 % 4 == 1 && floatYear1 % 100 != 1) {       //閏年
                             if (floatMonth1 == 1 || floatMonth1 == 3 || floatMonth1 == 5 || floatMonth1 == 7 || floatMonth1 == 8 || floatMonth1 == 10 || floatMonth1 == 12) {
                                 flag2 = true;
                                 if (floatDay1 > 0 && floatDay1 <= 31) {       //大月
                                     flag3 = true;
                                 } else {
                                     flag3 = false;
                                 }
                             } else if (floatMonth1 == 4 || floatMonth1 == 6 || floatMonth1 == 9 || floatMonth1 == 11) {    //小月
                                 flag2 = true;
                                 if (floatDay1 > 0 && floatDay1 <= 30) {
                                     flag3 = true;
                                 } else {
                                     flag3 = false;
                                 }
                             } else if (floatMonth1 == 2) {     //二月
                                 flag2 = true;
                                 if (floatDay1 <= 29) {
                                     flag3 = true;
                                 } else {
                                     flag3 = false;
                                 }
                             } else {
                                 flag2 = false;
                             }
                         } else {              //平年
                             if (floatMonth1 == 1 || floatMonth1 == 3 || floatMonth1 == 5 || floatMonth1 == 7 || floatMonth1 == 8 || floatMonth1 == 10 || floatMonth1 == 12) {
                                 flag2 = true;
                                 if (floatDay1 > 0 && floatDay1 <= 31) {       //大月
                                     flag3 = true;
                                 } else {
                                     flag3 = false;
                                 }
                             } else if (floatMonth1 == 4 || floatMonth1 == 6 || floatMonth1 == 9 || floatMonth1 == 11) {    //小月
                                 flag2 = true;
                                 if (floatDay1 > 0 && floatDay1 <= 30) {
                                     flag3 = true;
                                 } else {
                                     flag3 = false;
                                 }
                             } else if (floatMonth1 == 2) {     //二月
                                 flag2 = true;
                                 if (floatDay1 <= 28) {
                                     flag3 = true;
                                 } else {
                                     flag3 = false;
                                 }
                             } else {
                                 flag2 = false;
                             }
                         }
                     }
                 } else {
                     flag1 = false;
                 }
             } else {
                 flag1 = false;
             }
         } else {
             flag1 = false;
         }
         // }
         if (flag1 && flag2 && flag3) {
             birthCheck.innerHTML = "<img src ='../images/correct.jpg'>";
         } else {
             birthCheck.innerHTML = "<img src ='../images/incorrect.png'>無此日期";
             flagSubmit4 = false;
         }

     }
 }

 //cname
 function checkCname() {
     flagSubmit5 = true;
     let cnameObj = document.getElementById("cname1");
     let cnameValue = cnameObj.value;
     let cnameLen = cnameValue.length;

     if (cnameValue == "") {
         cnameCheck.innerHTML = "<img src ='../images/incorrect.png'>公司名稱不可為空";
         flagSubmit5 = false;
     } else {
         cnameCheck.innerHTML = "<img src ='../images/correct.jpg'>";
     }

 }


 //account1
 function checkAccount() {
     flagSubmit6 = true;
     let acntObj = document.getElementById("account1");
     let acntValue = acntObj.value;
     let acntLen = acntValue.length;
     let flag1 = false, flag2 = false;

     if (acntLen == "") {
         acntCheck.innerHTML = "<img src ='../images/incorrect.png'>帳號不能為空";
         flagSubmit6 = false;
     } else if (acntLen >= 6) {
         for (let i = 0; i <= acntLen; i++) {
             let ch = acntValue.charAt(i).toUpperCase();
             if (ch >= "A" && ch <= "Z") {
                 flag1 = true;
             } else if (ch >= "0" && ch <= "9") {
                 flag2 = true;
             }
             if (flag1 && flag2) {
                 break;
             }
         } if (flag1 && flag2) {
             acntCheck.innerHTML = "<img src ='../images/correct.jpg'>";
         } else {
             acntCheck.innerHTML = "<img src ='../images/incorrect.png'>帳號必須包含英文與數字";
             flagSubmit6 = false;
         }
     } else if (acntLen < 6 && acntLen > 0) {
         acntCheck.innerHTML = "<img src ='../images/incorrect.png'>帳號字數過少";
         flagSubmit6 = false;
     }
 }

 //pwd1
 function checkPwd1() {
     flagSubmit7 = true;
     let pwd1Obj = document.getElementById("pwd1");
     let pwd1Value = pwd1Obj.value;
     let pwd1Len = pwd1Value.length;
     let flag1 = false, flag2 = false;

     if (pwd1Len == "") {
         pwd1Check.innerHTML = "<img src ='../images/incorrect.png'>密碼不能為空";
         flagSubmit7 = false;
     } else if (pwd1Len >= 6) {
         for (let i = 0; i <= pwd1Len; i++) {
             let ch = pwd1Value.charAt(i).toUpperCase();
             if (ch >= "A" && ch <= "Z") {
                 flag1 = true;
             } else if (ch >= "0" && ch <= "9") {
                 flag2 = true;
             }
             if (flag1 && flag2) {
                 break;
             }
         } if (flag1 && flag2) {
             pwd1Check.innerHTML = "<img src ='../images/correct.jpg'>";
         } else {
             pwd1Check.innerHTML = "<img src ='../images/incorrect.png'>密碼必須包含英文與數字";
             flagSubmit7 = false;
         }
     } else if (pwd1Len < 6 && pwd1Len > 0) {
         pwd1Check.innerHTML = "<img src ='../images/incorrect.png'>密碼字數過少";
         flagSubmit7 = false;
     }
 }

 //pwd2
 function checkPwd2() {
     flagSubmit8 = true;
     let pwd1Obj = document.getElementById("pwd1");
     let pwd1Value = pwd1Obj.value;
     let pwd2Obj = document.getElementById("pwd2");
     let pwd2Value = pwd2Obj.value;
     let pwd2Len = pwd2Value.length;
     let flag1 = false, flag2 = false;

     if (pwd2Len == "") {
         pwd2Check.innerHTML = "<img src ='../images/incorrect.png'>密碼不能為空";
         flagSubmit8 = false;
     } else if (pwd2Len >= 6) {
         if (pwd2Value == pwd1Value) {
             for (let i = 0; i <= pwd2Len; i++) {
                 let ch = pwd2Value.charAt(i).toUpperCase();
                 if (ch >= "A" && ch <= "Z") {
                     flag1 = true;
                 } else if (ch >= "0" && ch <= "9") {
                     flag2 = true;
                 }
                 if (flag1 && flag2) {
                     break;
                 }
             }
             if (flag1 && flag2) {
                 pwd2Check.innerHTML = "<img src ='../images/correct.jpg'>";
             } else {
                 pwd2Check.innerHTML = "<img src ='../images/incorrect.png'>密碼必須包含英文與數字";
                 flagSubmit8 = false;
             }
         } else {
             pwd2Check.innerHTML = "<img src ='../images/incorrect.png'>請確認密碼一樣";
             flagSubmit8 = false;
         }
     } else if (pwd2Len < 6 && pwd2Len > 0) {
         pwd2Check.innerHTML = "<img src ='../images/incorrect.png'>密碼字數過少";
         flagSubmit8 = false;
     }
 }

 //email1
 function checkEmail() {
     flagSubmit9 = true;
     let emailObj = document.getElementById("email1");
     let emailValue = emailObj.value;
     let emailLen = emailValue.length;
     let re1 = /^\w+@\w+\.\w{2,3}$/;

     let flag1 = false;

     if (emailLen == "") {
         emailCheck.innerHTML = "<img src ='../images/incorrect.png'>E-mail不可為空";
         flagSubmit9 = false;
     } else if (emailLen > 0) {
         for (i = 0; i <= emailLen; i++) {
             if (re1.test(emailValue)) {
                 flag1 = true;
             } else {
                 flag1 = false;
             }
         }
         if (flag1) {
             emailCheck.innerHTML = "<img src ='../images/correct.jpg'>";
         } else {
             emailCheck.innerHTML = "<img src ='../images/incorrect.png'>E-mail格式有誤";
             flagSubmit9 = false;
         }

     }
 }

 //phone
 function checkPhone() {
     flagSubmit10 = true;
     let phone1Obj = document.getElementById("phone1");
     let phone2Obj = document.getElementById("phone2");
     let phone1Value = phone1Obj.value;
     let phone2Value = phone2Obj.value;
     let phone1Len = phone1Value.length;
     let phone2Len = phone2Value.length;
     let re1 = /^\d{2,4}$/;
     let re2 = /^\d{8}$/;

     let flag1 = false;

     if (phone1Len == "" || phone2Len == "") {
         phoneCheck.innerHTML = "<img src ='../images/incorrect.png'>電話不可為空";
         flagSubmit10 = false;
     } else if (phone1Len > 0 && phone2Len > 0) {
         for (i = 0; i <= phone1Len; i++) {
             if (re1.test(phone1Value)) {
                 if (phone1Value == 02 || phone1Value == 03 || phone1Value == 037 || phone1Value == 04 || phone1Value == 05 || phone1Value == 06 || phone1Value == 07 || phone1Value == 08 || phone1Value == 089 || phone1Value == 082 || phone1Value == 0826 || phone1Value == 0836 || phone1Value == "049") {
                     if (re2.test(phone2Value)) {
                         flag1 = true;
                     } else {
                         flag1 = false;
                     }
                 } else {
                     flag1 = false;
                 }
             } else {
                 flag1 = false;
             }
         }
         if (flag1) {
             phoneCheck.innerHTML = "<img src ='../images/correct.jpg'>";
         } else {
             phoneCheck.innerHTML = "<img src ='../images/incorrect.png'>電話格式有誤";
             flagSubmit10 = false;
         }

     }
 }

 //addr1
 function checkAddr1() {
     flagSubmit11 = true;
     let addr1Obj = document.getElementById("addr1");
     let addr1Value = addr1Obj.value;
     let addr1Len = addr1Value.length;

     if (addr1Value == "") {
         addr1Check.innerHTML = "<img src ='../images/incorrect.png'>公司縣市不可為空";
         flagSubmit11 = false;
     } else {
         addr1Check.innerHTML = "<img src ='../images/correct.jpg'>";
     }

 }

 //addr2
 function checkAddr2() {
     flagSubmit12 = true;
     let addr2Obj = document.getElementById("addr2");
     let addr2Value = addr2Obj.value;
     let addr2Len = addr2Value.length;
     let re1 = /^\d{3}$/;
     // let rocid1 = rocidValue.substr(0, 1);
     // let rocid2 = rocidValue.substr(1, 1);
     // let rocid3 = rocidValue.substr(2, 8);
     // let flag1 = false, flag2 = false, flag3 = false;
     let flag1 = false;

     if (addr2Len == "") {
         addr2Check.innerHTML = "<img src ='../images/incorrect.png'>郵遞區號不可為空";
         flagSubmit12 = false;
     } else if (addr2Len > 0) {
         for (i = 0; i <= addr2Len; i++) {
             if (re1.test(addr2Value)) {
                 flag1 = true;
             } else {
                 flag1 = false;
             }
         }
         if (flag1) {
             addr2Check.innerHTML = "<img src ='../images/correct.jpg'>";
         } else {
             addr2Check.innerHTML = "<img src ='../images/incorrect.png'>郵遞區號格式有誤";
             flagSubmit12 = false;
         }

     }
 }

 //addr3
 function checkAddr3() {
     flagSubmit13 = true;
     let addr3Obj = document.getElementById("addr3");
     let addr3Value = addr3Obj.value;

     if (addr3Value == "") {
         addr3Check.innerHTML = "<img src ='../images/incorrect.png'>完整地址不可為空";
         flagSubmit13 = false;
     } else {
         addr3Check.innerHTML = "<img src ='../images/correct.jpg'>";
     }

 }

 //顯示密碼
 document.getElementById("showPwd").onclick=showPwd;
     function showPwd(){
         let pwdType=document.getElementById("pwd1").type;
         //pwdType現在是密碼的話，就轉成文字顯示
         if(pwdType === "password"){
             document.getElementById("pwd1").type="text";
             document.getElementById("pwd2").type="text";
             //pwdType現在是文字的話，就轉回密碼來不顯示
         }else{
             document.getElementById("pwd1").type="password";
             document.getElementById("pwd2").type="password";
         }
     }
 

 //checkSubBtn
 function checkSubBtn() {
     checkEname();
     checkSex();
     checkRocid();
     checkBirth();
     checkCname();
     checkAccount();
     checkPwd1();
     checkPwd2();
     checkEmail();
     checkPhone();
     checkAddr1();
     checkAddr2();
     checkAddr3();
     if (flagSubmit1 == false || flagSubmit2 == false || flagSubmit3 == false || flagSubmit4 == false || flagSubmit5 == false || 
         flagSubmit6 == false || flagSubmit7 == false || flagSubmit8 == false || flagSubmit9 == false || flagSubmit10 == false || 
         flagSubmit11 == false || flagSubmit12 == false || flagSubmit13 == false) {
         subBtnCheck.innerHTML = "**資料不完整，請重新檢查**";
         console.log(flagSubmit2)

         return false;
     } else {
         return true;
     }

 }