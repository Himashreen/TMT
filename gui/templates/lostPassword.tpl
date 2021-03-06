{* 
TestLink Open Source Project - http://testlink.sourceforge.net/
@filesource lostPassword.tpl
Purpose: lost password page 

*}

{lang_get var="labels" s="password_reset,login_name,btn_send,
                          password_mgmt_is_external,link_back_to_login"}
{include file="inc_head.tpl" title=$gui->page_title openHead='yes'}

<script language="JavaScript" src="{$basehref}gui/niftycube/niftycube.js" type="text/javascript"></script>
<script type="text/javascript">
window.onload=function(){
 		Nifty("div#login_div","big");
 		Nifty("div.messages","normal");
		focusInputField('login');
}

</script>
<!--  <style>
#contain a {
    margin: 10px 20px 10px 20px;
    text-decoration: none;
    display: inline-block;
}
</style>  -->
</head>

<body>
<img src="image10.jpeg " style="position:absolute;top:0%;left:0%;width:53%;height:700px;"></img>

{config_load file="input_dimensions.conf" section="login"} {* Constant definitions *}
<div class="forms" id="login_div" style="position:absolute;left:40%;width:30%;height:100px;background-color: #f6f5fa;">
  {include file="inc_login_title.tpl"}
	{if $gui->external_password_mgmt eq 0}
    <p class="title">{$labels.password_reset}</p>

    <form method="post" action="lostPassword.php" >
 		  <div class="messages" style="text-align:left;background-color: #f6f5fa;">{$gui->note|escape}
    	
    	<p class="label">{$labels.login_name}<br />
    	<input type="text" name="login" id="login" 
    	       size="{#LOGIN_SIZE#}" maxlength="{#LOGIN_MAXLEN#}" /></p>
    	<p><input type="submit" name="editUser" value="{$labels.btn_send}" /></p>
    </form>
    
	{else}

    <p>{if $gui->password_mgmt_feedback == ''}
          {$labels.password_mgmt_is_external}
       {else}
          {$gui->password_mgmt_feedback|escape}
       {/if}   
    </p>
	{/if}

    <hr />
	<p><a href="login.php">{$labels.link_back_to_login}</a></p>
</div>
</div>

</body>
</html>