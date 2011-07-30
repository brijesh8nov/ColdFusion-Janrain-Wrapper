<!--- JAINRAIN (BASIC) ColdFusion integration  http://http://www.janrain.com/ --->
<!--- Created By - Brijesh Chauhan: brijesh@brijeshradhika.com --->
<!--- Date Created: 30 July 2011 --->
<!--- Date Modified: 30 July 2011 - Version 1.0 --->

<!--- Parametes --->

<cfparam name="form.Token" default="">
<cfparam name="resultFormat" default="json">
<cfset iniFile = expandPath("./jainrain.ini")>
<cfset ApiKey = getProfileString(iniFile, "apikey", "apikey")>
<cfset apiURL = getProfileString(iniFile, "authURL", "apiUrl")>

<!--- Function to get the AUTH INFO --->
<cffunction name="auth" returntype="any" access="public" output="no" hint="Used to get basic auth info">
	<cfargument name="apiKey" required="yes" type="string" hint="JainRain API KEY">
    <cfargument name="token" required="yes" type="string" hint="Token Parameter Received">
    <cfargument name="apiURL" required="yes" type="string" hint="API URL FOR AUTH INFO">
    <cfargument name="extended" required="no" type="boolean" default="false" hint="Returns the extended Registration Data">
    <cfargument name="tokenURL" required="no" type="any" hint="validation of specified token url">
    <cfargument name="format" required="no" type="string" default="json" hint="Return Format can be JSON or XML">
        <!--- CFHTTP the information --->
        <cfhttp url="#Arguments.apiUrl#" method="post">
        	<cfhttpparam type="formfield" name="apiKey" value="#Arguments.apikey#">
            <cfhttpparam type="formfield" name="token" value="#Arguments.token#">
            <cfhttpparam type="formfield" name="format" value="#Arguments.format#">
            <cfhttpparam type="formfield" name="extended" value="#Arguments.extended#">
        </cfhttp>
        
        <cfreturn cfhttp.FileContent/>
</cffunction>

<!--- Function to Parse the results --->
<cffunction name="parseResults" access="public" returntype="any" output="no" hint="Used to PARSE the results for Jainrain Auth">
	<cfargument name="authInfo" required="yes" type="any">
    <cfargument name="resultFormat" required="yes" type="string">
    
    <cfif Arguments.resultFormat IS 'xml'>
    	<cfset parsedObj = xmlParse(Arguments.authInfo)>
    <cfelseif Arguments.resultFormat IS 'json'>
    	<cfset parsedObj = deserializeJson(Arguments.authInfo)>
    <cfelse>
    	<cfreturn 'Invalid return Format'>
        <cfabort>
	</cfif>
    
    <cfreturn parsedObj>
    
</cffunction>

<cfif form.Token NEQ ''>
	<cfset Token = form.Token />
    <cfset authInfo = auth(ApiKey,Token,apiURL) />
	<!--- The below STEP should be according to your website configuration --->
    <cfset results = parseResults(authInfo,resultFormat)/>
    <cfdump var="#results#">
</cfif>




