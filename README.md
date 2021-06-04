<h2>Elemente</h2> 

SKB-Personendaten, - Kontaktdaten,  und - Adressdaten

Hilfsfelder sind im Antragsassistenten nicht sichtbar und werden für die Berechnung oder das Speichern/Abrufen von Werten verwendet.

<h2>Varianten</h2>

 geo-bezogen (Auswahl hat momentan keine Relevanz)

<h2>Verwendung</h2>

Der Baustein wird in Antragsassistenten eingebaut, in denen die SKB2-Daten abgerufen werden sollen.

<h2>Folgende Schritte sind zur Integration des Bausteins durchzuführen:</h2>

<h3> 1. Anpassung des Modellverzeichnisses (Plugin-Dateien und XML-Dateien) </h3>

Dazu müssen die Bausteindateien im Modellverzeichnis, idealerweise in einem separaten Bausteinordner, abgelegt werden. 
Anschließend den Ordner „ui-rbs2“ aus dem Bausteinverzeichnis buerger_skb2_baustein/Ressourcen/plugins in das Modellverzeichnis <Modellname-Assistent>-Ressourcen/plugins kopieren. 

Die Dateien „staat_2019_04_01.xml“, "rbs-bez-liste-xml.xml" und "rbs_url.xml" aus dem Bausteinordner buerger_skb2_baustein-Dateien/WEB-INF/data in das Modellverzeichnis <Modellname-Assistent>-Dateien/WEB-INF/data kopieren.


2. Anpassung der Modellattribute (Erweiterungen und ScriptEngine)

Mit der Integration des Bausteins ist eine Anpassung der folgenden Modellattribute erforderlich:

Attribut „Erweiterungen“: hier wird der Wert „ui-rbs2“ hinterlegt
Attribut „ScriptEngine“: hier wird der Wert „rhino“ hinterlegt

3. Composer-Datei des Antragsassistenten öffnen und den Baustein "buerger_skb2_baustein" als Referenz einfügen

4. Den Baustein mit den entsprechenden Satz mit einer Relation des Typs "Association" verbinden und eine Gliederungsnummer vergeben

5. Einbindung des xml-Feldes "urlrbs" (Umgehungslösung)

Das im Baustein enthaltene xml-Feld "urlrbs" muss, trotz des im Attribut hinterlegten Wertes "CONTEXT", aus dem Baustein kopiert und an den zum Baustein gehörenden Satz angebunden werden (siehe Abbildung rechts).

Anmerkungen:

Die Umsetzung der unterschiedlichen RBS-Szenarien ist in der Dokumentation des Bausteins "rbs_baustein_req_v2" dokumentiert.

Bei der Übernahme von eID-Adressdaten ist im Gegensatz zu den SKB2-Adressdaten, eine Anpassung durch den Nutzer im Antragsassistenten nicht möglich. Die eID-Adressdaten können technisch nicht aus dem Antrag gelöscht werden. Zur Vermeidung des visuellen Verlustes der Adressdaten nach einem Rücksprung im Assistenten zur eID-Funktion, sollte im Modell ein separates eID-Feld mit der Funktion "js:{iseID()}" hinterlegt werden.
