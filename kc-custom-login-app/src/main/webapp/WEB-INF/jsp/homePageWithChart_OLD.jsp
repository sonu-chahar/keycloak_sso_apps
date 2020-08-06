<!DOCTYPE html>
<html>
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>   
  <meta charset="utf-8">
  <title>NDMC</title>
  <link rel="shortcut icon" href="favicon.ico">
  <meta name="keywords" content="" />
  <meta name="description" content="">
  <meta name="author" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">


<!-- jQuery -->
  <script src="<%=request.getContextPath()%>/resources/chartTheme/js/jquery-1.11.1.js"></script>
  <script src="<%=request.getContextPath()%>/resources/chartTheme/js/jquery-ui.min.js"></script>
<%-- <script src="<%=request.getContextPath()%>/resources/chartTheme/js/jquery-3.3.1.js"></script>
<script src="<%=request.getContextPath()%>/resources/chartTheme/js/jquery.min.js"></script> --%>
<script src="<%=request.getContextPath()%>/resources/chartTheme/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/chartTheme/js/fusioncharts.js"></script> 
<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/resources/chartTheme/js/barr.js"></script> --%>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/chartTheme/js/highcharts.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/chartTheme/js/drilldown.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/chartTheme/js/themes/fusioncharts.theme.fint.js"></script>

  <!-- Theme Javascript -->
  <script src="<%=request.getContextPath()%>/resources/chartTheme/js/utility.js"></script>
  <script src="<%=request.getContextPath()%>/resources/chartTheme/js/demo.js"></script>
  <script src="<%=request.getContextPath()%>/resources/chartTheme/js/main.js"></script>
<script src="<%=request.getContextPath()%>/resources/chartTheme/js/amcharts.js"></script>
<script src="<%=request.getContextPath()%>/resources/chartTheme/js/pie.js"></script>
<script src="<%=request.getContextPath()%>/resources/chartTheme/js/light.js"></script>
<script src="<%=request.getContextPath()%>/resources/chartTheme/js/serial.js"></script>
  <script src="<%=request.getContextPath()%>/resources/chartTheme/js/dark.js"></script>
    <%-- <script src="<%=request.getContextPath()%>/resources/chartTheme/js/highcharts.js"></script> --%>
<script src="<%=request.getContextPath()%>/resources/chartTheme/js/highcharts-3d.js"></script> 
  
  <script src="<%=request.getContextPath()%>/resources/chartTheme/js/data.js"></script>
  <script src="<%=request.getContextPath()%>/resources/chartTheme/js/drilldown.js"></script> 
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/chartTheme/css-new/jquery.dataTables.min.css">
<script src="<%=request.getContextPath()%>/resources/chartTheme/js/jquery.dataTables.min.js"></script>


<!---pdf-->

<script src="<%=request.getContextPath()%>/resources/chartTheme/js/jspdf.debug.js"></script>

<link href="<%=request.getContextPath()%>/resources/chartTheme/css_nn/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<link href="<%=request.getContextPath()%>/resources/chartTheme/css_nn/style.css" rel="stylesheet" type="text/css" media="all"/>
 <!---njdg-->
 <link href="<%=request.getContextPath()%>/resources/chartTheme/css/style.css" rel="stylesheet">
 <link href="<%=request.getContextPath()%>/resources/chartTheme/css/bootstrap.min.css" rel="stylesheet">
 <link href="<%=request.getContextPath()%>/resources/chartTheme/css/font-awesome.min.css" rel="stylesheet" type="text/css">
 <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/chartTheme/css/dashboard-style.css" >
 <!---sclsc-->
<link href="<%=request.getContextPath()%>/resources/chartTheme/css-new/pgallery.css" rel="stylesheet">
<%-- <link href="<%=request.getContextPath()%>/resources/chartTheme/css-new/style.html" rel="stylesheet"> --%>

</head>


<body class="dashboard-page sb-l-o sb-r-c">

  <div id="main">

   
<!--<div class="container-fluid head" style="height: 40px;background-color: #f6bb42;">-->
  <div class="container no-padding">
    <div class="row wow fadeInDown animated animated" data-wow-duration="2s">

    </div>
  </div>
</div>


<header style="box-shadow: 0 10px 28px 0 rgba(0,0,0,0.2), 0 10px 20px 0 rgba(0,0,0,0.19)">
    <img class="header_img" src="<%=request.getContextPath()%>/resources/chartTheme/SCDG_header.png" width="100%">

</header>

<center>
<div id="page-wrapper" style="background: -webkit-linear-gradient(-90deg, #f7b174,#88c181 100%);
    background-image: -webkit-linear-gradient(-90deg, rgb(247, 177, 116), rgb(136, 193, 129) 100%);
    background-position-x: initial;
    background-position-y: initial;
    background-size: initial;
    background-repeat-x: initial;
    background-repeat-y: initial;
    background-attachment: initial;
    background-origin: initial;
    background-clip: initial;
    background-color: initial;"> 
    <div class="row">
   
      <a href="#"><p style="margin-top: -66px;margin-left: 318px;font-weight: bold;font-size: 16px;color: #000000;"><sub data-toggle="modal" data-target="#myModal3"> Version 1.1</sub></p></a>
<div class="languageButton-header" style="margin-top: 0px; margin-right: 5px;">
          <span id="rbtnListLanguage" class="radio-list"><input id="rbtnListLanguage_0" type="radio" name="ctl00$rbtnListLanguage" value="en-US" checked="checked"><label for="rbtnListLanguage_0">English</label><input id="rbtnListLanguage_1" type="radio" name="ctl00$rbtnListLanguage" value="hi-IN" onclick="javascript:setTimeout('__doPostBack(\'ctl00$rbtnListLanguage$1\',\'\')', 0)"><label for="rbtnListLanguage_1">हिन्दी</label></span>
        </div>
    </div>

  <div class="row">
        <div class="col-md-12">
            <div class="card">
      
        <div class="btnn">
                    <a href="Javascript:void(0)" class="btn" data-toggle="modal" data-target="#myModal">Login</a>
                    <a href="Javascript:void(0)" class="btn" data-toggle="modal" data-target="#myModal1">Registration</a>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
    aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    ×</button>
                
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#Login" data-toggle="tab">Login</a></li>
                            
                        </ul>
                        <!-- Tab panes -->
                        <div class="tab-content" style="background: #ffffff; border: 1px;">
                            <div class="tab-pane active" id="Login">
                                <form role="form" class="form-horizontal">
                                <div class="form-group">
                                    <label for="email" class="col-sm-2 control-label">
                                        Email</label>
                                    <div class="col-sm-10">
                                        <input type="email" class="form-control" id="email1" placeholder="Email" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1" class="col-sm-2 control-label">
                                        Password</label>
                                    <div class="col-sm-10">
                                        <input type="email" class="form-control" id="exampleInputPassword1" placeholder="Password" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                      
                                <label class="checkbox">
                <input type="checkbox" value="remember-me"> Remember me
            </label>
                 </div>
                 <div class="col-md-6"></dir>
                <span class="pull-right">
                    <a data-toggle="modal" data-target="#myModal2" href="#" style="background: #ffffff; color: #000;"> Forgot Password?</a>

                </span>
            </div>

            </label>
                                   
                                    <div class="col-md-12">
                                        <button type="submit" class="btn btn-primary btn-md" style="padding: 0px 80px 0px 30px;">
                                            LogIn</button>
                                        
                                    </div>
                                </div>



                                </form>
                            </div>
                            
                        </div>
                     
                    </div>
                 
                </div>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
    aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    ×</button>
                
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs">
                       
                            <li class="active"><a href="#Registration" data-toggle="tab">Registration</a></li>
                        </ul>
                        <!-- Tab panes -->
                        
                            <div class="tab-pane" id="Registration">
                                <form role="form" class="form-horizontal">
                                <div class="form-group">
                                    <label for="email" class="col-sm-2 control-label">
                                        Name</label>
                                    <div class="col-sm-10">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <select class="form-control">
                                                    <option>Mr.</option>
                                                    <option>Ms.</option>
                                                    <option>Mrs.</option>
                                                </select>
                                            </div>
                                            <div class="col-md-9">
                                                <input type="text" class="form-control" placeholder="Full Name" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="email" class="col-sm-2 control-label">
                                        Email</label>
                                    <div class="col-sm-10">
                                        <input type="email" class="form-control" id="email" placeholder="Email" />
                                    </div>
                                </div>
                                  <div class="form-group">
                                    <label for="password" class="col-sm-2 control-label">
                                        Password</label>
                                    <div class="col-sm-10">
                                        <input type="password" class="form-control" id="password" placeholder="Password" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="password" class="col-sm-2 control-label">
                                        Confirm Password</label>
                                    <div class="col-sm-10">
                                        <input type="password" class="form-control" id="password" placeholder="Confirm Password" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2">
                                    </div>
                                    <div class="col-sm-10">
                                        <button type="button" class="btn btn-primary btn-sm" style="padding: 0px 80px 0px 30px;">
                                            Register</button>
                                        
                                    </div>
                                </div>
                                </form>
                            </div>


                        </div>
                     
                    </div>
                 
                </div>
            </div>
        </div>
    </div>

    <!-- forgot password -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
    aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    ×</button>
                
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs">
                       
                            <li class="active"><a href="#Registration" data-toggle="tab">Forgot Password</a></li>
                        </ul>
                        <!-- Tab panes -->
                        
                            <div class="tab-pane" id="Registration" style="padding: 31px 0;">
                                <form role="form" class="form-horizontal">
                                
                                <div class="form-group">
                                    <label for="email" class="col-sm-2 control-label" style="color: #1688bb; font-weight: bold;text-align: left;">
                                       Registered Email</label>
                                    <div class="col-sm-10">
                                        <input type="email" class="form-control" id="email" placeholder="" />
                                    </div>
                                </div>
                                  <div class="form-group">
                                    <label for="password" class="col-sm-2 control-label" style="color: #1688bb; font-weight: bold;text-align: left;">
                                        Registered Mobile No</label>
                                    <div class="col-sm-10">
                                        <input type="mobile" class="form-control" id="mobile" placeholder="" />
                                    </div>
                                </div>
                              
                                <div class="row">
                                    <div class="col-sm-2">
                                    </div>
                                    <div class="col-sm-10">
                                        <button type="button" class="btn btn-primary btn-sm" style="padding: 0px 100px 0px 30px;">
                                            Forgot Password</button>
                                        
                                    </div>
                                </div>
                                </form>
                            </div>
                        </div>
                     
                    </div>
                 
                </div>
            </div>
        </div>
    </div>
    <!-- forgot password -->


    <!-- version 1.1 -->
<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
    aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header" style="background: #005394;"> <small class="card-title" style="float: left;color: #ffffff;">Release Notes</small>
              
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    ×</button>
                
            </div>
            <div class="modal-body">
              <form class="example" action="/action_page.php" style="margin:auto;max-width:300px; padding: 0px; float: right;border: 0px;margin-bottom: 5px;margin-top: -11px;">
  <input type="text" placeholder="Search.." name="search2" style="padding: 3px;">
  <button type="submit"><i class="fa fa-search"></i></button>
</form>
              <table id="example" class="table table-striped table-bordered" style="width:100%">
        <thead>
            <tr>
                <th>S.No.</th>
                <th>Version</th>
                <th>Release Date</th>
                <th>Release Date</th>
               
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>1</td>
                <td>version 1.1</td>
                <td>15-06-2020  </td>
                <td>SJMS MIS application added.</td>
                
            </tr>
            <tr>
                <td>2</td>
               <td>version 1.1</td>
                <td>15-06-2020  </td>
                <td>SJMS MIS application added.</td>
               
            </tr>
            <tr>
                <td>3</td>
               <td>version 1.1</td>
                <td>15-06-2020</td>
                <td>SJMS MIS application added.</td>
               
            </tr>
            <tr>
                <td>4</td>
                <td>version 1.1</td>
                <td>15-06-2020  </td>
                <td>SJMS MIS application added.</td>
                
            </tr>
            <tr>
                <td>5</td>
                <td>Accountant</td>
                <td>15-06-2020  </td>
                <td>SJMS MIS application added.</td>
              
            </tr>
            <tr>
                <td>6</td>
                <td>version 1.1</td>
                <td>15-06-2020</td>
                <td>SJMS MIS application added.</td>
                
            </tr>
            <tr>
                <td>7</td>
                <td>version 1.1</td>
                <td>15-06-2020  </td>
                <td>SJMS MIS application added.</td>
               
            </tr>
            <tr>
                <td>8</td>
                <td>version 1.1</td>
                <td>15-06-2020  </td>
                <td>SJMS MIS application added.</td>
               
            </tr>
            <tr>
                <td>9</td>
                <td>version 1.1</td>
                <td>15-06-2020  </td>
                <td>SJMS MIS application added.</td>
               
            </tr>
            <tr>
                <td>10</td>
               <td>version 1.1</td>
                <td>15-06-2020  </td>
                <td>SJMS MIS application added.</td>
               
            </tr>
            <tr>
                <td>11</td>
                <td>version 1.1</td>
                <td>15-06-2020  </td>
                <td>SJMS MIS application added.</td>
               
            </tr>
            <tr>
                <td>12</td>
               <td>version 1.1</td>
                <td>15-06-2020  </td>
                <td>SJMS MIS application added.</td>
               
            </tr>
           
          
           
    
        </tbody>
        
    </table>
                 
                </div>
            </div>
        </div>
    </div>
    <!-- version 1.1 -->


    <!-- helpdesk -->
<div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
    aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header" style="background: #005394;"> <small class="card-title" style="float: left;color: #ffffff;">Helpdesk Details</small>
              
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    ×</button>
                
            </div>
            <div class="modal-body">
              <form class="example" action="">
  <!--Grid column-->
        <div class="col-md-12 text-center">
          <h3>NEW DELHI MUNICIPAL COUNCIL</h3>
            <ul class="list-unstyled mb-0">
                <li><i class="fa fa-map-marker-alt fa-2x"></i>
                    <p>(NDMC Head Office)<br>Palika Kendra
Parliament Street, New Delhi-110001</p>
                </li>

                <li><i class="fa fa-phone mt-4 fa-2x"></i>
                    <p>24/7 Helpline (Toll Free) : 1533</p>
                </li>

                <li><i class="fa fa-phone mt-4 fa-2x"></i>
                    <p>Exchange No. PABX : 41501354 - 60</p>
                </li>
            </ul>
        </div>
        <!--Grid column-->
        
</form>
              
                 
                </div>
            </div>
        </div>
    </div>
    <!-- helpdesk -->
</div>
                </div>
        </br>
        <center><h2 style="font-weight:800; font-size:23px; font-family: Montserrat, sans-serif;
    -webkit-font-smoothing: antialiased;
    text-rendering: optimizeLegibility;
    color: #000;margin-top: -30px;margin-left: 285px;">GRAPHICAL DASHBOARD</h2></center>
              </br>
        
         <div class="row">
          <div class="row wow fadeInDown" data-wow-duration="2s" id="mainCount">
                    <div class="col-lg-3 col-md-6 dataBoxHover">
                        <div class="panel orange">
                            <i class="fa  fa-android fa-4x"></i>
                            <div class="panel-heading">
                                <div class="row">
                                    <div  id="pendency" class="col-xs-9 text-left">
                                       <div><a href="javascript:void(0);" style="text-decoration: none;"><h3 id="total_pending1" data-tag="">104<span class="count_class counter"></span></h3></a></div>
                                        <div style="margin-top: -32px;margin-left: 50px;"><b>Integrated App</b></div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    
                    </div>
                    <div class="col-lg-3 col-md-6 dataBoxHover">
                        <div class="panel pink">
                            <i class="fa  fa-users fa-4x"></i>
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-9 text-left">
                                        <div><a href="javascript:void(0);" style="text-decoration: none;"><h3 id="pendingcomplience2">88<span class="count_class counter"></span></h3></a></div>
                                        <div style="margin-top: -32px;margin-left: 50px;"><b>Active User</b></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                       
                    </div>
                    <div class="col-lg-3 col-md-6 dataBoxHover">
                        <div class="panel tar">
                            <i class="fa  fa-user fa-4x"></i>
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-9 text-left">
                                        <div><a href="javascript:void(0);" style="text-decoration: none;"><h3 id="contemptcases3">77<span class="count_class counter"> </span></h3></a></div>
                                        <div style="margin-top: -32px;margin-left: 50px;"><b>Inactive User</b></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                      
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="panel yellow">
                            <i class="fa  fa-calendar fa-4x"></i>
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-9 text-left">
                                        <div><a href="javascript:void(0);" style="text-decoration: none;"><h3 id="#">66<span class="count_class counter"></span></h3></a></div>
                                        <div style="margin-top: -32px;margin-left: 50px;"><b>Sessions</b></div>
                                    </div>
                    <!--<div class="col-xs-3">
                                        <i class="fa  fa-calendar fa-4x"></i>
                                    </div>-->
                                </div>
                            </div>
                        </div>
                    </div>
          </div>
      
<div class="tab-content" style="border-radius:10px; margin:10px,20px,10px,20px !important;">

      <div role="tabpanel" class="tab-pane active" id="home">
       
<!-- <div class="action-tab" style="padding-left: 36px; text-align:center;">
                <div class="dropdown active">
                  <a href="javascript: void(0);" id="pending-home" data-tag="main-head">Pendency of Cases</a>
                 
                </div>


                <div class="dropdown">
                    <a href="javascript:void(0)" id="disposed_cases">Pending Vs Disposed Cases</a>
                </div>
        

              </div> -->
        </br><script 
src="<%=request.getContextPath()%>/resources/chartTheme/js/Chart.bundle.js"> 
</script> 
<!---STATE SECTION SUBJECT CATEGORY-->
<div class="container-fluid" id="pending-div" >
  <div class="col-md-12 wow slideInLeft graphWrapper" data-wow-duration="4s" style="min-height: auto">
    <div class="row popupHeader">
      <div class="col-md-6">
      <center>  <h2><span>Bar Chart Graphical Data</span></h2></center>
      </div>
        <div class="col-md-6">
        <center> <h2><span>Application Graphical Data</span></h2></center> 
      </div>
    </div>
      <div class="col-md-6">
        <div id="drill" class="requirement " style="border: 4px solid #7e7575; padding:4px 0px;background-size:cover; text-align: center; height: 350px;overflow-x: scroll;">
          <canvas id="myChart" width="544" height="312"></canvas> 
 </div> 

      </div>
      <div class="col-md-6">
        <div id="drill" class="requirement "style="border: 4px solid #7e7575; padding:4px 0px;background-size:cover; text-align: center; height: 350px;overflow-x: scroll;">
          <canvas id="myChart1"></canvas>



 </div> 

      </div>
    </div>
</div>

<!-- <div class="container-fluid" id="ministry-div">
  <div class="col-md-12 wow slideInLeft graphWrapper" data-wow-duration="4s">

    <div class="row popupHeader">
      <div class="col-md-12">
        <center> <h2><span>Application Graphical Data</span></h2></center> 
      </div>
    </div>

    <div id="cc1sssssss" style="border: 4px solid #7e7575; padding:8px 20px;background-size:cover; min-height: 413px; text-align: center; overflow-x: scroll;" ><img src="images/pie.jpg"></div>
  </div>
</div> -->

<!----------  Disposed of Cases Div Start------------>
<div class="container-fluid hide" id="disposed_cases_div">
    <div class="row">
      <div class="col-md-12 wow slideInLeft graphWrapper" data-wow-duration="4s" style="min-height: 600px; ">

        <div class="row popupHeader">
          <div class="col-md-12">
            <center><h2><span>Pending Vs Disposed Cases</span></h2></center>
          </div>
          <div class="col-md-6 text-right "style="width: 98%;">
            <span id="exportd" onclick="javascript:demoFromHTML2020(this);"><img src="<%=request.getContextPath()%>/resources/chartTheme/ic_pdf.png" ></span>
            <span id="btnExportd" onclick="javascript:demoFromHTML200();"><img src="<%=request.getContextPath()%>/resources/chartTheme/ic_excel.png" ></span>
          </div>
        </div>

        <center>
        <b>From</b>
          <select id="fmonth"><option value="01">Jan</option><option value="02">Feb</option><option value="03">Mar</option><option value="04">April</option><option value="05">May</option><option value="06">June</option><option value="07">July</option><option value="08">Aug</option><option value="09">Sep</option><option value="10">Oct</option><option value="11">Nov</option><option value="12">Dec</option></select>
                       <select id="fyear"><option value="2020">2020</option><option value="2019">2019</option><option value="2018">2018</option><option value="2017">2017</option><option value="2016">2016</option><option value="2015">2015</option><option value="2014">2014</option><option value="2013">2013</option><option value="2012">2012</option><option value="2011">2011</option></select>&nbsp;&nbsp;&nbsp;&nbsp;<b>To</b><select id="tmonth"><option value="01">Jan</option><option value="02">Feb</option><option value="03">Mar</option><option value="04">April</option><option value="05">May</option><option value="06">June</option><option value="07">July</option><option value="08">Aug</option><option value="09">Sep</option><option value="10">Oct</option><option value="11">Nov</option><option value="12">Dec</option></select>
                       <select id="tyear"><option value="2020">2020</option><option value="2019">2019</option><option value="2018">2018</option><option value="2017">2017</option><option value="2016">2016</option><option value="2015">2015</option><option value="2014">2014</option><option value="2013">2013</option><option value="2012">2012</option><option value="2011">2011</option></select>
        <a><input type="submit" value="Submit" name="sub" id="sub" style="background-color:#1d87bb;color:#fff;border: none;padding: 3px 10px;border-radius: 4px;"/> </a> 
        </center>  </br>    
        <div class="col-md-12" style="padding:0 3px 0 0;">
          <div id="fd" style="border: 4px solid #7e7575 ; background:#ffffff; text-align: center; padding: 8px 0px; min-height: 460px;overflow-x: scroll;">
          </div>
        </div>
      </div>
    </div>
</div>

<div class="container-fluid hide" id="departmentDiv">
  <div class="row wow slideInLeft graphWrapper" data-wow-duration="4s" style="padding: 10px 15px; margin-bottom: 20px;">
    <div class="col-md-12 popupHeader">
      <h2><span>Department Wise Statistics </span>[<font id="minsName"></font>]</h2>
    </div>
    <div class="col-md-12" id="departmentChart" style="border: 4px solid #7e7575; padding:8px 0px;background-size:cover; min-height: 520px; text-align: center;">Chart Loading........
    </div>
    <div class="col-md-8 table-responsive hide" id="deptCD-Div" style="border: 4px solid #7e7575; border-left: 0 none;  padding:8px 6px;background-size:cover; min-height: 520px; text-align: center;">
    </div>
  </div>
</div>

  <div id="zero" style="display:none;">
    <div id="idd"  style="display:block;background:#FFFFFF;height:0px">
      <div   id="t01">
        <h1><font color="red" >Pending Vs Disposal Data </font> </h1>
      </div>
      <div class="table-responsive" id="gfd" style="margin-top: -56px;"> 
        <table class="table">
        </table>
      </div>
    </div>
  </div>

<!----------  Disposed of Cases Div End------------>

<style>
#indicatorDiv {
    font-family:'Arial', 'Helvetica';
    font-size: 13px;
}
#format {
    height: 25px;
    font-size: 12px;
}
#export {
    height: 25px;
    font-size: 13px;
}
#export333 {
    height: 25px;
    font-size: 13px;
}
#indicatorDiv1 {
    font-family:'Arial', 'Helvetica';
    font-size: 13px;
}
#format1 {
    height: 25px;
    font-size: 12px;
}
#export1 {
    height: 25px;
    font-size: 13px;
}

#btnExport {
    float: right;
}
#exporti {
    height: 25px;
    font-size: 13px;
}

#btnExporti {
    float: right;
}
#btnExport1 {
    float: right;
}
#btnExport3 {
    float: right;
}
#btnExport4 {
    float: right;
}
#btnExport5 {
    float: right;
}
#btnExport6 {
    float: right;
}
#btnExport11 {
    float: right;
}
#btnExport333 {
    float: right;
}
</style>

 



  <div class="loading_progress">
    <div class="flipper"><img src="<%=request.getContextPath()%>/resources/chartTheme/sci_logo.png"></div>
  </div>


<div class="modal fade" id="minDetails" tabindex="-1" role="dialog" aria-labelledby="minModal" aria-hidden="true">
  <div class="modal-dialog" role="document" style="width: 92%;">
    <div class="modal-content" style="margin-top: 70px;">
      <div class="modal-header">
        <h5 class="modal-title" id="minModal">Loading...</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="table-responsive modal-body" id="minDetailsDiv">
        Loading.....
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>


<footer class="main-footer text-center" style="padding:0px;margin-left: 0px;color:#fff; background-color: #343A40;font-size: 12px;">
    
   © 2020 NDMC, [All Rights Reserved] Designed, Developed & Maintained by: Information Technology Dept. For any suggestions/queries, please contact with IT Department of NDMC.

   <p style="margin: 0">
           
              <a href="#"><span data-toggle="modal" data-target="#myModal4">Helpdesk Details</span></a>&nbsp;&nbsp;|&nbsp; 
                      <a href="WebsitePolicy.html"> <span>Website Policies</span></a>&nbsp;&nbsp;|&nbsp;
                      <a href="PasswordPolicy.html"> <span>Password Policy</span></a>&nbsp;&nbsp;|&nbsp;
                       <span>FAQ</span>&nbsp;&nbsp;|&nbsp;
                        <span>Sitemap</span>
          </p>
    
</footer>

</body>


</html>

<style>
@import "http://fonts.googleapis.com/css?family=Raleway";
/*----------------------------------------------
CSS settings for HTML div Exact Center
------------------------------------------------*/
#map {
  height: 400px;  /* The height is 400 pixels */
  width: 100%;  /* The width is the width of the web page */
 }
 
#abc {
width:100%;
height:100%;
top:0;
left:0;
display:none;
position:fixed;
background-color:rgba(0, 0, 0, 0.85);
overflow:auto
}

img#close {
    position: absolute;
    top: 15px;
    right: 15px;
    cursor: pointer;
}

div#popupContact {
  position: absolute;
  left: 0;
  right: 0;
  top: 50px;
  font-family: 'Raleway',sans-serif;
  max-width: 800px;
  width: 100%;
  margin: 0 auto;
}

form {
    padding: 10px 20px;
    border: 2px solid #0071bd;
    border-radius: 10px;
    font-family: raleway;
    background-color: #fff;
}

#submit {
text-decoration:none;
width:100%;
text-align:center;
display:block;
background-color:#FFBC00;
color:#fff;
border:1px solid #FFCB00;
padding:10px 0;
font-size:20px;
cursor:pointer;
border-radius:5px
}

button {
width:12%;
height:33px;
color:#5d5454;
font-size:12px;
cursor:pointer
}
.tableDataWrap {
    overflow: scroll;
    height: 500px;
    border: 1px solid #f1f1f1;
}
.table tr th {
  background-color: #ececec;
}

</style>

<style>
@import "http://fonts.googleapis.com/css?family=Montserrat:300,400,700";
.rwd-table {
  margin: 1em 0;
  min-width: 500px;
}
.rwd-table tr {
  border-top: 1px solid #ddd;
  border-bottom: 1px solid #ddd;
}
.rwd-table th {
  display: none;
}
.rwd-table td {
  display: block;
}
.rwd-table td:first-child {
  padding-top: .5em;
}
.rwd-table td:last-child {
  padding-bottom: .5em;
}
.rwd-table td:before {
  content: attr(data-th) ": ";
  font-weight: bold;
  width: 6.5em;
  display: inline-block;
}
@media (min-width: 480px) {
  .rwd-table td:before {
    display: none;
  }
}
.rwd-table th, .rwd-table td {
  text-align: left;
}
@media (min-width: 480px) {
  .rwd-table th, .rwd-table td {
    display: table-cell;
    padding: .25em .5em;
  }
  .rwd-table th:first-child, .rwd-table td:first-child {
    padding-left: 0;
  }
  .rwd-table th:last-child, .rwd-table td:last-child {
    padding-right: 0;
  }
}

body {
  font-family: Montserrat, sans-serif;
  -webkit-font-smoothing: antialiased;
  text-rendering: optimizeLegibility;
  color: #444;
  background: #eee;
}

h3 {
  font-weight: normal;
  letter-spacing: -1px;
}

.rwd-table {
  background: #34495E;
  color: #fff;
  border-radius: .4em;
  overflow: hidden;
}
.rwd-table tr {
  border-color: #46627f;
}
.rwd-table th, .rwd-table td {
  margin: .5em 1em;
}
@media (min-width: 480px) {
  .rwd-table th, .rwd-table td {
    padding: 1em !important;
  }
}
.rwd-table th, .rwd-table td:before {
  color: #dd5;
}

  </style>




  <style>
div.ex1 {
    height: 269px;
    overflow-y: scroll;
    border: 4px solid #7e7575;
    padding: 10px;
}

.table-row,.table-rowc,.table-rowi,.table-rowr,.table-rowrr,.table-rowrnr{
cursor:pointer;
}

.table-rowm{
cursor:pointer;
}
#myChart{margin-top: -30px!important;}
</style>

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/chartTheme/js/canvasjs.min.js">
  $(document).ready(function() {
    $('#example').DataTable();
} );
</script>

<script type="text/javascript">
         var ctx = document.getElementById("myChart1").getContext('2d');
var myChart = new Chart(ctx, {
  type: 'pie',
  data: {
    labels: ["Integrated App", "Active User", "Inactive User", "Sessions"],
    datasets: [{
      backgroundColor: [
                'rgba(255,0,0)', 
                'rgba(40,167,69,1)', 
                'rgba(23, 162, 184, 1)', 
                'rgba(255, 193, 7, 1)',
      ],
      data: [104, 88, 77, 66]
    }]
  }
});
       </script>

       <script type="text/javascript"> 
var ctx = new Chart(document.getElementById("myChart"), {

      type: "bar",
   data: {
     /*labels: ["Stock"],*/

      datasets: [{
         label: "Integrated App",
         backgroundColor: 'rgba(255,0,0)',
         borderColor: 'rgba(255,99,132,1)',
         borderWidth : 1 ,

         data: [104],
      },{
         label: "Active User",
         backgroundColor: 'rgba(40,167,69,1)',
         data: [88],
      },{
         label: "Inactive User",
         backgroundColor: 'rgba(23, 162, 184, 1)',
         data: [77],
      },{
         label: "Sessions",
         backgroundColor: 'rgba(255, 193, 7, 1)',
         data: [66],
      }]
   },
   options: {
          
          legend: { position: 'top'},
          title: { display: true,},

      }

              }); 
    </script>