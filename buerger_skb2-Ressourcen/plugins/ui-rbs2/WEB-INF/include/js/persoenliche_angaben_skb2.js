function calcAge(){
    var age = '';
    var value = myForm.F00000066;
    if (value != undefined){
        var now = new Date();
        var ageDifMs = now - value.getTime();
        var ageDate = new Date(ageDifMs);
        age = Math.abs(ageDate.getUTCFullYear() - 1970);
        return age;
    }
};

// ro > readonly: determines if fields are readonly (shows html) or not
function ro(){
    if (assistants.scope.current === 'eid' && myForm.id_feld){
        return true;
    } else {
        return false;
    }
}

// renders as html the data in eID or SKB2 (to do SKB2)
function iseID(){
    if (myForm.id_feld){
        return true;
    }else{
        return false;
    }
}

function getpersondata(){
    var html = "";
    if (iseID()){
        var stg = "";
        stg = geteIDAcademicTitle();
        html = "<tr><strong><td>Titel </td><td>" + stg + "</td></strong></tr>";
        stg = "";
        stg = geteIDFamilyNames();
        html += "<tr><strong><td>Name </td><td>" + stg + "</td></strong></tr>"
        stg = "";
        stg = geteIDGivenNames();
        html += "<tr><strong><td>Vorname </td><td>" + stg + "</td></strong></tr>"
        stg = "";
        stg = geteIDBirthName();
        html += "<tr><strong><td>Geburtsname </td><td>" + stg + "</td></strong></tr>"
        stg = "";
        stg = geteIDDateOfBirth();
        html += "<tr><strong><td>Geburtsdatum </td><td>" + stg + "</td></strong></tr>"
        stg = "";
        stg = geteIDPlaceOfBirth();
        html += "<tr><strong><td>Geburtsort </td><td>" + stg + "</td></strong></tr>"
    }
    return html;
}

//-----Get eID Data -------

// transforms SKB Date to Date field
function getSKBDate(dat){
    var result = '';
    var year = '';
    var month = '';
    var day = '';
    // if (dat){
        year = dat.substring(0,4);
        month = dat.substring(4,6);
        day = dat.substring(6,8);
        result = day + '.' + month + '.' + year; // year + '-' + month + '-' + day;
    // }else{
    //     result = "";
    // }
    return result;
}



function getSKBpersondata(){
    var html = "";
    if (isSKB()){
        var stg = "";
        stg = getSKBPrefix();
        html = "<tr><strong><td>Anrede </td><td>" + stg + "</td></strong></tr>";
        stg = "";
        stg = getSKBTitle();
        html += "<tr><strong><td>Titel </td><td>" + stg + "</td></strong></tr>";
        stg = "";
        stg = getSKBLastname();
        html += "<tr><strong><td>Name </td><td>" + stg + "</td></strong></tr>"
        stg = "";
        stg = getSKBFirstname();
        html += "<tr><strong><td>Vorname </td><td>" + stg + "</td></strong></tr>"
        // stg = "";
        // stg = myForm.id_feld.BirthName;
        // html += "<tr><strong><td>Geburtsname </td><td>" + stg + "</td></strong></tr>"
        stg = "";
        stg = getSKBDateofbirth();
        html += "<tr><strong><td>Geburtsdatum </td><td>" + stg + "</td></strong></tr>"
        // stg = "";
        // stg = myForm.id_feld.PlaceOfBirth;
        // html += "<tr><strong><td>Geburtsort </td><td>" + stg + "</td></strong></tr>"
    }
    return html;
}

//
// (myForm.user) ? (myForm.user.lastname) ? getSKBLastname() : "" : ""

function isSKB(){
    if (!myForm.user || myForm.user == undefined){
        return false;
    }else{
        return true;
    }
}

function getSKBTitle(){
    var res = '';
    if (isSKB()) {   
        if(myForm.user.title){
            res = myForm.user.title;
        }
    }
    return res;
}

function getSKBLastname(){
    var res = '';
    if (isSKB()) {   
        if(myForm.user.lastname){
            res = myForm.user.lastname;
        }
    }
    return res;
}

function getSKBFirstname()   {
    // (myForm.user) ? (myForm.user.firstname) ? myForm.user.firstname : "" : ""
    var res = '';
    if (isSKB()) {   
        if(myForm.user.firstname){
            res = myForm.user.firstname;
        }
    }
    return res;
}


function getSKBDateofbirth(){
    // myForm.user.dateofbirth
    var res = '';
    if (isSKB()) {
        if(myForm.user.dateofbirth){
            res = getSKBDate(myForm.user.dateofbirth);
        }
    }
    return res;
}


function getSKBPrefix(){
    //myForm.user.prefix
    var res = '';
    if (isSKB()) {
        if(myForm.user.prefix){
            res = myForm.user.prefix;
        }
    }
    return res;
}

//-----Get eID Data -------
function geteIDAcademicTitle(){
    var res = '';
    if (iseID()){
        if (myForm.id_feld.AcademicTitle){
            res = myForm.id_feld.AcademicTitle;
        }
    }
    return res;
}

function geteIDFamilyNames(){
    var res = '';
    if (iseID()){
        if (myForm.id_feld.FamilyNames){
            res = myForm.id_feld.FamilyNames;
        }
    }
    return res;
}

function geteIDGivenNames(){
    var res = '';
    if (iseID()){
        if (myForm.id_feld.GivenNames){
            res = myForm.id_feld.GivenNames;
        }
    }
    return res;
}


function geteIDBirthName(){
    var res = '';
    if (iseID()){
        if (myForm.id_feld.BirthName){
            res = myForm.id_feld.BirthName;
        }
    }
    return res;
}

//.DateOfBirth

function geteIDDateOfBirth(){
    var res = '';
    if (iseID()){
        if (myForm.id_feld.DateOfBirth){
            res = assistants.formatDate(myForm.id_feld.DateOfBirth, 'dd.MM.yyyy');
        }
    }
    return res;
}

function geteIDPlaceOfBirth(){
    var res = '';
    if (iseID()){
        if (myForm.id_feld.PlaceOfBirth){
            if (myForm.id_feld.PlaceOfBirth.FreetextPlace){
                res = myForm.id_feld.PlaceOfBirth.FreetextPlace;
            }
        }
    }
    return res;
}

