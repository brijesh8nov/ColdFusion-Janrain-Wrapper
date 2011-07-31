<!--- JAINRAIN (BASIC) ColdFusion integration  http://http://www.janrain.com/ --->
<!--- Created By - Brijesh Chauhan: brijesh@brijeshradhika.com --->
<!--- Date Created: 30 July 2011 --->
<!--- Date Modified: 30 July 2011 - Version 1.0 --->
<!--- Date Modified: 31 July 2011 - Version 1.1, Added JainRain Component --->

<!--- Parametes --->
<cfparam name="form.Token" default="">
<cfparam name="resultFormat" default="json">
<cfset iniFile = expandPath("./jainrain.ini")>
<cfset ApiKey = getProfileString(iniFile, "apikey", "apikey")>
<cfset apiURL = getProfileString(iniFile, "authURL", "apiUrl")>


<cfif form.Token NEQ ''>
	<cfset Token = form.Token />
    <cfset JRObj = createObject("component","jainrain").init(ApiKey,apiURL,Token,resultFormat)/>
    <cfset authInfo = JRObj.auth() />
    
    <!--- ---------------------------------------------------------------- --->
	<!--- The below STEP should be according to your website configuration --->
    <!--- ---------------------------------------------------------------- --->
    
    <cfset results = JRObj.parseResults(authInfo)/>
    
    <cfdump var="#results#">
</cfif>




