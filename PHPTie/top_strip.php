			<div class="container bg_white">
    <div class="header">
      <div class="row"> <!---logo & address starts---->
        <div class="col-lg-11 out_line">
         <!-- <button class="top_nav" id="top_nav"> <i class="fa fa-bars"></i> </button>-->
          
          <!---- Address block-----><!------logo block------>
          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12  pull-left">
            <div class="row">
              <div class="col-lg-2 col-md-2 col-sm-3 col-xs-12 "> <img src="img/tie_logo.png" title="tie50" class="logo"/> </div>
              <div class="col-lg-10 col-md-10 col-sm-9 col-xs-12 main_title_block">
                <h2 class="text_red title text-center"><strong>DATA CONTROL INTERFACE</strong></h2>
              <!-- <%if Trim(session("AdmVertical"))<>"" then%> <h5 class="sub_title text-center">TRACK: <%=Trim(UCase(session("AdmVertical")))%></h5><%End if%>-->
				<?php if (trim($_SESSION['SESS_FIRST_NAME']) !== "")
					{ ?>
						<h5 class="sub_title text-center">USER: <?php echo(Trim($_SESSION['SESS_FIRST_NAME']))?></h5>
				<?php	} ?>

              </div>
               
              	 
              
            </div>
          </div>
        </div>
      </div>
      <!---logo & address ends----> 
      
      <div class="row"> <!---nav starts---->
        <nav class="navbar navbar-default">
          <div class="col-lg-11 out_line">
            <div class="container-fluid"> 
              <!-- Brand and toggle get grouped for better mobile display -->
              <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
              </div>
              
              <!-- Collect the nav links, forms, and other content for toggling -->
              <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav  nav-justified">
				 <?php if (trim($_SESSION['SESS_FIRST_NAME']) !== "")
					{ ?>
                  <li><a id="a_Home" href="Welcome.php"><b>HOME</b></a></li>
						<!--li><a id="a_Register" href="Adduser.asp">ADMIN LIST</a></li>
						<li><a id="a_Register" href="Curation_Screening_CA.asp">TO BE CURATE - CA</a></li-->
						<li><a id="a_Register" href="pitchbookSearch.php">SEARCH</a></li>
						<li><a id="a_Register" href="basic.php">DOWNLOAD</a></li>	
						<!--li><a id="a_Register" href="Team_Curation_Screening.asp">TEAM CURATED</a></li-->
						<!--li><a id="a_Register" href="ViewTiE50guidelines_2015.asp">GUIDELINES</a></li-->
						<li><a id="a_ContactUs" href="index.php" >      LOGOUT       </a></li>
				 <?php } ?> 
                </ul>
              </div>
              <!-- /.navbar-collapse --> 
            </div>
            <!-- /.container-fluid --> 
          </div>
        </nav>
      </div>
      <!---nav Ends----> 
      
    </div>
  </div>