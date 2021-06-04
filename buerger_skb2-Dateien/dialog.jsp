<?xml version="1.0" encoding="utf-8"?>
<%@ page contentType="application/xhtml+xml; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://www.cit.de/ns/jsp" prefix="cit" %>
<%@ page import="de.cit.jsp.control.PageProcessor" %>
<%! private boolean isVisited(final HttpSession session, final String id) { return ((java.util.Set)session.getAttribute("composer.visitedPages")).contains(id); } %>
<% if (session.getAttribute("composer.visitedPages") == null) { session.setAttribute("composer.visitedPages", java.util.Collections.synchronizedSet(new java.util.HashSet())); } %>
<% PageProcessor pageProcessor = PageProcessor.getSessionInstance(session); %>
<% pageProcessor.createSyncPoint("buerger_skb2"); %>
<% ((java.util.Set)session.getAttribute("composer.visitedPages")).add("buerger_skb2"); %>

<%!
static java.lang.reflect.Method getComments;
static {
  try {
    getComments = de.cit.jsp.tags.FormTag.class.getMethod("getComments", String.class);
  } catch (NoSuchMethodException e) {
  }
}
   static String getComments(final Object form, final String fieldname) {
      try {
         return form != null && getComments != null ? (String) getComments.invoke(form, fieldname) : "";
      } catch (Exception e) {
         return "";
      }
   }
%>
    

<!DOCTYPE html
  PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:cit="http://www.cit.de/ns/jsp" xmlns:html="http://www.w3.org/1999/xhtml" lang="de-DE" class="no-js">
   <head>
      <cit:useBean name="myForm" class="de.cit.assistants.DataBean"/>
      <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
      <meta content="width=device-width, initial-scale=1, user-scalable=yes" name="viewport"/><% String buildRelease = application.getInitParameter("build.release"); if (buildRelease != null) {%><meta name="build.release" content="<%= buildRelease %>"/><% } %><% String buildNumber = application.getInitParameter("build.number"); if (buildNumber != null) {%><meta name="build.number" content="<%= buildNumber %>"/><% } %><% String buildRevision = application.getInitParameter("build.revision"); if (buildRevision != null) {%><meta name="build.revision" content="<%= buildRevision %>"/><% } %><!--plugin:theme-html5-->
    <cit:theme/>
    
      <script charset="utf-8" src="_plugins/theme-html5/script.js?-8236014590501371310" type="text/javascript"/>
  <!--plugin:ui-rbs2-->
        
      <script src="_plugins/ui-rbs2/ui-rbs2.js?4177272317422552621" type="text/javascript"/>
        
      <script src="_plugins/ui-rbs2/bsnrbs.AutoSuggest_2.1.3.js?5851351268818775181" type="text/javascript"/>
		
      <cit:script fileEncoding="utf-8" href="/WEB-INF/include/js/rbs_baustein_req_eid_skb2.js"/>
		
      <cit:script fileEncoding="utf-8" href="/WEB-INF/include/js/persoenliche_angaben_skb2.js"/>
        
      <cit:script fileEncoding="utf-8" href="/WEB-INF/include/js/kontaktdaten_skb2.js"/>
   
      <title id="page-title">
         <cit:conditional test="!assistants.request.valid">Fehler beim Ausfüllen - </cit:conditional>buerger_skb2 - buerger_skb2</title>
      <cit:script href="/WEB-INF/etc/commons.js">/**/</cit:script>
      <cit:script href="/WEB-INF/etc/script.js" fileEncoding="utf-8">/**/</cit:script>
      <cit:script href="/WEB-INF/etc/custom.js" fileEncoding="windows-1252">/**/</cit:script>
      <cit:template select="/.." xhtml="true"/>
      <cit:control>
         <cit:link rel="helpbase" href="help.jsp"/>
         <cit:flow/>
      </cit:control>
   </head>
   <body id="buerger_skb2">
      <div id="custom_top"/>
      <div id="if">
         <div id="page" class=" has_roadmap_right">
            <header>
               <div class="dynamic_area">
                  <div class="headercontent">
                     <div id="logo"/>
                     <h1>buerger_skb2</h1>
                     <section id="useraccount"/>
                  </div>
               </div>
            </header>
            <nav id="roadmap" class="roadmap roadmap_right">
               <h3 class="accessibility">Dialogverlauf</h3>
               <button class="switch" type="button" onclick="return false;" aria-haspopup="true" aria-expanded="true" disabled="disabled">
                  <span class="icon-switch" aria-hidden="true"/>
                  <span class="accessibility">Dialogverlauf öffnen/schließen</span>
               </button>
               <ul class="icons"><% final boolean unvisited_d4e2 = !isVisited(session, "buerger_skb2"); %><li class='present<%= unvisited_d4e2 ? " unvisited" : "" %>'>
                     <span class="item">
                        <span class="label">
                           <span class="labeltext">buerger_skb2</span>
                           <span class="labelicon" title='<%= unvisited_d4e2 ? "Aktuelle Seite (nicht besucht)" : "Aktuelle Seite" %>'>
                              <span class="accessibility"><%= unvisited_d4e2 ? "Aktuelle Seite (nicht besucht)" : "Aktuelle Seite" %></span>
                           </span>
                        </span>
                     </span>
                  </li>
               </ul>
            </nav>
            <div class="dynamic_area">
               <article>
                  <section id="content" class=" narrow">
                     <cit:form beanName="myForm">
                        <div class="wizard-body">
                           <h2 id="title">buerger_skb2</h2>
                           <cit:conditional test="!assistants.request.valid &amp;&amp; (assistants.request.strictInvalid === undefined || assistants.request.strictInvalid === true)">
                              <p class="invalidInfo v2">
                                 <span class="icon-warning-sign" aria-hidden="true"/>
                                 <strong>Fehler beim Ausfüllen: Bitte überprüfen Sie Ihre Angaben.</strong>
                              </p>
                           </cit:conditional>
                           <cit:conditional test="!assistants.request.valid &amp;&amp; assistants.request.softInvalid === true">
                              <p class="invalidInfo v2 loose">
                                 <span class="icon-exclamation-sign" aria-hidden="true"/>
                                 <strong>Mögliche Fehler beim Ausfüllen: Bitte kontrollieren Sie Ihre Angaben nochmals. Wenn Sie sicher sind, klicken Sie erneut auf <em class="button-name icon-arrow-right">Weiter</em>.</strong>
                              </p>
                           </cit:conditional>
                           <p class="required-hint">
                              <em>
                                 <span class="required-mark" aria-hidden="true">*</span>
                                 <span aria-hidden="true"> Pflichtfelder</span>
                                 <span class="accessibility">Diese Seite enthält Pflichtfelder.</span>
                              </em>
                           </p>
                           <section class="group narrow">
                              <header>
                                 <h3>Persönliche Angaben</h3>
                              </header>
                              <cit:conditional test="iseID()">
                                 <section class="infobox narrow"><p><cit:display html="true" errorReplacement="―" expression="My.undefinedReplacement(getpersondata())"/></p></section>
                              </cit:conditional>
                              <cit:conditional test="isSKB() &amp;&amp; !iseID()">
                                 <section class="infobox narrow"><p><cit:display html="true" errorReplacement="―" expression="My.undefinedReplacement(getSKBpersondata())"/></p></section>
                              </cit:conditional>
                              <section class="block narrow label_before 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "anredeh") %>'>
                                 <cit:conditional test="!assistants.request.isValid('anredeh')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="anredeh"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="anredeh" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="anredeh" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="formline">
                                    <cit:inputLabel name="anredeh" v="2">
                                       <span id="$$ID$$">Anrede:</span>
                                    </cit:inputLabel>
                                    <div class="inputcontainer">
                                       <cit:inputSelect name="anredeh" ariaLabelledby="$label-id $error-ids" onDefault="iseID() ? &#34;&#34; : isSKB() ? getSKBPrefix() : &#34;&#34;">
                                          <cit:option value="">keine Anrede</cit:option>
                                          <cit:option value="Frau">Frau</cit:option>
                                          <cit:option value="Herr">Herr</cit:option>
                                       </cit:inputSelect>
                                    </div>
                                 </div>
                              </section>
                              <section class="block narrow label_before 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "F00000043_h") %>'>
                                 <cit:conditional test="!assistants.request.isValid('F00000043_h')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="F00000043_h"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="F00000043_h" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="F00000043_h" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="formline">
                                    <cit:inputLabel name="F00000043_h" v="2">
                                       <span id="$$ID$$">Titel:</span>
                                    </cit:inputLabel>
                                    <div class="inputcontainer">
                                       <cit:inputSelect name="F00000043_h" ariaLabelledby="$label-id $error-ids" onDefault="iseID() ? geteIDAcademicTitle() : isSKB() ? getSKBTitle() : &#34;&#34;">
                                          <cit:option value="">kein Titel</cit:option>
                                          <cit:option value="Dr.">Dr.</cit:option>
                                          <cit:option value="Dr. h.c.">Dr. h.c.</cit:option>
                                          <cit:option value="Prof.">Prof.</cit:option>
                                          <cit:option value="Prof. Dr.">Prof. Dr.</cit:option>
                                          <cit:option value="Prof. Dr. Dr.">Prof. Dr. Dr.</cit:option>
                                       </cit:inputSelect>
                                    </div>
                                 </div>
                              </section>
                              <section class="block narrow label_before 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "F00000013_h") %>'>
                                 <cit:conditional test="!assistants.request.isValid('F00000013_h')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="F00000013_h"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="F00000013_h" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="F00000013_h" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="formline">
                                    <cit:inputLabel name="F00000013_h" v="2">
                                       <span id="$$ID$$">Familienname</span>
                                    </cit:inputLabel>
                                    <div class="inputcontainer">
                                       <cit:inputText name="F00000013_h" ariaLabelledby="$label-id $error-ids" onDefault="iseID() ? geteIDFamilyNames() : isSKB() ? getSKBLastname() : &#34;&#34;"/>
                                    </div>
                                 </div>
                              </section>
                              <section class="block narrow label_before 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "F00000045_h") %>'>
                                 <cit:conditional test="!assistants.request.isValid('F00000045_h')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="F00000045_h"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="F00000045_h" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="F00000045_h" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="formline">
                                    <cit:inputLabel name="F00000045_h" v="2">
                                       <span id="$$ID$$">Vorname</span>
                                    </cit:inputLabel>
                                    <div class="inputcontainer">
                                       <cit:inputText name="F00000045_h" ariaLabelledby="$label-id $error-ids" onDefault="iseID() ? geteIDGivenNames() : isSKB() ? getSKBFirstname() : &#34;&#34;"/>
                                    </div>
                                 </div>
                              </section>
                              <section class="block narrow label_before 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "F00000066_h") %>'>
                                 <cit:conditional test="!assistants.request.isValid('F00000066_h')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="F00000066_h"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="F00000066_h" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="F00000066_h" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="formline">
                                    <cit:inputLabel name="F00000066_h" v="2">
                                       <span id="$$ID$$">Geburtsdatum</span>
                                       <span class="tooltip date_format_hint_only">
                                          <a target="intelliform_help" class="icon" href='<%= response.encodeURL("help.jsp#f00000066_h") %>'>
                                             <span class="accessibility">Hilfe öffnen</span>
                                          </a>
                                       </span>
                                    </cit:inputLabel>
                                    <div class="inputcontainer">
                                       <cit:inputDate name="F00000066_h" class="tiny focus-mark-before" ariaLabelledby="$label-id $error-ids d0e103_date_format_hint" showChooser="true" onDefault="iseID() ? geteIDDateOfBirth() : isSKB() ? (myForm.user.dateofbirth) ? getSKBDate(myForm.user.dateofbirth) : &#34;&#34; : &#34;&#34;"/>
                                    </div>
                                    <div class="tooltip_overlay">
                                       <div class="tooltip_text" id="d0e103_tooltip">
                                          <p class="date_format_hint" id="d0e103_date_format_hint">Bitte geben Sie hier ein Datum im Format TT.MM.JJJJ ein.</p>
                                          <button class="close" type="button" onclick="return false;">
                                             <span class="icon-close" aria-hidden="true"/>
                                             <span class="accessibility">Schließen</span>
                                          </button>
                                       </div>
                                    </div>
                                 </div>
                              </section>
                              <section class="block narrow label_before 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "F00000014_h") %>'>
                                 <cit:conditional test="!assistants.request.isValid('F00000014_h')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="F00000014_h"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="F00000014_h" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="F00000014_h" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="formline">
                                    <cit:inputLabel name="F00000014_h" v="2">
                                       <span id="$$ID$$">Geburtsname</span>
                                    </cit:inputLabel>
                                    <div class="inputcontainer">
                                       <cit:inputText name="F00000014_h" ariaLabelledby="$label-id $error-ids" onDefault="iseID() ? geteIDBirthName() : &#34;&#34;"/>
                                    </div>
                                 </div>
                              </section>
                              <cit:inputComputed name="anrede" value="myForm.anredeh"/>
                              <cit:inputComputed name="f00000043" value="myForm.F00000043_h"/>
                              <cit:inputComputed name="f00000013" value="myForm.F00000013_h"/>
                              <cit:inputComputed name="f00000045" value="myForm.F00000045_h"/>
                              <cit:inputComputed name="f00000066" value="myForm.F00000066_h"/>
                              <cit:inputComputed name="f00000014" value="myForm.F00000014_h"/>
                           </section>
                           <section class="group narrow">
                              <header>
                                 <h3>Kontaktdaten</h3>
                              </header>
                              <cit:conditional test="isSKB()">
                                 <section class="infobox narrow"><p><cit:display html="true" errorReplacement="―" expression="My.undefinedReplacement(getSKBcontactdata())"/></p></section>
                              </cit:conditional>
                              <section class="block narrow label_before 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "F00000069h") %>'>
                                 <cit:conditional test="!assistants.request.isValid('F00000069h')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="F00000069h"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="F00000069h" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="F00000069h" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="formline">
                                    <cit:inputLabel name="F00000069h" v="2">
                                       <span id="$$ID$$">Telefon</span>
                                    </cit:inputLabel>
                                    <div class="inputcontainer">
                                       <cit:inputText name="F00000069h" ariaLabelledby="$label-id $error-ids" onDefault="isSKB() ? getSKBTelefon() : &#34;&#34;"/>
                                    </div>
                                 </div>
                              </section>
                              <section class="block narrow label_before 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "F00000071h") %>'>
                                 <cit:conditional test="!assistants.request.isValid('F00000071h')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="F00000071h"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="F00000071h" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="F00000071h" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="formline">
                                    <cit:inputLabel name="F00000071h" v="2">
                                       <span id="$$ID$$">E-Mail-Adresse</span>
                                    </cit:inputLabel>
                                    <div class="inputcontainer">
                                       <cit:inputText name="F00000071h" ariaLabelledby="$label-id $error-ids" onDefault="isSKB() ? getSKBEmail() : &#34;&#34;"/>
                                    </div>
                                 </div>
                              </section>
                              <cit:inputComputed name="f00000069" value="myForm.F00000069h"/>
                              <cit:inputComputed name="f00000071" value="myForm.F00000071h"/>
                           </section>
                           <section class="group narrow rbs">
                              <header>
                                 <h3>Adressdaten</h3>
                              </header>
                              <cit:xmlResource id="C00000009" src="js:{myForm.transaction ? 'vfs:///root/intelliForm-Mandanten/default/Ressourcen/xml/staat_2019-04-01.xml' : '/WEB-INF/data/staat_2019-04-01.xml' }" scope="CONTEXT"/>
                              <section class="block narrow label_before 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "onlyberlin") %>'>
                                 <cit:conditional test="!assistants.request.isValid('onlyberlin')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="onlyberlin"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="onlyberlin" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="onlyberlin" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="formline">
                                    <cit:inputLabel name="onlyberlin" v="2">
                                       <span id="$$ID$$">onlyberlin:</span>
                                    </cit:inputLabel>
                                    <div class="inputcontainer">
                                       <cit:inputText name="onlyberlin" ariaLabelledby="$label-id $error-ids"/>
                                    </div>
                                 </div>
                              </section>
                              <cit:xmlResource id="rbsurl" src="js:{myForm.transaction ? 'vfs:///root/intelliForm-Mandanten/default/Ressourcen/xml/rbs_url.xml' : '/WEB-INF/data/rbs_url.xml' }" scope="CONTEXT"/>
                              <section class="block narrow label_before 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "urlrbsstrliste") %>'>
                                 <cit:conditional test="!assistants.request.isValid('urlrbsstrliste')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="urlrbsstrliste"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="urlrbsstrliste" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="urlrbsstrliste" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="formline">
                                    <cit:inputLabel name="urlrbsstrliste" v="2">
                                       <span id="$$ID$$">urlrbsstrliste:</span>
                                    </cit:inputLabel>
                                    <div class="inputcontainer">
                                       <cit:inputText name="urlrbsstrliste" ariaLabelledby="$label-id $error-ids" onDefault="geturlrbsstrliste()"/>
                                    </div>
                                 </div>
                              </section>
                              <section class="block narrow label_before 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "urlrbsdata") %>'>
                                 <cit:conditional test="!assistants.request.isValid('urlrbsdata')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="urlrbsdata"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="urlrbsdata" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="urlrbsdata" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="formline">
                                    <cit:inputLabel name="urlrbsdata" v="2">
                                       <span id="$$ID$$">urlrbsdata:</span>
                                    </cit:inputLabel>
                                    <div class="inputcontainer">
                                       <cit:inputText name="urlrbsdata" ariaLabelledby="$label-id $error-ids" onDefault="geturlrbsdata()"/>
                                    </div>
                                 </div>
                              </section>
                              <section class="block narrow label_before 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "iseid") %>'>
                                 <cit:conditional test="!assistants.request.isValid('iseid')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="iseid"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="iseid" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="iseid" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="formline">
                                    <cit:inputLabel name="iseid" v="2">
                                       <span id="$$ID$$">iseid:</span>
                                    </cit:inputLabel>
                                    <div class="inputcontainer">
                                       <cit:inputText name="iseid" ariaLabelledby="$label-id $error-ids" onDefault="{myForm.forcedeid}"/>
                                    </div>
                                 </div>
                              </section>
                              <section class="block live narrow 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "objtype") %>' data-live-stay="stay_nonval_d0e269">
                                 <cit:conditional test="!assistants.request.isValid('objtype')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="objtype"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="objtype" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="objtype" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="formline">
                                    <cit:inputLabel name="objtype" v="2">
                                       <span id="$$ID$$">Objekttyp</span>
                                    </cit:inputLabel>
                                    <div class="inputcontainer">
                                       <cit:inputSelect name="objtype" immediate="true" ariaLabelledby="$label-id $error-ids" default="'*STRASSE*">
                                          <cit:option value="*STRASSE*">*STRASSE*</cit:option>
                                          <cit:option value="AUTOBAHN">AUTOBAHN</cit:option>
                                          <cit:option value="AUTOBAHNABSCHNITT">AUTOBAHNABSCHNITT</cit:option>
                                          <cit:option value="BAHNHOF">BAHNHOF</cit:option>
                                          <cit:option value="BRUECKE">BRUECKE</cit:option>
                                          <cit:option value="BRUECKE_IN_PARK">BRUECKE_IN_PARK</cit:option>
                                          <cit:option value="FLUGHAFEN">FLUGHAFEN</cit:option>
                                          <cit:option value="FORST">FORST</cit:option>
                                          <cit:option value="FORSTAMT">FORSTAMT</cit:option>
                                          <cit:option value="FUSS-/RADWEG">FUSS-/RADWEG</cit:option>
                                          <cit:option value="FUSSGAENGERBRUECKE">FUSSGAENGERBRUECKE</cit:option>
                                          <cit:option value="GEWAESSER">GEWAESSER</cit:option>
                                          <cit:option value="GRUENANLAGE">GRUENANLAGE</cit:option>
                                          <cit:option value="HALBINSEL">HALBINSEL</cit:option>
                                          <cit:option value="INSEL">INSEL</cit:option>
                                          <cit:option value="KLEINGARTENANLAGE">KLEINGARTENANLAGE</cit:option>
                                          <cit:option value="OBJEKT">OBJEKT</cit:option>
                                          <cit:option value="OERTL.BEGRIFF">OERTL.BEGRIFF</cit:option>
                                          <cit:option value="PARK">PARK</cit:option>
                                          <cit:option value="PARKPLATZ">PARKPLATZ</cit:option>
                                          <cit:option value="PLATZ">PLATZ</cit:option>
                                          <cit:option value="PLATZ_IN_FORST">PLATZ_IN_FORST</cit:option>
                                          <cit:option value="PRIVATSTRASSE">PRIVATSTRASSE</cit:option>
                                          <cit:option value="SCHLEUSE">SCHLEUSE</cit:option>
                                          <cit:option value="SIEDLUNG">SIEDLUNG</cit:option>
                                          <cit:option value="SPORTSTAETTE">SPORTSTAETTE</cit:option>
                                          <cit:option value="STADTBAHNBOGEN">STADTBAHNBOGEN</cit:option>
                                          <cit:option value="STRASSE">STRASSE</cit:option>
                                          <cit:option value="STRASSE_IN_FORST">STRASSE_IN_FORST</cit:option>
                                          <cit:option value="STRASSE_IN_KGA">STRASSE_IN_KGA</cit:option>
                                          <cit:option value="STRASSE_IN_PARK">STRASSE_IN_PARK</cit:option>
                                          <cit:option value="TUNNEL">TUNNEL</cit:option>
                                          <cit:option value="VERWALTUNGSWEG">VERWALTUNGSWEG</cit:option>
                                          <cit:option value="WALDWEG">WALDWEG</cit:option>
                                          <cit:option value="WASSERWERK">WASSERWERK</cit:option>
                                          <cit:option value="WOHNSCHIFF">WOHNSCHIFF</cit:option>
                                          <cit:option value="ZUFAHRT">ZUFAHRT</cit:option>
                                       </cit:inputSelect>
                                    </div>
                                 </div>
                                 <cit:inputSubmit type="stay.nonval.d0e269" id="stay.nonval.d0e269" value="OK" title="Klicken Sie auf OK, um die Seite zu aktualisieren."/>
                                 <script type="text/javascript">document.getElementById('stay_nonval_d0e269').style.display='none';</script>
                                 <cit:script>_unmask(myForm, "objtype", "string");</cit:script>
                              </section>
                              <cit:conditional test="iseID()">
                                 <section class="infobox narrow iseid"><p><cit:display html="true" errorReplacement="―" expression="My.undefinedReplacement(getaddressdata())"/></p></section>
                              </cit:conditional>
                              <cit:conditional test="(!iseID() &amp;&amp; isSKB())">
                                 <section class="infobox narrow"><p><cit:display html="true" errorReplacement="―" expression="My.undefinedReplacement(getskbaddressdata())"/></p></section>
                              </cit:conditional>
                              <section class="block narrow label_before 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "F00000053h") %>'>
                                 <cit:conditional test="!assistants.request.isValid('F00000053h')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="F00000053h"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="F00000053h" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="F00000053h" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="formline">
                                    <cit:inputLabel name="F00000053h" v="2" required="true">
                                       <span id="$$ID$$">Straße<span class="required-mark">
                                             <span aria-hidden="true">*</span>
                                             <span class="accessibility"> Dies ist ein Pflichtfeld.</span>
                                          </span>
                                       </span>
                                    </cit:inputLabel>
                                    <div class="inputcontainer">
                                       <cit:inputText name="F00000053h" ariaLabelledby="$label-id $error-ids" required="true" onDefault="iseID() ? geteIDStreetName() : isSKB() ? getSKBStreet() : &#34;&#34;"/>
                                    </div>
                                 </div>
                              </section>
                              <section class="block narrow label_before width-xs 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "hnrh") %>'>
                                 <cit:conditional test="!assistants.request.isValid('hnrh')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:conditional test="!My.isCustomReason('hnrh')">
                                             <cit:errorText name="hnrh"/>
                                          </cit:conditional>
                                          <cit:conditional test="My.isCustomReason('hnrh')">
                                             <cit:errorText name="hnrh">
                                                <span id="$$ID$$">
                                                   <span class="accessibility">Fehler: </span>Bitte wählen Sie eine Hausnummer aus!</span>
                                             </cit:errorText>
                                          </cit:conditional>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="hnrh" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="hnrh" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="formline">
                                    <cit:inputLabel name="hnrh" v="2">
                                       <span id="$$ID$$">Hausnummer</span>
                                    </cit:inputLabel>
                                    <div class="inputcontainer">
                                       <cit:inputText name="hnrh" ariaLabelledby="$label-id $error-ids" onValidate="(/^\s*$/.test(value))||(myForm.objtype.includes(&#34;STRASSE&#34;) == true &amp;&amp; value.length == 0 ? false : true)" errtitle="Bitte wählen Sie eine Hausnummer aus!" onDefault="(iseID()) ? geteIDStreetNr() + geteIDStreetNrExt() : (isSKB()) ? getSKBStreetNr() + getSKBStreetExt(): &#34;&#34;"/>
                                    </div>
                                 </div>
                              </section>
                              <section class="block narrow label_before 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "F00000016h") %>'>
                                 <cit:conditional test="!assistants.request.isValid('F00000016h')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="F00000016h"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="F00000016h" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="F00000016h" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="formline">
                                    <cit:inputLabel name="F00000016h" v="2">
                                       <span id="$$ID$$">hausnr:</span>
                                    </cit:inputLabel>
                                    <div class="inputcontainer">
                                       <cit:inputText name="F00000016h" ariaLabelledby="$label-id $error-ids" onDefault="(iseID()) ? geteIDStreetNr() : (isSKB()) ? getSKBStreetNr() : &#34;&#34;"/>
                                    </div>
                                 </div>
                              </section>
                              <section class="block narrow label_before 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "F00000084h") %>'>
                                 <cit:conditional test="!assistants.request.isValid('F00000084h')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="F00000084h"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="F00000084h" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="F00000084h" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="formline">
                                    <cit:inputLabel name="F00000084h" v="2">
                                       <span id="$$ID$$">hausnrz:</span>
                                    </cit:inputLabel>
                                    <div class="inputcontainer">
                                       <cit:inputText name="F00000084h" ariaLabelledby="$label-id $error-ids" onDefault="(iseID()) ? geteIDStreetNrExt() : (isSKB()) ? getSKBStreetExt() : &#34;&#34;"/>
                                    </div>
                                 </div>
                              </section>
                              <section class="block narrow label_before width-xs 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "bisf00000016") %>'>
                                 <cit:conditional test="!assistants.request.isValid('bisf00000016')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="bisf00000016"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="bisf00000016" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="bisf00000016" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="formline">
                                    <cit:inputLabel name="bisf00000016" v="2">
                                       <span id="$$ID$$">Hausnummer (bis)</span>
                                    </cit:inputLabel>
                                    <div class="inputcontainer">
                                       <cit:inputText name="bisf00000016" ariaLabelledby="$label-id $error-ids"/>
                                    </div>
                                 </div>
                              </section>
                              <section class="block narrow label_before 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "adrzs") %>'>
                                 <cit:conditional test="!assistants.request.isValid('adrzs')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="adrzs"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="adrzs" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="adrzs" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="formline">
                                    <cit:inputLabel name="adrzs" v="2">
                                       <span id="$$ID$$">weiterer Adresshinweis</span>
                                    </cit:inputLabel>
                                    <div class="inputcontainer">
                                       <cit:inputText name="adrzs" ariaLabelledby="$label-id $error-ids"/>
                                    </div>
                                 </div>
                                 <footer><p><abbr title="zum Beispiel">z. B.</abbr> Hinterhof</p></footer>
                              </section>
                              <section class="block narrow label_before width-xs 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "F00000054h") %>'>
                                 <cit:conditional test="!assistants.request.isValid('F00000054h')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="F00000054h"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="F00000054h" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="F00000054h" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="formline">
                                    <cit:inputLabel name="F00000054h" v="2" required="true">
                                       <span id="$$ID$$">Postleitzahl<span class="required-mark">
                                             <span aria-hidden="true">*</span>
                                             <span class="accessibility"> Dies ist ein Pflichtfeld.</span>
                                          </span>
                                       </span>
                                    </cit:inputLabel>
                                    <div class="inputcontainer">
                                       <cit:inputText name="F00000054h" ariaLabelledby="$label-id $error-ids" required="true" onDefault="(iseID()) ? geteIDPLZ() : (isSKB()) ? getSKBPLZ() : &#34;&#34;"/>
                                    </div>
                                 </div>
                              </section>
                              <section class="block narrow label_before 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "otnameh") %>'>
                                 <cit:conditional test="!assistants.request.isValid('otnameh')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="otnameh"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="otnameh" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="otnameh" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="formline">
                                    <cit:inputLabel name="otnameh" v="2">
                                       <span id="$$ID$$">Ortsteil</span>
                                    </cit:inputLabel>
                                    <div class="inputcontainer">
                                       <cit:inputText name="otnameh" ariaLabelledby="$label-id $error-ids" onDefault="callSKBeIDotname()"/>
                                    </div>
                                 </div>
                              </section>
                              <section class="block narrow label_before 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "bzrnameh") %>'>
                                 <cit:conditional test="!assistants.request.isValid('bzrnameh')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="bzrnameh"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="bzrnameh" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="bzrnameh" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="formline">
                                    <cit:inputLabel name="bzrnameh" v="2">
                                       <span id="$$ID$$">Bezirk</span>
                                    </cit:inputLabel>
                                    <div class="inputcontainer">
                                       <cit:inputText name="bzrnameh" ariaLabelledby="$label-id $error-ids" onDefault="callSKBeIDbezname()"/>
                                    </div>
                                 </div>
                              </section>
                              <section class="block narrow label_before 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "otnrh") %>'>
                                 <cit:conditional test="!assistants.request.isValid('otnrh')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="otnrh"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="otnrh" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="otnrh" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="formline">
                                    <cit:inputLabel name="otnrh" v="2">
                                       <span id="$$ID$$">otnrh:</span>
                                    </cit:inputLabel>
                                    <div class="inputcontainer">
                                       <cit:inputText name="otnrh" ariaLabelledby="$label-id $error-ids" onDefault="callSKBeIDotnr()"/>
                                    </div>
                                 </div>
                              </section>
                              <section class="block narrow label_before 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "beznrh") %>'>
                                 <cit:conditional test="!assistants.request.isValid('beznrh')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="beznrh"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="beznrh" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="beznrh" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="formline">
                                    <cit:inputLabel name="beznrh" v="2">
                                       <span id="$$ID$$">beznrh:</span>
                                    </cit:inputLabel>
                                    <div class="inputcontainer">
                                       <cit:inputText name="beznrh" ariaLabelledby="$label-id $error-ids" onDefault="callSKBeIDbeznr()"/>
                                    </div>
                                 </div>
                              </section>
                              <section class="block narrow label_before 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "strnrh") %>'>
                                 <cit:conditional test="!assistants.request.isValid('strnrh')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="strnrh"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="strnrh" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="strnrh" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="formline">
                                    <cit:inputLabel name="strnrh" v="2">
                                       <span id="$$ID$$">strnrh:</span>
                                    </cit:inputLabel>
                                    <div class="inputcontainer">
                                       <cit:inputText name="strnrh" ariaLabelledby="$label-id $error-ids" onDefault="callSKBeIDstrnr()"/>
                                    </div>
                                 </div>
                              </section>
                              <section class="block narrow label_before 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "F00000035h") %>'>
                                 <cit:conditional test="!assistants.request.isValid('F00000035h')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="F00000035h"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="F00000035h" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="F00000035h" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="formline">
                                    <cit:inputLabel name="F00000035h" v="2" required="true">
                                       <span id="$$ID$$">Ort<span class="required-mark">
                                             <span aria-hidden="true">*</span>
                                             <span class="accessibility"> Dies ist ein Pflichtfeld.</span>
                                          </span>
                                       </span>
                                    </cit:inputLabel>
                                    <div class="inputcontainer">
                                       <cit:inputText name="F00000035h" ariaLabelledby="$label-id $error-ids" required="true" onDefault="(iseID()) ? geteIDCity() : isSKB() ? getSKBCity() : &#34;&#34;"/>
                                    </div>
                                 </div>
                              </section>
                              <section class="block narrow label_before 2_ro 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "landh") %>'>
                                 <cit:conditional test="!assistants.request.isValid('landh')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="landh"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="landh" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="landh" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="formline">
                                    <cit:inputLabel name="landh" v="2">
                                       <span id="$$ID$$">Land</span>
                                    </cit:inputLabel>
                                    <div class="inputcontainer">
                                       <cit:inputSelect name="landh" ariaLabelledby="$label-id $error-ids" onDefault="prefillLand()">
                                          <cit:option value="">---bitte auswählen---</cit:option>
                                          <cit:xmlOptions src="urn:xmlid:C00000009" select="/*/SimpleCodeList/Row" text="Value[@ColumnRef=&#34;Staatsname_kurz&#34;]/SimpleValue" value="Value[@ColumnRef=&#34;DESTATIS_Schluessel_Staat&#34;]/SimpleValue"/>
                                       </cit:inputSelect>
                                    </div>
                                 </div>
                              </section>
                              <section class="block narrow label_before 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "etrs89_xh") %>'>
                                 <cit:conditional test="!assistants.request.isValid('etrs89_xh')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="etrs89_xh"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="etrs89_xh" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="etrs89_xh" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="formline">
                                    <cit:inputLabel name="etrs89_xh" v="2">
                                       <span id="$$ID$$">etrs89_xh:</span>
                                    </cit:inputLabel>
                                    <div class="inputcontainer">
                                       <cit:inputText name="etrs89_xh" ariaLabelledby="$label-id $error-ids" onDefault="callSKBeIDetrs89x()"/>
                                    </div>
                                 </div>
                              </section>
                              <section class="block narrow label_before 2_hide" data-comments='<%= getComments(pageContext.getAttribute("form"), "etrs89_yh") %>'>
                                 <cit:conditional test="!assistants.request.isValid('etrs89_yh')">
                                    <p class="errorText v2">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <cit:errorText name="etrs89_yh"/>
                                       </strong>
                                    </p>
                                 </cit:conditional>
                                 <cit:errorText name="etrs89_yh" id="#page-strict">
                                    <p class="errorText v2" id="$$ID$$">
                                       <span class="icon-warning-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <cit:errorText name="etrs89_yh" id="#page-soft">
                                    <p class="errorText v2 loose" id="$$ID$$">
                                       <span class="icon-exclamation-sign" aria-hidden="true"/>
                                       <strong>
                                          <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                    </p>
                                 </cit:errorText>
                                 <div class="formline">
                                    <cit:inputLabel name="etrs89_yh" v="2">
                                       <span id="$$ID$$">etrs89_yh:</span>
                                    </cit:inputLabel>
                                    <div class="inputcontainer">
                                       <cit:inputText name="etrs89_yh" ariaLabelledby="$label-id $error-ids" onDefault="callSKBeIDetrs89y()"/>
                                    </div>
                                 </div>
                              </section>
                              <cit:inputComputed name="f00000053" value="(iseID()) ? geteIDStreetName() : myForm.F00000053h"/>
                              <cit:inputComputed name="hnr" value="(iseID()) ? geteIDStreetNr() + geteIDStreetNrExt() : myForm.hnrh"/>
                              <cit:inputComputed name="f00000016" value="(iseID()) ? geteIDStreetNr() : myForm.F00000016h"/>
                              <cit:inputComputed name="f00000084" value="(iseID()) ? geteIDStreetNrExt() : myForm.F00000084h"/>
                              <cit:inputComputed name="f00000054" value="(iseID()) ? geteIDPLZ() : myForm.F00000054h"/>
                              <cit:inputComputed name="otname" value="(iseID()) ? callSKBeIDotname() : myForm.otnameh"/>
                              <cit:inputComputed name="bzrname" value="(iseID()) ? callSKBeIDbezname() : myForm.bzrname"/>
                              <cit:inputComputed name="otnr" value="(iseID()) ? callSKBeIDotnr() : myForm.otnrh"/>
                              <cit:inputComputed name="bzrnr" value="(iseID()) ? callSKBeIDbeznr() : myForm.beznrh"/>
                              <cit:inputComputed name="strnr" value="(iseID()) ? callSKBeIDstrnr() : myForm.strnrh"/>
                              <cit:inputComputed name="f00000035" value="(iseID()) ? geteIDCity() : myForm.F00000035h"/>
                              <cit:inputComputed name="land" value="(iseID()) ? geteIDCountry() : myForm.landh"/>
                              <cit:inputComputed name="etrs89_x" value="(iseID()) ? callSKBeIDetrs89x() : myForm.etrs89_xh"/>
                              <cit:inputComputed name="etrs89_y" value="(iseID()) ? callSKBeIDetrs89y() : myForm.etrs89_yh"/>
                              <cit:inputComputed name="rbs_valid" value="validateAddress()"/>
                              <cit:inputComputed name="bezirk_nummer" value="myForm.bzrnr"/>
                           </section>
                        </div>
                        <nav id="roadmap_bottom" class="roadmap">
                           <h3 class="accessibility">Dialogverlauf</h3>
                           <ul class="icons"><% final boolean unvisited_d11e2 = !isVisited(session, "buerger_skb2"); %><li class='present<%= unvisited_d11e2 ? " unvisited" : "" %>'>
                                 <span class="item">
                                    <span class="label">
                                       <span class="labeltext">buerger_skb2</span>
                                       <span class="labelicon" title='<%= unvisited_d11e2 ? "Aktuelle Seite (nicht besucht)" : "Aktuelle Seite" %>'>
                                          <span class="accessibility"><%= unvisited_d11e2 ? "Aktuelle Seite (nicht besucht)" : "Aktuelle Seite" %></span>
                                       </span>
                                    </span>
                                 </span>
                              </li>
                           </ul>
                        </nav>
                        <div class="wizard-buttons">
                           <div class="wizard-buttons-row">
                              <div class="button">
                                 <cit:inputSubmit type="cancel" class="submit-cancel prio3 icon-remove-sign" tabindex="0" value="Abbrechen"/>
                              </div>
                              <div class="button">
                                 <cit:inputSubmit type="save" class="submit-save prio3 icon-save" tabindex="0" value="Unterbrechen..." title="Klicken Sie hier, wenn Sie den Vorgang jetzt unterbrechen und später fortsetzen möchten."/>
                              </div>
                              <div class="button">
                                 <cit:inputSubmit type="back" class="submit-back prio2 icon-arrow-left" tabindex="0" value="Zurück"/>
                              </div>
                              <div class="button">
                                 <cit:inputSubmit class="submit-forward" tabindex="0" value="Weiter" type="forward"/>
                              </div>
                           </div>
                        </div>
                     </cit:form>
                     <footer>
                        <div class="footercontent">
                           <span>Powered by cit intelliForm</span>
                        </div>
                     </footer>
                  </section>
               </article>
            </div>
         </div>
      </div>
      <div id="custom_bottom"/>
   </body>
</html>