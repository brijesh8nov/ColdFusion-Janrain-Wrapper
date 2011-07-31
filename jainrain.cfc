<!--- ----------------------------------------------------------------------  --->
<!--- JAINRAIN (BASIC) ColdFusion integration  http://http://www.janrain.com/ --->
<!--- Created By - Brijesh Chauhan: brijesh@brijeshradhika.com --->
<!--- Date Created: 31 July 2011 --->
<!--- Date Modified: 31 July 2011 - Version 1.0;; Added the init() function  --->
<!--- ---------------------------------------------------------------------- --->

<cfcomponent hint="JainRain (Basic) Component for Single Signon">

<!--- INIT function --->
<cffunction name="init" output="no">
	<cfargument name="apiKey" required="yes" type="string">
    <cfargument name="apiURL" required="yes" type="string">
    <cfargument name="apiToken" required="yes" type="string">
    <cfargument name="resultFormat" required="yes" type="string">
    	<cfset variables.apiKey = Arguments.apikey/>
        <cfset variables.apiURL = Arguments.apiURL/>
        <cfset variables.apiToken = Arguments.apiToken/>
        <cfset variables.resultFormat = Arguments.resultFormat/>
        <cfreturn this>
</cffunction>
        
<!--- Function to get the AUTH INFO --->
<cffunction name="auth" returntype="any" access="public" output="no" hint="Used to get basic auth info">
    <cfargument name="extended" required="no" type="boolean" default="false" hint="Returns the extended Registration Data">
    <cfargument name="tokenURL" required="no" type="any" hint="validation of specified token url">
    <cfargument name="format" required="no" type="string" default="json" hint="Return Format can be JSON or XML">
        <!--- ---------------------- --->
        <!--- CFHTTP the information --->
        <!--- ---------------------- --->
        <cfhttp url="#variables.apiUrl#" method="post">
        	<cfhttpparam type="formfield" name="apiKey" value="#variables.apikey#">
            <cfhttpparam type="formfield" name="token" value="#variables.apiToken#">
            <cfhttpparam type="formfield" name="format" value="#Arguments.format#">
            <cfhttpparam type="formfield" name="extended" value="#Arguments.extended#">
        </cfhttp>
        
        <cfreturn cfhttp.FileContent/>
</cffunction>

<!--- Function to Parse the results --->
<cffunction name="parseResults" access="public" returntype="any" output="no" hint="Used to PARSE the results for Jainrain Auth">
	<cfargument name="authInfo" required="yes" type="any">
    
    <cfif variables.resultFormat IS 'xml'>
    	<cfset parsedObj = xmlParse(Arguments.authInfo)>
    <cfelseif variables.resultFormat IS 'json'>
    	<cfset parsedObj = deserializeJson(Arguments.authInfo)>
    <cfelse>
    	<cfreturn 'Invalid return Format'>
        <cfabort>
	</cfif>
    
    <cfreturn parsedObj>
    
</cffunction>

</cfcomponent>