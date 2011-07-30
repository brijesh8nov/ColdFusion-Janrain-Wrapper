<!--- JAINRAIN (BASIC) ColdFusion integration  http://http://www.janrain.com/ --->
<!--- Created By - Brijesh Chauhan: brijesh@brijeshradhika.com --->
<!--- Date Created: 30 July 2011 --->
<!--- Date Modified: 30 July 2011 - Version 1.0 --->


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>JainRain Login Page </title>

</head>

<body>
<!--- INTIAL SETTINGS --->
<cfset iniFile = expandPath("./jainrain.ini")>
<cfset tokenURL = getProfileString(iniFile, "tokenURL", "tokenURL")>
<!--- Display the LOGIN LOGOS --->
<iframe src="http://weborchid.rpxnow.com/openid/embed?token_url=<cfoutput>#urlEncodedFormat(tokenURL)#</cfoutput>" scrolling="no" frameBorder="no" allowtransparency="true" style="width:400px;height:240px"></iframe> 
</body>
</html>