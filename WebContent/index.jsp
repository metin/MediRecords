<HTML>
<HEAD>
<TITLE>Medi Records</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1251">
<script type="text/javascript">
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_nbGroup(event, grpName) { //v6.0
  var i,img,nbArr,args=MM_nbGroup.arguments;
  if (event == "init" && args.length > 2) {
    if ((img = MM_findObj(args[2])) != null && !img.MM_init) {
      img.MM_init = true; img.MM_up = args[3]; img.MM_dn = img.src;
      if ((nbArr = document[grpName]) == null) nbArr = document[grpName] = new Array();
      nbArr[nbArr.length] = img;
      for (i=4; i < args.length-1; i+=2) if ((img = MM_findObj(args[i])) != null) {
        if (!img.MM_up) img.MM_up = img.src;
        img.src = img.MM_dn = args[i+1];
        nbArr[nbArr.length] = img;
    } }
  } else if (event == "over") {
    document.MM_nbOver = nbArr = new Array();
    for (i=1; i < args.length-1; i+=3) if ((img = MM_findObj(args[i])) != null) {
      if (!img.MM_up) img.MM_up = img.src;
      img.src = (img.MM_dn && args[i+2]) ? args[i+2] : ((args[i+1])? args[i+1] : img.MM_up);
      nbArr[nbArr.length] = img;
    }
  } else if (event == "out" ) {
    for (i=0; i < document.MM_nbOver.length; i++) {
      img = document.MM_nbOver[i]; img.src = (img.MM_dn) ? img.MM_dn : img.MM_up; }
  } else if (event == "down") {
    nbArr = document[grpName];
    if (nbArr)
      for (i=0; i < nbArr.length; i++) { img=nbArr[i]; img.src = img.MM_up; img.MM_dn = 0; }
    document[grpName] = nbArr = new Array();
    for (i=2; i < args.length-1; i+=2) if ((img = MM_findObj(args[i])) != null) {
      if (!img.MM_up) img.MM_up = img.src;
      img.src = img.MM_dn = (args[i+1])? args[i+1] : img.MM_up;
      nbArr[nbArr.length] = img;
  } }
}
//-->
</script>
</HEAD>
<BODY BGCOLOR=#FFFFFF background="images/back-body.jpg" LEFTMARGIN=0 TOPMARGIN=0 rightmargin="0" bottommargin="0" MARGINWIDTH=0 MARGINHEIGHT=0 style="overflow:hidden-x" onLoad="MM_preloadImages('images/HomeDown.png','images/HomeOver.png','images/AboutDown.png','images/AboutOver.png','images/ContactDown.png','images/ContactOver.png','images/FaqDown.png','images/FaqOver.png','images/MembersDown.png','images/MembersOver.png')">
<center>
<table width="783" height="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
    <td width="9" height="100%" background="images/back-left.jpg"><img src="images/spacer.gif" width="9" height="1"></td>
	
	
    <td width="765" height="100%" valign="top" background="images/back-end.jpg">
		<table width="100%" height="100%"  border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td colspan="2" WIDTH=765 height="102"><table border="0" cellpadding="0" cellspacing="0">
			  <tr>
			    <td><a href="index.jsp" target="_top" onClick="MM_nbGroup('down','group1','Home','images/HomeDown.png',1)" onMouseOver="MM_nbGroup('over','Home','images/HomeOver.png','',1)" onMouseOut="MM_nbGroup('out')"><img src="images/HomeUp.png" alt="" name="Home" width="155" height="76" border="0" onload=""></a></td>
                <td><a href="about.html" target="_top" onClick="MM_nbGroup('down','group1','About','images/AboutDown.png',1)" onMouseOver="MM_nbGroup('over','About','images/AboutOver.png','',1)" onMouseOut="MM_nbGroup('out')"><img src="images/AboutUp.png" alt="" name="About" width="155" height="76" border="0" onload=""></a></td>
                <td><a href="contact.html" target="_top" onClick="MM_nbGroup('down','group1','Contact','images/ContactDown.png',1)" onMouseOver="MM_nbGroup('over','Contact','images/ContactOver.png','',1)" onMouseOut="MM_nbGroup('out')"><img src="images/ContactUp.png" alt="" name="Contact" width="155" height="76" border="0" onLoad=""></a></td>
                <td><a href="faq.html" target="_top" onClick="MM_nbGroup('down','group1','Faq','images/FaqDown.png',1)" onMouseOver="MM_nbGroup('over','Faq','images/FaqOver.png','',1)" onMouseOut="MM_nbGroup('out')"><img src="images/FaqUp.png" alt="" name="Faq" width="155" height="76" border="0" onLoad=""></a></td>
                <td><a href="index2.jsp" target="_top" onClick="MM_nbGroup('down','group1','Members','images/MembersDown.png',1)" onMouseOver="MM_nbGroup('over','Members','images/MembersOver.png','',1)" onMouseOut="MM_nbGroup('out')"><img src="images/MembersUp.png" alt="" name="Members" width="155" height="76" border="0" onLoad=""></a></td>
			  </tr>
		    </table></td>
		</tr>
		<tr>
			<td width="210" height="10" valign="top">
				<table width="210" height="100%" border="0" cellspacing="0" cellpadding="0">
				<tr><td><img src="images/up-1.jpg" width="210" height="60"></td></tr>
				<tr>
					<td width="210" height="10" background="images/back-up-1.jpg">
						<img src="images/resizedtestiscope.jpg" width="105" height="113" align="left" style="margin-right:0px">
					  <img src="images/text-1.jpg" width="99" height="15"><br>
						Easy access to you medical records 
						<div style=" padding-top:5px"><img src="images/text-1.jpg" width="99" height="15"><br>
						  <font face="tahoma" style="font-size:10px;color:#777777;line-height:11px"> 
							<div style=" padding-top:10px"><a href="#" style="color:#FF0600;text-decoration:none"><strong>learn more</strong></a> <img src="images/but-red.jpg" width="15" height="7" align="middle"></div>
						  </font>
						</div>
				  </td>
				</tr>
				<tr><td><img src="images/but-1.jpg" width="210" height="42"></td></tr>
				<tr>
					<td width="210" height="10" bgcolor="#64A5CF">
						<jsp:useBean id="msg" class="java.lang.String" scope="request"/>
						<% if (msg!=null) {%>
							<br/><%= msg %>
						<% } %>
						<form method="POST" action='Session' name="edit" id="">

						<table width="100%" height="100%"  border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td valign="top" align="right" style="padding-left:10px;padding-right:8px;padding-top:13px">
								<font face="tahoma" style="font-size:11px;color:#FFFFFF">
								<strong>Login:</strong> 
								</font>
								
								<div style="padding-top:14px;">
									<font face="tahoma" style="font-size:11px;color:#FFFFFF"> 
									<strong>Password:</strong> 
									</font>
								</div>
								
							</td>
							<td valign="top" style="padding-top:10px;padding-bottom:11px">
								<input name="uname" type="text" style="width:93px;height:17px;font-size:11px;margin-bottom:8px"/><br>
								<input name="pwd" type="password" style="width:93px;height:17px;font-size:11px"/>
							</td>

						</tr>
						<tr>
							<td colspan="2" align="center"> 
								<input type="submit" value="Log In"/>
							</td>
						</tr> 
						<tr><td colspan="2" style="padding-left:23px;padding-bottom:5px"><font face="tahoma" style="font-size:11px;color:#FFFFFF"><a href="#" style="color:#FFFFFF">Forgot password</a><img src="images/spacer.gif" width="28" height="1"><a href="#" style="color:#FFFFFF">Register</a></font></td></tr>
						</table>
							<div style="font-size:10px; font-family:tahoma;padding-left:15px;">
								Logins (Username/Password/Role):<br>
								jsmith / password / Patient <br>
								bgates / microsoft / Patient <br>
								drkumar / health / Doctor <br>
								medicaid / bones/ Insurance Provider <br>
							</div>
						</form>
					</td>
				</tr>
				<tr><td><img src="images/but-2.jpg" width="210" height="38"></td></tr>
				<tr>
					<td width="210" height="100%" valign="top" background="images/back-but-2.jpg" style="padding-left:28px;padding-top:4px;padding-bottom:15px">
						<img src="images/text-2.jpg" width="92" height="17"><br>
						<div style=" line-height:15px;padding-bottom:10px">
						  <p>Team One<br>
						  University Heights<br>
					    Newark, NJ 07102</p>
						  <p>1800-555-5555</p>
						</div>
					  <img src="images/text-2.jpg" width="92" height="17"><br>
						<div style=" line-height:14px"></div>
					</td>
				</tr>
				<tr>
				  <td height="100%" valign="top" background="images/back-but-2.jpg" style="padding-left:28px;padding-top:4px;padding-bottom:15px">&nbsp;</td>
				  </tr>				
				</table>
			</td>
			
			
			
			<td width="555" height="10" valign="top">
				<table width="555" height="100%"  border="0" cellspacing="0" cellpadding="0" background="images/back-up-3.jpg">
				<tr>
					<td width="555" height="10" background="images/up-3.jpg" style="background-repeat:no-repeat;background-position:top">
						<table width="100%" height="10"  border="0" cellspacing="0" cellpadding="0" background="images/end-3.jpg" style="background-repeat:no-repeat;background-position:bottom">
						<tr><td colspan="5" style="padding-left:110px;padding-bottom:8px" valign="top"><img src="images/but-10.jpg" width="248" height="38"></td></tr>
						<tr>
							<td width="149" height="100%" valign="top"><img src="images/pic-10.jpg" width="149" height="156"></td>
							<td width="41" height="100%" style="padding-left:3px" valign="top"><img src="images/pic-11.jpg" width="44" height="38"></td>
							<td width="145" valign="top" style="padding-left:5px"><img src="images/1-pic-10.jpg" width="127" height="159"><br></td>														
							<td width="115" valign="top" style="padding-top:5px ">
								<font face="tahoma" style="font-size:10px;color:#828688"><strong>	
								<img src="images/but.jpg" width="4" height="7"></strong></font>	
		              <img src="images/medical-symbol-chromeresized.jpg" width="99" height="142"></td>							
							<td valign="top" width="99" height="100%" style="padding-top:14px "><img src="images/pic-12.jpg" width="99" height="142"></td>
						</tr>
						</table>
					</td>
				</tr>
				<td width="555" height="33" align="left" background="images/back-tab.jpg">
					<table width="554" height="33"  border="0" cellspacing="0" cellpadding="0"><tr><td width="553" height="33" background="images/back-but-4.jpg">	<img src="images/but-4.jpg" width="157" height="33"><img src="images/spacer.gif" width="108" height="1"><img src="images/but-5.jpg" width="139" height="33"></td></tr></table></td>
				</tr>
				<tr>
					<td width="555" height="100%" background="images/back-tab.jpg">
						<table width="555" height="100%"  border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="281" height="10" valign="top" style="padding-left:9px;padding-bottom:15px">
								<img src="images/text-18.jpg" width="99" height="18"><br>
								<img src="images/pic-3.jpg" width="132" height="52" align="left" style="margin-right:10px">
								<font face="tahoma" style="font-size:10px;color:#828688">
									<strong style="color:#FF3300">Doctors</strong><br>
									Quick access to medical records allow for faster patient processing
									<div style=" padding-top:4px"><a href="#" style="color:#0CA4FF;text-decoration:none"><strong>learn more</strong></a> <img src="images/but-blue.jpg" width="15" height="7"></div>
							  </font>
								<div style=" padding-top:19px"><img src="images/pic-4.jpg" width="132" height="52" align="left" style="margin-right:10px"><font face="tahoma" style="font-size:10px;color:#828688">
					<strong style="color:#FF3300">Hospitals</strong><br>
					The guessing of treating patients is eliminated.
										<div style=" padding-top:4px"><a href="#" style="color:#0CA4FF;text-decoration:none"><strong>learn more</strong></a> <img src="images/but-blue.jpg" width="15" height="7"></div>
									</font>
							  </div>
							</td>
														
							<td width="2" height="10" background="images/back-line-up-1.jpg">
								<table width="2" height="100%"  border="0" cellspacing="0" cellpadding="0">
									<tr><td><img src="images/line-up-1.jpg" width="2" height="50"></td></tr>
									<tr><td height="100%"><img src="images/spacer.gif" width="2" height="1"></td></tr>
									<tr><td><img src="images/end-line-up-1.jpg" width="2" height="47"></td></tr>
								</table>
							</td>
														
							<td width="272" height="10" valign="top" style="padding-top:4px;padding-left:10px">
								<img src="images/line-up.jpg" width="2" height="38" style="margin-top:2px;margin-right:10px" align="left">
								<a href="#"><img src="images/pic-1.jpg" width="22" height="41" border="0" align="right" style="margin-top:2px;margin-right:10px "></a>
								<img src="images/text-15.jpg" width="215" height="13"><br>
								<font face="tahoma" style="font-size:10px;color:#585858">
									New Feeds Coming Soon<br><br>
								</font>
								<div style="">
									<img src="images/line-up.jpg" width="2" height="38" style="margin-top:2px;margin-right:10px" align="left">
									<a href="#"><img src="images/pic-1.jpg" width="22" height="41" border="0" align="right" style="margin-top:2px;margin-right:10px "></a>
									<img src="images/text-15.jpg" width="215" height="13"><br>
									<font face="tahoma" style="font-size:10px;color:#585858">
										News Feeds Coming Soon<br><br>
							  </font>							  </div>
								<div style="">
									<img src="images/line-up.jpg" width="2" height="38" style="margin-top:2px;margin-right:10px" align="left">
									<a href="#"><img src="images/pic-1.jpg" width="22" height="41" border="0" align="right" style="margin-top:2px;margin-right:10px "></a>
									<img src="images/text-15.jpg" width="215" height="13"><br>
									<font face="tahoma" style="font-size:10px;color:#585858">
										News Feeds Coming Soon<br><br>
						  </font>						  </div>						  </td>
						</tr>
						
						<tr><td colspan="3" bgcolor="#B2B2B2"><img src="images/spacer.gif" width="1" height="1"></td></tr>
						
						<tr>
							<td width="281" height="100%" valign="top" style="padding-left:9px;padding-bottom:10px;padding-top:10px">
								<img src="images/text-3.jpg" width="196" height="15"><br>
								<img src="images/pic-5.jpg" width="123" height="71" align="left" style="margin-right:10px">
								
									<div style=" padding-bottom:10px"><font face="tahoma" style="font-size:10px;color:#828688;line-height:11px"><strong>Better lab optimization</strong></font></div>
									<font face="tahoma" style="font-size:10px;color:#828688;line-height:11px">Labs could have instant access to patient history data from hospitals.  This leads to faster processing of specimen.
									<div style=" padding-top:4px"></div>
							  </font>								
							</td>
														
							<td width="2" height="100%" background="images/back-line-up-1.jpg">
								<table width="2" height="100%"  border="0" cellspacing="0" cellpadding="0">
									<tr><td><img src="images/line-up-1.jpg" width="2" height="50"></td></tr>
									<tr><td height="100%"><img src="images/spacer.gif" width="2" height="1"></td></tr>
									<tr><td><img src="images/end-line-up-1.jpg" width="2" height="47"></td></tr>
								</table>
							</td>
														
							<td width="272" height="100%" valign="top" style="padding-top:4px;padding-left:10px">
								<img src="images/text-4.jpg" width="80" height="19" style="margin-bottom:5px;margin-top:5px"><br>
								<img src="images/pic-6.jpg" width="96" height="61" align="left" style="margin-right:10px">
								
									<div style=" padding-bottom:5px"><font face="tahoma" style="font-size:10px;color:#585858;line-height:11px"><strong>12/1/2010</strong></font></div>
									 
									<div style=""><font face="tahoma" style="font-size:10px;color:#585858;line-height:11px"><strong style="color:#FF3300">Site Is up and running</strong></font></div><font face="tahoma" style="font-size:10px;color:#585858;line-height:11px">									
									<div style=" padding-top:5px">Please check back for more site updates.. <a href="#" style="color:#FF0600;text-decoration:none"><strong>more</strong></a> <img src="images/but-red-2.jpg" width="15" height="7"></div>
								</font>									
							</td>
						</tr>
						</table>
					</td>
				</tr>								
				</table>
			</td>
		</tr>
		<tr>
			<td width="765" height="79" colspan="2" background="images/end.jpg" style="background-repeat:no-repeat;background-position:top;padding-top:18px" align="center" valign="top">
				<font face="tahoma" style="font-size:10px;color:#FFFFFF"><strong>
					<a href="index.html" style="color:#FFFFFF;text-decoration:none">HOME</a>   &nbsp;&nbsp;::&nbsp;&nbsp;ABOUT&nbsp;&nbsp;::&nbsp;&nbsp;   
					<a href="index-2.html" style="color:#FFFFFF;text-decoration:none">SUPPORT</a>     &nbsp;&nbsp;::&nbsp;&nbsp;FAQ&nbsp;&nbsp;::&nbsp;&nbsp;
					<a href="index-4.html" style="color:#FFFFFF;text-decoration:none">CONTACTS</a>     &nbsp;&nbsp;::&nbsp;&nbsp;MEMBERS</strong>
                <div style=" padding-top:24px;color:#858484">Copyright &copy; 2010 Medi Records Inc.</div></font>
				
			</td>
		</tr>
		<tr><td colspan="2" height="100%"><img src="images/spacer.gif" width="1" height="1"></td></tr>
		</table>
	</td>
	
	
	
    <td width="9" height="100%" background="images/back-right.jpg"><img src="images/spacer.gif" width="9" height="1"></td>
</tr>
</table>
</center>
</BODY>
</HTML>