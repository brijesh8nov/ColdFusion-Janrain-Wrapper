<!--- JAINRAIN (BASIC) ColdFusion integration  http://http://www.janrain.com/ --->
<!--- Created By - Brijesh Chauhan: brijesh@brijeshradhika.com --->
<!--- Date Created: 30 July 2011 --->
<!--- Date Modified: 30 July 2011 - Version 1.0 --->

<!--- Parametes --->

<cfparam name="form.Token" default="">
<cfset iniFile = expandPath("./jainrain.ini")>
<cfset ApiKey = getProfileString(iniFile, "apikey", "apikey")>
<cfset apiURL = getProfileString(iniFile, "authURL", "apiUrl")>

<!--- Function to get the AUTH INFO --->
<cffunction name="auth" returntype="any" access="public" output="no" hint="Used to get basic auth info">
	<cfargument name="apiKey" required="yes" type="string" hint="JainRain API KEY">
    <cfargument name="token" required="yes" type="string" hint="Token Parameter Received">
    <cfargument name="extended" required="no" type="boolean" default="false" hint="Returns the extended Registration Data">
    <cfargument name="tokenURL" required="no" type="any" hint="validation of specified token url">
    <cfargument name="format" required="no" type="string" default="xml" hint="Return Format can be JSON or XML">
    <cfargument name="apiURL" required="yes" type="string" hint="API URL FOR AUTH INFO">
        <!--- CFHTTP the information --->
        <cfhttp url="#Arguments.apiUrl#" method="post">
        	<cfhttpparam type="formfield" name="apiKey" value="#Arguments.apikey#">
            <cfhttpparam type="formfield" name="token" value="#Arguments.token#">
            <cfhttpparam type="formfield" name="format" value="#Arguments.format#">
            <cfhttpparam type="formfield" name="extended" value="#Arguments.extended#">
        </cfhttp>
        
        <cfreturn cfhttp.FileContent/>
</cffunction>

<cfif form.Token NEQ ''>
	<cfset Token = form.Token />
    <cfset authInfo = auth(ApiKey,Token) />
</cfif>

<!--- TO DO // CODE FOR NEXT STEP --->


