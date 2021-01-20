<!doctype html>

<html lang="en-US">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>BizAcumen Research Pvt.,Ltd</title>
		<meta name="description" content="BizAcumen Research Pvt., Ltd"/>
		<meta name="keywords" content="BizAcumen, Market Research, Research Trends" />
		     
	<script>
function initMap() {
   var uluru = {lat:17.409045, lng:78.449879};

  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 16,
    center: uluru
  });

  var contentString = '<p style="color: black;font-size:x-small;"><b>BizAcumen Research Pvt. Ltd.,</b><br>8-2-672, Technovation, Floors 1<sup>st</sup>, 2<sup>nd</sup> & 3<sup>rd</sup><br> Road No.13, Banjara Hills <br> Hyderabad-500034<br>Telephone: 40-23332999 <p>';
      

  var infowindow = new google.maps.InfoWindow({
    content: contentString
  });

  var marker = new google.maps.Marker({
    position: uluru,
    map: map,
    title: 'BizAcumen Address'
  });

  marker.addListener('click', function() {
    infowindow.open(map, marker);
  });
}

function RefreshImage(valImageId) {
	var objImage = document.images[valImageId];
	if (objImage == undefined) {
		return;
	}
	var now = new Date();
	objImage.src = objImage.src.split('?')[0] + '?x=' + now.toUTCString();
}
    </script>
<!--Opp: Oyster Swimming Pool, removed on 13Jun18-->
    <script async defer
        src="https://maps.googleapis.com/maps/api/js?callback=initMap"></script>  
	</head>
<%
function TestCaptcha(byval valSession, byval valCaptcha)
	dim tmpSession
	valSession = Trim(valSession)
	valCaptcha = Trim(valCaptcha)
	if (valSession = vbNullString) or (valCaptcha = vbNullString) then
		TestCaptcha = false
	else
		tmpSession = valSession
		valSession = Trim(Session(valSession))
		Session(tmpSession) = vbNullString
		if valSession = vbNullString then
			TestCaptcha = false
		else
			valCaptcha = Replace(valCaptcha,"i","I")
			if StrComp(valSession,valCaptcha,1) = 0 then
				TestCaptcha = true
			else
				TestCaptcha = false
			end if
		end if		
	end if
end function


		Sub SendGodaddyMail(fromwho,towho,subject,body)

			response.write fromwho
			response.end

			sendUrl="http://schemas.microsoft.com/cdo/configuration/sendusing"
			smtpUrl="http://schemas.microsoft.com/cdo/configuration/smtpserver"
		
			''''Set the mail server configuration
			Set objConfig=CreateObject("CDO.Configuration")
			objConfig.Fields.Item(sendUrl)=2 ''' cdoSendUsingPort
			objConfig.Fields.Item(smtpUrl)="relay-hosting.secureserver.net"
			objConfig.Fields.Update
			
		 
			''''Create and send the mail
			Set objMail=CreateObject("CDO.Message")
		
		 
			''''Use the config object created above
			Set objMail.Configuration=objConfig
			objMail.From=fromwho      	'' "sender@coolexample.com"
			''objMail.ReplyTo="sender@coolexample.com"
			objMail.To= towho 		''"recipient@coolexample.com"
			objMail.Subject= subject   	''"subject"
			objMail.HTMLBody=body & "<br><br>" & ""		''"body"
		
			objMail.Send
		
		End Sub  %>
 
    <body data-spy="scroll" data-target="#main-navbar">
    
        <!--div class="page-loader"></div-->  <!-- Display loading image while page loads -->
        
    	<div class="body">
        
        
           <!----- BEGIN Header  ------>     
			<!--#include file="ASPIncludes/sendemail.asp"-->	     
              <!--#include file="ASPIncludes/TopStrip.asp"-->	
            <!----- END Header ------>
                
              <!--========== Begining of Contact ==========-->
			<section id="contact-section" class="page text-white parallax" data-stellar-background-ratio="0.5" style="background-image: url(img/map-bg.jpg);">
            <div class="cover"></div>
            
                 <!-- Begin page header-->
                <div class="page-header-wrapper">
                    <div class="container">
                        <div class="page-header text-center wow fadeInUp" data-wow-delay="0.4s">
                            <h2>Contact Us</h2>
                            <div class="devider"></div>
                           
                        </div>
                    </div>
                </div>
                <!-- End page header-->
               
                <div class="contact wow bounceInRight" data-wow-delay="0.4s">
                    <div class="container">
                    	<div class="row">
                         <%
								if trim(request("BtnSubmit"))="Send" then	
								  if TestCaptcha("ASPCAPTCHA", Request("captchacode")) Then
									CHKSYSIPAddress = Request.ServerVariables("HTTP_X_FORWARDED_FOR")
									if CHKSYSIPAddress = "" then
										CHKSYSIPAddress = Request.ServerVariables("REMOTE_ADDR")
									end if
												
									sendUrl="http://schemas.microsoft.com/cdo/configuration/sendusing"
									smtpUrl="http://schemas.microsoft.com/cdo/configuration/smtpserver"
									
									
									' Set the mail server configuration
									Set objConfig=CreateObject("CDO.Configuration")
									objConfig.Fields.Item(sendUrl)=2 ' cdoSendUsingPort
									objConfig.Fields.Item(smtpUrl)="relay-hosting.secureserver.net"
									objConfig.Fields.Update
									
									
									' Create and send the mail
									Set objMail=CreateObject("CDO.Message")
									' Use the config object created above
									Set objMail.Configuration=objConfig
									objMail.From=trim(request("Yemail")) ''"chv@gmail.com"
									objMail.ReplyTo="contact@Bizacumen.com"
									objMail.To="contact@Bizacumen.com"
									objMail.BCC="chv@Bizacumen.com"
									objMail.Subject=trim(request("Ysubject")) ''"to testing subject"
									objMail.HTMLBody="Dear Sir/Madam,<br><br>" & trim(request("Ymessage")) & "<br><br>Thanks & Regards,<br>" &trim(request("YName"))& "<br><br><br> Sender IP: " & CHKSYSIPAddress
									objMail.Send


									''SendGodaddyMail(trim(request("Yemail")),"chv@bizacumen.com",trim(request("Ysubject")),trim(request("Ymessage")))
									response.write "Thanks for your message!"
								 else
									Response.Write("<b style=""color:#FF0000"">You have entered the wrong characters in the code.</b>")
								  end if
								end if
									%>
                            <div class="col-sm-6">
                                <div class="contact-info">
                                    <h4>Our Address</h4>
                                    <ul class="contact-address">
			                            <!--li><h5> BizAcumen Research Pvt., Ltd</h5>
                                         4th Floor, Laxmi Cyber Center <br/>
										 Road No. 12, Banjara Hills<br/>
										 Hyderabad-500034, Telangana State <br/>
									     INDIA</li-->
										<li><h5> BizAcumen Research Pvt., Ltd</h5>
                                         8-2-672, Technovation, Floors 1<sup>st</sup>, 2<sup>nd</sup> & 3<sup>rd</sup><br>
										<!-- Opp: Oyster Swimming Pool, <br>-->
										 Road No.13, Banjara Hills<Br> Hyderabad-500034 <br/>
									     Telangana State, INDIA</li>
			                            <li><i class="fa fa-phone"></i>&nbsp;91-40-23332999</li>
			                            <!--li><i class="fa fa-print"></i>&nbsp;91-40-23398231</li-->
										<li><i class="fa fa-envelope"></i>  contact@Bizacumen.com</li>
										 <li><div id="map" class="col-sm-12 col-xs-12" style="height:250px;"></div></li>
			                           			                        </ul>
                                </div>
                            </div>
                        	<script type="text/javascript">
							    $(function () {
										var data="";
							        if (window.opener != null && !window.opener.closed) {
							            var parent = $(window.opener.document).contents();
							             data = parent.find("#txtName").val(); //"<u>Values using Popup Window</u><br /><br />";
							          // data += "<b>Name:</b> " + parent.find("#txtName").val() + " <b>Technology:</b> " + parent.find("#ddlTechnolgy").val();
									//	 data += parent.find("#txtName").val();
										 // alert(data==null);
										if (data!=null){
										     document.frmcontact.Ysubject.value=data;
							            	$("#Ysubject").html(data);
										}else
										{  document.frmcontact.Ysubject.value="";
							            	$("#Ysubject").html("");}
							        }
							    });
							</script>
                        	<div class="col-sm-6">
                                <div class="contact-form">
                                	<h4>Write to us</h4>
								
                                    <form role="form" name="frmcontact">
                                        <div class="form-group">
                                            <input type="text" name="YName" class="form-control input-lg" placeholder="Your Name" required>
                                        </div>
                                        <div class="form-group">
                                            <input type="email" name="Yemail" class="form-control input-lg" placeholder="E-mail" required>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" name="Ysubject" class="form-control input-lg" placeholder="Subject" required>
                                        </div>
                                        <div class="form-group">
                                            <textarea  name="Ymessage" class="form-control input-lg" rows="5" placeholder="Message" required></textarea>
                                        </div>
										<div class="form-group">
                                            <input type="text" name="captchacode"  class="form-control input-lg" id="captchacode" size="10" required placeholder="Type Characters in the Image" style="width:50% !important;float:left"/>&nbsp;<img id="imgCaptcha" src="captcha.asp" style="float:left !important;width:150px !important;margin:10px;"/><a href="javascript:void(0)" onclick="RefreshImage('imgCaptcha')" style="float:left;color:white;margin-top:20px;">Change Image</a>
											
                                        </div>
										<br><br><input class="btn wow bounceInRight btn-default" data-wow-delay="0.8s" type="submit" value="Send" name="BtnSubmit" >
                                        <!--button type="submit"  name="submit" class="btn wow bounceInRight" data-wow-delay="0.8s">Send</button-->
                                    </form>
                                </div>	
                            </div>
                                                                                
                        </div> <!-- /.row -->
                    </div> <!-- /.container -->
                </div>
            </section>
        	 <!--========== End of Contact ==========-->
                
                

                
            <!-- BEGIN footer -->
                 <!--#include file="ASPIncludes/BottomStrip.asp"-->	
            <!-- END footer -->

            <a href="#" class="scrolltotop"><i class="fa fa-arrow-up"></i></a> <!-- Scroll to top button -->
                                              
        </div><!-- body ends -->
        
    </body> 
           
</html>
