<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayWide=false>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="${properties.kcHtmlClass!}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">
    
    <meta name="robots" content="noindex, nofollow">
     <script src="${url.resourcesPath}/js/jquery.min.js"></script>
    <script src="${url.resourcesPath}/js/bootstrap.min.js"></script>
    <script src="${url.resourcesPath}/js/showHidePassword.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
    <link rel='stylesheet prefetch' href='${url.resourcesPath}/css/bootstrap.min.css'>

    <#if properties.meta?has_content>
        <#list properties.meta?split(' ') as meta>
            <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
        </#list>
    </#if>
    <title>${msg("loginTitle",(realm.displayName!''))}</title>
    <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
        </#list>
    </#if>
    <#if scripts??>
        <#list scripts as script>
            <script src="${script}" type="text/javascript"></script>
        </#list>
    </#if>
</head>

<body class="${properties.kcBodyClass!}">
  <div class="${properties.kcLoginClass!}">
    <div id="kc-header" class="${properties.kcHeaderClass!}">
    <div class="logotext" style="color: #1e6238;">
            <h1 class="subHead1">NDMC Single Sign On
              <a onclick="javascript:ShowModelPopup('iframe','versions','Release Notes', 'modal-iframe');" title="Release Notes">
                
              </a>
            </h1>
            <hr>
            <h2 class="subHead2">One Digital Identity for all Applications</h2>
          </div>

      <div id="kc-header-wrapper" class="${properties.kcHeaderWrapperClass!}">${kcSanitize(msg("loginTitleHtml",(realm.displayNameHtml!'')))?no_esc}</div>
    </div>
    <div class="${properties.kcFormCardClass!} <#if displayWide>${properties.kcFormCardAccountClass!}</#if>">
      <header class="${properties.kcFormHeaderClass!}">
        <#if realm.internationalizationEnabled  && locale.supported?size gt 1>
            <div id="kc-locale">
            	
                <div id="kc-locale-wrapper" class="${properties.kcLocaleWrapperClass!}">
                    <div class="kc-dropdown" id="kc-locale-dropdown">
                    <span>SSO offered in : </span>
                        <a href="#" id="kc-current-locale-link">${locale.current}</a>
                        <#list locale.supported as l>
                           <a href="${l.url}">${l.label}</a>
                        </#list>
                    </div>
                </div>
            </div>
        </#if>
        <h1 id="kc-page-title"><#nested "header"></h1>
      </header>
	<div class="content-fluid no-gutter">
		<div class="row">
	<div class="col-sm-8">
	<img class="img-responsive" src="${url.resourcesPath}/img/bg.png"/>		
</div>
	<div class="col-sm-4">
	<div id="kc-content">
       
        <div id="kc-content-wrapper">
        <ul class="nav nav-tabs">
    <li class=""><a class="hvr-underline-from-center" tabindex="6" href="${url.loginUrl}">${msg("doLogIn")}</a></li>
    <li class=""><a class="hvr-underline-from-center" tabindex="6" href="${url.registrationUrl}">${msg("doRegister")}</a></li> 
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
    </div>
    <div id="menu1" class="tab-pane fade">
    </div>
    </div>


          <#-- App-initiated actions should not see warning messages about the need to complete the action -->
          <#-- during login.                                                                               -->
          <#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
              <div class="alert alert-${message.type}">
                  <#if message.type = 'success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
                  <#if message.type = 'warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
                  <#if message.type = 'error'><span class="${properties.kcFeedbackErrorIcon!}"></span></#if>
                  <#if message.type = 'info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
                  <span class="kc-feedback-text">${kcSanitize(message.summary)?no_esc}</span>
              </div>
          </#if>

          <#nested "form">

          <#if auth?has_content && auth.showBackButton() >
          <form id="kc-select-back-form" action="${url.loginAction}" method="post" <#if displayWide>class="${properties.kcContentWrapperClass!}"</#if>>
              <div <#if displayWide>class="${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}"</#if>>
                  <div class="${properties.kcFormGroupClass!}">
                    <input class="${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}"
                           name="back" id="kc-back" type="submit" value="${msg("doBack")}"/>
                  </div>
              </div>
          </form>
          </#if>

          <#if displayInfo>
              <div id="kc-info" class="${properties.kcSignUpClass!}">
                  <div id="kc-info-wrapper" class="${properties.kcInfoAreaWrapperClass!}">
                      <#nested "info">
                  </div>
              </div>
          </#if>
        </div>
      </div>
	</div>
	</div>
	</div>
      


<div id="divNews" class="divNews" );"="">
          <div class="marquee_container">
        
<div class="footer-logo-new sec hidden-xs">
    <div class="col-sm-12 vis ">
         <ul class="text-center list-inline flogo " style="padding: 20px 5px 7px 6px;">
            
            <li id="digitalindia-img">
               <a class="externalLink" href="" title="External link that opens in a new window" target="_blank" rel="noopener noreferrer"></a>
            </li>
            
             <li id="ndmcscl-img">
               <a class="externalLink" href="" title="External link that opens in a new window" target="_blank" rel="noopener noreferrer"></a>
            </li>
            
            <li id="googleplaystore-img">
               <a class="externalLink" href="https://play.google.com/store/apps/details?id=com.citizen.ndmc&amp;hl=en" title="External link that opens in a new window" target="_blank" rel="noopener noreferrer"></a>
            </li>
            
             <li id="applestore-img">
               <a class="externalLink" href="https://apps.apple.com/in/app/ndmc-311/id1446242962" title="External link that opens in a new window" target="_blank" rel="noopener noreferrer"></a>
            </li>
            <li id="toll-img">
               <a class="externalLink" href="applestore" title="External link that opens in a new window" target="_blank" rel="noopener noreferrer"></a>
            </li>
            <li id="email-img">
               <a class="externalLink" href="applestore" title="External link that opens in a new window" target="_blank" rel="noopener noreferrer"></a>
            </li>
         </ul>
       
      </div>

    <div class="clearfix"></div>

    <footer>
      
        <div class="col-lg-12 col-md-7 col-sm-7 col-xs-12 copyrightContainer">
          <p style="margin: 0">
            © 2020 NDMC, [All Rights Reserved] Designed, Developed &amp; Maintained by: Information Technology Deptt., NDMC, New Delhi
          </p>
          <p style="margin: 0">
            Any suggestions/queries, please contact at NDMC IT Department
          </p>
          <div class="sso-visitors hidden-xs" style="display: none">
            <div id="visitor_count" class="odometer odometer-auto-theme"><div class="odometer-inside"><span class="odometer-digit"><span class="odometer-digit-spacer">8</span><span class="odometer-digit-inner"><span class="odometer-ribbon"><span class="odometer-ribbon-inner"><span class="odometer-value">0</span></span></span></span></span></div></div>
          </div>
        </div>
        
      </footer>

   </div>

          </div>
        </div>


    </div>
  </div>
</body>
</html>
</#macro>
