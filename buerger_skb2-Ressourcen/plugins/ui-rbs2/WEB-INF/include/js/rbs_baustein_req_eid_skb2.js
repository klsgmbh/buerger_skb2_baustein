var mustbeBerlin = true;
//vvvv URLs des RBS Dienst vvvv
var urlrbsstrliste;
var urlrbsdata; 
//---- https://fbinter.stadt-berlin.de/rbs/rbs-str-liste-xml.jsp?
//---- für Strassen mit Übergabe von Parametern. Hier sind Straßenname strname, Straßennummer strnr, 
//---- Bezirksnummer beznr und Ortsteilnummer otnr möglich.
function geturlrbsstrliste(){
    var res = "";
    res = assistants.xpath.select("urlrbs", "string(rbs_url/url_1)");
    return res;
}


//---- https://fbinter.stadt-berlin.de/rbs/rbs-data-xml.jsp?
//---- für Adressen mit Übergabe von Parametern. Hier sind Straßennummer strnr Pflicht, Hausnummer 
//---- hausnr, Bezirksnummer beznr und Ortsteilnummer otnr möglich. 
function geturlrbsdata(){
    var res = "";
    res =  assistants.xpath.select("urlrbs", "string(rbs_url/url_2)");
    return res;
}

//^^^^ URLs des RBS Dienst ^^^^


//vvvv SKB  SKB  SKB  SKB  SKB  SKB  SKB vvvv
// ---- Verschiedene Funktionen für die Extraktion von SKB Daten
// ---- z.B. getSKBStreet() liest die Straßenname.

function isSKB(){
    if (!myForm.user || myForm.user == undefined){
        return false;
    }else{
        return true;
    }
}

function getSKBPerson(){
    var pers = '';
    if (isSKB()){
        pers = myForm.user.modeid;
    }
    return pers;
}


function getSKBDate(dat){
    var result = '';
    var year = '';
    var month = '';
    var day = '';
    year = dat.substring(0,4);
    month = dat.substring(4,6);
    day = dat.substring(6,8);
    result = day + '.' + month + '.' + year; // year + '-' + month + '-' + day;
    return result;
}


function getSKBStreet(){
    //(myForm.id_antragsteller) ? myForm.id_antragsteller.PlaceOfResidence.Street_Name : (myForm.user) ? myForm.user.street : ""
    var res = '';
    if (isSKB()) {           
        if(myForm.user.street){
            res = myForm.user.street;
            return res;
        }
    }
    return res;
}

function getSKBStreetNr(){
    //(myForm.id_antragsteller) ? myForm.id_antragsteller.PlaceOfResidence.Street_Number : (myForm.user) ? myForm.user.streetnumber : ""    
    var res = '';
    if (isSKB()) { 
        if(myForm.user.streetnumber){
            res = myForm.user.streetnumber;
            return res;
        }
    }
    return res;
}

function getSKBStreetExt(){
    //(myForm.id_antragsteller) ? myForm.id_antragsteller.PlaceOfResidence.Street_Number : (myForm.user) ? myForm.user.streetnumber : ""    
    var res = '';
    if (isSKB()) { 
        if(myForm.user.streetextension){
            res = myForm.user.streetextension;
        }
    }
    return res;
}


function getSKBPLZ(){
    //(myForm.id_antragsteller) ? myForm.id_antragsteller.PlaceOfResidence.ZipCode : (myForm.user) ? myForm.user.zipcode : ""
    var res = '';
    if (isSKB()) { 
        if(myForm.user.zipcode){
            res = myForm.user.zipcode;
        }
    }
    return res;
}


function getSKBCity(){
    //(myForm.id_antragsteller) ? myForm.id_antragsteller.PlaceOfResidence.City : (myForm.user) ? myForm.user.city : ""
    var res = 'Berlin';
    if (isSKB()) { 
        if(myForm.user.city){
            res = myForm.user.city;
        }
    }
    return res;
}

function getSKBLand() {
    var res = 'Deutschland';
    if (isSKB()) { 
        if(myForm.user.city){
            res = myForm.user.country;
            //return res;
        }
        res = getLandCode(res);
    }
    return res;
}

function getskbaddressdata(){
    var html = "";
    if (isSKB()){
        html = "<tr><strong><td>Straße </td><td>" + getSKBStreet() + "</td></strong></tr>";
        html += "<tr><strong><td>Hausnummer </td><td>" + getSKBStreetNr() + getSKBStreetExt() + "</td></strong></tr>"
        html += "<tr><strong><td>Postleitzahl </td><td>" + getSKBPLZ() + "</td></strong></tr>"
        html += "<tr><strong><td>Ort </td><td>" + getSKBCity() + "</td></strong></tr>"
        var landname = "";
        if(getSKBLand() === "000"){
            landname = "Deutschland";
        }
        html += "<tr><strong><td>Land </td><td>" + landname + "</td></strong></tr>"        
    }
    return html;
}

//---- Transformiert das SKB Land nach ein XÖV Schüssel ----
function getLandCode(land){
    var res = "000";
    var myland = land;
    if (myland === "Deutschland"){
        res = "000";
        return res;
    }else if(myland != "Deutschland"){
        res = assistants.xpath.select("C00000009", "string(//Row/Value[SimpleValue=$code]//../Value[@ColumnRef='DESTATIS_Schluessel_Staat']/SimpleValue)", { code : myland });
        return res;
    }
    
}


function checkSelectedLand(){
    var res = "";
    if ((myForm.landh == "|---bitte auswählen---") || (myForm.landh == "")){
        res = getSKBLand();
    }else{
        res = myForm.landh;
    }
    return res;
}

function isBerlin(){
    if (isSKB()){
        var city = getSKBCity();
        if (city.toLowerCase() == "berlin"){
            return true;
        }else {
            return false;
        }
    }
}

function isSKBBerlin(){
    if (isSKB()){
        var city = getSKBCity();
        if (city.toLowerCase() == "berlin"){
            return true;
        }
    }
    return false;
}


//^^^^ SKB  SKB  SKB  SKB  SKB  SKB  SKB  SKB ^^^^

//vvvv eID eID  eID eID  eID eID  eID eID  eID eID vvvv
//-----Get eID Data -------
function iseID(){
    if (myForm.id_feld){
        return true;
    }else{
        return false;
    }
}

function iseIDBerlin(){
    if (iseID()){
        var city = geteIDCity();
        if (city.toLowerCase() == "berlin"){
            return true;
        }
    }
    return false;
}
function ifReadeID(){    
    if (mustbeBerlin == true && iseIDBerlin() == true){
        return true;
    }else if(mustbeBerlin == false && iseIDBerlin() == true){
        return true;
    }else if(mustbeBerlin == false && iseIDBerlin() == false ){
        return true;
    }       
    return false;
}


function geteIDStreetName(){
    var res = '';
    if (iseID()){
        if (myForm.id_feld.PlaceOfResidence.Street_Name){
            res = myForm.id_feld.PlaceOfResidence.Street_Name;
        }
    }
    return res;
}

function geteIDStreetNr(){
    var res = '';
    if (iseID()){
        if (myForm.id_feld.PlaceOfResidence.Street_Number){
            res = myForm.id_feld.PlaceOfResidence.Street_Number;
        }
    }
    return res;
}

function geteIDStreetNrExt(){
    var res = '';
    if (iseID()){
        if (myForm.id_feld.PlaceOfResidence.Street_NumberSuffix != undefined){
            res = myForm.id_feld.PlaceOfResidence.Street_NumberSuffix;
        }
    }
    return res;
}

function geteIDPLZ(){
    var res = '';
    if (iseID()){
        if (myForm.id_feld.PlaceOfResidence.ZipCode){
            res = myForm.id_feld.PlaceOfResidence.ZipCode;
            if (res == undefined){res = "nicht lesbar"};
        }
    }
    return res;
}

function geteIDCity(){
    var res = '';
    if (iseID()){
        if (myForm.id_feld.PlaceOfResidence.City){
            res = myForm.id_feld.PlaceOfResidence.City;
        }
    }
    return res;
}

function getCity(){
    var res = '';
    if (iseID()){
        res = geteIDCity();
    }else if (isSKB()){
        res = getSKBCity();
    }
    return res;
}

function geteIDCountry(){
    var res = '000';
    if (iseID()){
        if (myForm.id_feld.PlaceOfResidence.Country){
            res = myForm.id_feld.PlaceOfResidence.Country;
        }
        if (res == "D" || res == "") { res == "000"; }
    }
    return res;
}

//---- Präsentiert die eID Adresse als HTML Tabelle ----
function getaddressdata(){
    var html = "";
    if (iseID()){
        html = "<tr><strong><td>Straße </td><td>" + geteIDStreetName() + "</td></strong></tr>";
        html += "<tr><strong><td>Hausnummer </td><td>" + geteIDStreetNr() + geteIDStreetNrExt() + "</td></strong></tr>"
        html += "<tr><strong><td>Postleitzahl </td><td>" + geteIDPLZ() + "</td></strong></tr>"
        html += "<tr><strong><td>Ort </td><td>" + geteIDCity() + "</td></strong></tr>"
        var landname = "";
        if(geteIDCountry() === "000"){
            landname = "Deutschland";
        }
        html += "<tr><strong><td>Land </td><td>" + landname + "</td></strong></tr>"        
    }
    return html;
}


function checkifBerlin(){
    var ber = true;
    if (iseID()) {
        if (iseIDBerlin() === false) {
            ber = false;
        }
    }
    return ber;
}
//-----Get eID Data -------
//^^^^  eID eID  eID eID  eID eID  eID eID  eID eID ^^^^


function checkReadOnly(){
	if (assistants.scope.current === 'eid'){
        return true; //read from eID
	}else{
		if (myForm.user){
			if (myForm.user.modeid == '3'){
				return true; //Firmenkunde
			}else{
				if (myForm.user.levelid == '3') {
					return true; //hÃ¶here Sicherheitstufe BÃ¼rger
				}else{
					return false;
				}
			}
		}else{
			return false;
		}
	}
}

// ---- Vorbelegung des Land Auswahlfeldes ----
function prefillLand(){
    //(iseID()) ? geteIDCountry() : (isSKB()) ? getSKBLand() : "000"
    var res = "";
    if (iseID()){
        res = geteIDCountry();
    }else if (isSKB()){
        res = getSKBLand();
    }else{
        res = "000";
    }
    return res;
}

// ---- die Validierung einer Adresse ist positive, wenn RBS die Adresse eindeutig in Berlin identifiziert hat
// ---- und liefert die Bezirksnummer.
function validateAddress(){
    var res = false
    if (myForm.transaction){
        if (myForm.F00000035h.toLowerCase() !== "berlin"){
            return false;
        }else if (myForm.F00000035h.toLowerCase() == "berlin") {
            if (myForm.bzrnr != '') {
                    var adr = callbzrinfo();
                    myForm.bzrnameh = adr.bzrname;
                    myForm.otnameh = adr.otname;
                    res = true;
                }
            }else{
                res = false
            }
    }    
	return res;
}

function callbzrinfo(){
    var res;
    var strname = myForm.F00000053h;
    var hnr = myForm.F00000016h;
    var hnrz = myForm.F00000084h;
    var plz = myForm.F00000054h;
    var city = "berlin";
    res = callCheckAddress(strname,hnr,hnrz,plz,city)
    return res;
}

function rbsrule(){
    var res = true;
    if (myForm.rbs_valid != undefined && myForm.F00000035h != undefined){
        if (myForm.rbs_valid !== true){
            if (myForm.F00000035h.toLowerCase() === "berlin"){
                res = false;
            }
        }
    }
    return res;
}

function selectDistrict(){
    myForm.bzrnr = myForm.beznum;
    myForm.otnr = myForm.otnum;
    if (myForm.bzrnr != ""){
        myForm.bzrname = myForm['beznum/@label'];
    }else{
        myForm.bzrname = "";
    }
    if (myForm.otnr != ""){
        myForm.otname = myForm['otnum/@label'];
    }else{
        myForm.otname = "";
    }
}

/*
	the values for res are the names of the pages (<body id="">)
	where only Berlin addresses are allowed and 
	should be validated.
*/

// function onlyBerlin(){
//     var res = "foo; bar; rbs";
//     return res;
// }

function ro(){
    if (assistants.scope.current === 'eid' && myForm.id_feld){
        return true;
    } else {
        return false;
    }
}
//---------------- Server side address validation --------------------------//

function validateEIDaddress(){
    var address = "";
    if (iseID()){
        var estrname = geteIDStreetName();
        var ehnr = geteIDStreetNr();
        var ehnrz = geteIDStreetNrExt();
        var eplz = geteIDPLZ();
        var ecity = geteIDCity();
        
        if (ecity.toLowerCase() !== "berlin"){ return "";}

        address = callCheckAddress(estrname,ehnr,ehnrz,eplz,ecity);
        return address;

    }else{
        return "";
    }
}

function validateSKBaddress(){
    var address = "";
    if (isSKB()){
        var strname = getSKBStreet();
        var hnr = getSKBStreetNr();
        var hnrz = getSKBStreetExt();
        var plz = getSKBPLZ();
        var city = getSKBCity();
        
        if (city.toLowerCase() !== "berlin"){ return "";}

        adr = callCheckAddress(strname,hnr,hnrz,plz,city);
        address = "strname: " + adr.strname + "; " + "strnr: " + adr.strnr + "; " + "hausnr: " + adr.hnr + "; " + "hausnrz: " + adr.hnrz + "; " +  "plz: " + adr.zipcode + "; " +  "beznr: " + adr.beznr + "; " +  "otnr: " + adr.otnr + "; " + "etrs89_x" + adr.etrs89x  + "; " + "etrs89_y" + adr.etrs89y;
        return address;

    }else{
        return "";
    }
}

function testskbvalidation(){
    var address = "";
    if(isSKB()){
        var strname = getSKBStreet();
        var hnr = getSKBStreetNr();
        var hnrz = getSKBStreetExt();
        var plz = getSKBPLZ();
        var city = getSKBCity();
        address = validateTestaddress (strname, hnr, hnrz, plz, city);
    }
    return address;
}

function validateTestaddress(strnam, hnur, hnurz, zipcode, city){
    var address = "";
        if (city.toLowerCase() !== "berlin"){ return "";}

        adr = callCheckAddress(strnam,hnur,hnurz,zipcode,city);
        address = "strname: " + adr.strname + "; " + "strnr: " + adr.strnr + "; " + "hausnr: " + adr.hausnr + "; " + "hausnrz: " + adr.hausnrz + "; " +  "plz: " + adr.plz + "; " +  "bezname: " + adr.bzrname + "; " + "beznr: " + adr.beznr + "; " + "otname: " + adr.otname + "; " + "otnr: " + adr.otnr + "; " + "etrs89_x: " + adr.etrs89_x  + "; " + "etrs89_y: " + adr.etrs89_y;
        return address;
}

function callSKBeIDbeznr(){
    res = "";
    if (iseID()){
        var strname = geteIDStreetName();
        var hnr = geteIDStreetNr();
        var hnrz = geteIDStreetNrExt();
        var plz = geteIDPLZ();
        var city = geteIDCity();
        var address = callCheckAddress(strname,hnr,hnrz,plz,city);
        res = address.beznr;
    }else if(isSKB()){
        var strname = getSKBStreet();
        var hnr = getSKBStreetNr();
        var hnrz = getSKBStreetExt();
        var plz = getSKBPLZ();
        var city = getSKBCity();
        var address = callCheckAddress(strname,hnr,hnrz,plz,city);
        res = address.beznr;
    }
    return res;
}

function callSKBeIDbezname(){
    res = "";
    if (iseID()){
        var strname = geteIDStreetName();
        var hnr = geteIDStreetNr();
        var hnrz = geteIDStreetNrExt();
        var plz = geteIDPLZ();
        var city = geteIDCity();
        var address = callCheckAddress(strname,hnr,hnrz,plz,city);
        res = address.bzrname;
    }else if(isSKB()){
        var strname = getSKBStreet();
        var hnr = getSKBStreetNr();
        var hnrz = getSKBStreetExt();
        var plz = getSKBPLZ();
        var city = getSKBCity();
        var address = callCheckAddress(strname,hnr,hnrz,plz,city);
        res = address.bzrname;
    }
    return res;
}

function callSKBeIDotname(){
    res = "";
    if (iseID()){
        var strname = geteIDStreetName();
        var hnr = geteIDStreetNr();
        var hnrz = geteIDStreetNrExt();
        var plz = geteIDPLZ();
        var city = geteIDCity();
        var address = callCheckAddress(strname,hnr,hnrz,plz,city);
        res = address.otname;
    }else if(isSKB()){
        var strname = getSKBStreet();
        var hnr = getSKBStreetNr();
        var hnrz = getSKBStreetExt();
        var plz = getSKBPLZ();
        var city = getSKBCity();
        var address = callCheckAddress(strname,hnr,hnrz,plz,city);
        res = address.otname;
    }
    return res;
}

function callSKBeIDotnr(){
    res = "";
    if (iseID()){
        var strname = geteIDStreetName();
        var hnr = geteIDStreetNr();
        var hnrz = geteIDStreetNrExt();
        var plz = geteIDPLZ();
        var city = geteIDCity();
        var address = callCheckAddress(strname,hnr,hnrz,plz,city);
        res = address.otnr;
    }else if(isSKB()){
        var strname = getSKBStreet();
        var hnr = getSKBStreetNr();
        var hnrz = getSKBStreetExt();
        var plz = getSKBPLZ();
        var city = getSKBCity();
        var address = callCheckAddress(strname,hnr,hnrz,plz,city);
        res = address.otnr;
    }
    return res;
}

function callSKBeIDstrnr(){
    res = "";
    if (iseID()){
        var strname = geteIDStreetName();
        var hnr = geteIDStreetNr();
        var hnrz = geteIDStreetNrExt();
        var plz = geteIDPLZ();
        var city = geteIDCity();
        var address = callCheckAddress(strname,hnr,hnrz,plz,city);
        res = address.strnr;
    }else if(isSKB()){
        var strname = getSKBStreet();
        var hnr = getSKBStreetNr();
        var hnrz = getSKBStreetExt();
        var plz = getSKBPLZ();
        var city = getSKBCity();
        var address = callCheckAddress(strname,hnr,hnrz,plz,city);
        res = address.strnr;
    }
    return res;
}


function callSKBeIDetrs89x(){
    res = "";
    if (iseID()){
        var strname = geteIDStreetName();
        var hnr = geteIDStreetNr();
        var hnrz = geteIDStreetNrExt();
        var plz = geteIDPLZ();
        var city = geteIDCity();
        var address = callCheckAddress(strname,hnr,hnrz,plz,city);
        res = address.etrs89_x;
    }else if(isSKB()){
        var strname = getSKBStreet();
        var hnr = getSKBStreetNr();
        var hnrz = getSKBStreetExt();
        var plz = getSKBPLZ();
        var city = getSKBCity();
        var address = callCheckAddress(strname,hnr,hnrz,plz,city);
        res = address.etrs89_x;
    }
    return res;
}

function callSKBeIDetrs89y(){
    res = "";
    if (iseID()){
        var strname = geteIDStreetName();
        var hnr = geteIDStreetNr();
        var hnrz = geteIDStreetNrExt();
        var plz = geteIDPLZ();
        var city = geteIDCity();
        var address = callCheckAddress(strname,hnr,hnrz,plz,city);
        res = address.etrs89_y;
    }else if(isSKB()){
        var strname = getSKBStreet();
        var hnr = getSKBStreetNr();
        var hnrz = getSKBStreetExt();
        var plz = getSKBPLZ();
        var city = getSKBCity();
        var address = callCheckAddress(strname,hnr,hnrz,plz,city);
        res = address.etrs89_y;
    }
    return res;
}





assistants.xpath.addNamespace('rbs', 'https://fbinter.stadt-berlin.de/rbs');

function isObjectEmpty(value) {
    return (
      Object.prototype.toString.call(value) === '[object Object]' &&
      JSON.stringify(value) === '{}'
    );
  }


function callCheckAddress(strname, hnr, hnrz, zipcode, city){
	var strnr = "";
	var arg = "";
    var address = {
        strname: "",
        strnr: "",
        hausnr: "",
        hausnrz: "",
        plz: "",
        bzrname: "",
        beznr: "",
        otname: "",
        otnr: "",
        etrs89_x: "",
        etrs89_y: ""
    };
    if (city.toLowerCase() !== 'berlin'){
        return address;
    }

    urlrbsstrliste = geturlrbsstrliste();
    urlrbsdata = geturlrbsdata();

	var oneAddress = assistants.rest(urlrbsdata + "strname={street}&hausnr={housenr}&hausnrz={housenrsx}", {
        street: strname,
        housenr: hnr,
        housenrsx: hnrz
    }).lazy()
    .get()
    .entity({
		200: response => {
			return response.entity;
			},
		404: response => {
			return undefined;
			}
	});
	
    if (oneAddress === undefined) {
        assistants.log.error("Diese Adresse existiert nicht");
        return address;
        //return {fehler: true, fehlerDetail: "Diese Adresse existiert nicht"};
    }else{
        var crbsadr = assistants.xpath.select(oneAddress, "count(/rbs:rbs-adr-liste/rbs:rbs-adr)");
        if (crbsadr == undefined){return address;}
        //if (crbsadr == 0){return address;}
        
        if (crbsadr < 1){
            //if address is not exact
            var strlist =[];
            //get the street numbers that correspond to this street name
            strlist = callStreetList(strname);
            //try each street nummer and house number until zipcodes are the same
            if(strlist.length > 0){
                for (var i = 0; i < strlist.length; i++){
                    // address = "";
                    // print("checking street: " + strlist[i] + " from " + strlist.length + " streetnumbers");
                    address = getUniqueAddress(strlist[i],hnr,hnrz,zipcode);
                    // print ("address: " + address);
                    // if (address.beznr !== ""){
                        return address;
                    // }             
                }
            }else{
                return address;
            }
            
        }else if(crbsadr === 1){
            //Address is exact and verifiable
            var strname = assistants.xpath.select(oneAddress, "string(//rbs:rbs-adr/rbs:strname)");
            var strnr = assistants.xpath.select(oneAddress, "string(//rbs:rbs-adr/@strnr)");
            var beznr = assistants.xpath.select(oneAddress, "string(//rbs:rbs-adr/@beznr)");
            var bezname = assistants.xpath.select(oneAddress, "string(//rbs:rbs-adr/rbs:bezname)");
            var otnr =  assistants.xpath.select(oneAddress, "string(//rbs:rbs-adr/@otnr)");
            var otname =  assistants.xpath.select(oneAddress, "string(//rbs:rbs-adr/rbs:otname)");
            var etrs89x = assistants.xpath.select(oneAddress, "string(//rbs:rbs-adr/@etrs89_x)");
            var etrs89y = assistants.xpath.select(oneAddress, "string(//rbs:rbs-adr/@etrs89_y)");
            address = {
                strname: strname,
                strnr: strnr,
                hausnr: hnr,
                hausnrz: hnrz,
                plz: zipcode,
                beznr: beznr,
                bzrname: bezname,
                otnr: otnr,
                otname: otname,
                etrs89_x: etrs89x,
                etrs89_y: etrs89y
            };
            // address = "strname: " + strname + "; " + "strnr: " + strnr + "; " + "hausnr: " + hnr + "; " + "hausnrz: " + hnrz + "; " +  "plz: " + zipcode + "; " +  "beznr: " + beznr + "; " +  "otnr: " + otnr + "; " + "etrs89_x" + etrs89x  + "; " + "etrs89_y" + etrs89y;
            // print ("address: " + address);
            return address;
            
        }else{
            return address;
        }
        //return ("count rbs-adr-liste: " + strlist.length);
    }
}

function callStreetList(street){
    urlrbsstrliste = geturlrbsstrliste();
    var strarr = [];
    var streetlist = assistants.rest(urlrbsstrliste + "strname={street}", {
        street: street
    }).lazy()
    .get()
    .entity({
        200: response => {
            return response.entity;
        },
        404: response => {
            return undefined;
        }
    });
    if (streetlist === undefined) {
        assistants.log.error("Diese Adresse existiert nicht");
        return (strarr);
        //return {fehler: true, fehlerDetail: "Diese Adresse existiert nicht"};
    }else{
        var cliste = assistants.xpath.select(streetlist, "count(//rbs:rbs-str/@strnr)");
        //return cliste;
        if (cliste > 1) {
            var results = [];
            for (var i=1;i < cliste + 1; i++){
                var arg1 = "string(//rbs:rbs-str[";
                var arg2 = i;
                var arg3 = "]/@strnr)"
                var arg = arg1 + arg2 + arg3;
                var res = assistants.xpath.select(streetlist, arg);
                results.push(res);
            
            
        }
        
        return (results);
        }
    }
}

function getUniqueAddress(strnr,hnr,hnrz,zipcode){
    urlrbsstrliste = geturlrbsstrliste();
    urlrbsdata = geturlrbsdata();
    var address = {
        strname: "",
        strnr: "",
        hausnr: "",
        hausnrz: "",
        plz: "",
        bzrname: "",
        beznr: "",
        otname: "",
        otnr: "",
        etrs89_x: "",
        etrs89_y: ""
    };
    var streetlist = assistants.rest(urlrbsdata + "strnr={street}&hausnr={housenr}&hausnrz={housenrsx}", {
        street: strnr,
        housenr: hnr,
        housenrsx: hnrz
    }).lazy()
    .get()
    .entity({
		200: response => {
			return response.entity;
			},
		404: response => {
			return undefined;
			}
	});
    if (streetlist === undefined) {
        assistants.log.error("Diese Adresse existiert nicht");
        return address;
        //return {fehler: true, fehlerDetail: "Diese Adresse existiert nicht"};
    }else{
        var crbsadr = assistants.xpath.select(streetlist, "count(/rbs:rbs-adr-liste/rbs:rbs-adr)");
        
        if(crbsadr === 1){
            var plz = assistants.xpath.select(streetlist, "string(//rbs:rbs-adr/@postleit)");
            
            if (zipcode === plz){ //compare zipcode and plz
                var strname = assistants.xpath.select(streetlist, "string(//rbs:rbs-adr/rbs:strname)");
                var strnr = assistants.xpath.select(streetlist, "string(//rbs:rbs-adr/@strnr)");
                var beznr = assistants.xpath.select(streetlist, "string(//rbs:rbs-adr/@beznr)");
                var bezname = assistants.xpath.select(streetlist, "string(//rbs:rbs-adr/rbs:bezname)");
                var otnr =  assistants.xpath.select(streetlist, "string(//rbs:rbs-adr/@otnr)");
                var otname =  assistants.xpath.select(streetlist, "string(//rbs:rbs-adr/rbs:otname)");
                var etrs89x = assistants.xpath.select(streetlist, "string(//rbs:rbs-adr/@etrs89_x)");
                var etrs89y = assistants.xpath.select(streetlist, "string(//rbs:rbs-adr/@etrs89_y)");
                address = {
                    strname: strname,
                    strnr: strnr,
                    hausnr: hnr,
                    hausnrz: hnrz,
                    plz: zipcode,
                    beznr: beznr,
                    bzrname: bezname,
                    otnr: otnr,
                    otname: otname,
                    etrs89_x: etrs89x,
                    etrs89_y: etrs89y
                };
                // address = "strname: " + strname + "; " + "strnr: " + strnr + "; " + "hausnr: " + hnr + "; " + "hausnrz: " + hnrz + "; " +  "plz: " + zipcode + "; " +  "beznr: " + beznr + "; " +  "otnr: " + otnr + "; " + "etrs89_x" + etrs89x  + "; " + "etrs89_y" + etrs89y;
                return address;
            }else{
                return address;
            }
            
            
        }else{
            return address;
        }
    }


}

//---------------- Server side address validation --------------------------//