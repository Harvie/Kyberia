<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->


{include file="modules/header.tpl"}

{if $error eq true}

{$error}

{/if}

{if $user_id eq false}

{include file="modules/loginbox.tpl"}


{else}




 
{include file="modules/node_settings.tpl"}
{include file="modules/userinfo.tpl"}
{* showing poll *}
{*include file="modules/get_poll_box.tpl"*}


{*showing bookmark_statistics*}
{include file="modules/get_bookmark_statistics_box.tpl"}
 



 



{include file="modules/movement.tpl"}




{if $action eq true}


{include file="modules/movement.tpl"}

{include file="modules/get_creation_by_template_id.tpl" listing_amount=$listing_amount type=$action}


{else}
{include file="modules/node_content.tpl"}
{* shows what other friends think about users *}
{get_children_by_external_link external_link='session://friend' listing_amount=$listing_amount offset=$offset orderby=desc}
{foreach from=$get_children_by_external_link item=child}

 
   
 

 
{if $child.template_id eq 6 }

{$child.node_name}
{elseif $child.template_id eq 5 }

{$child.node_name}
{else}
 {$child.login}
{if $child.user_action neq false}
 [lokacia :: {$child.user_action}]
{/if}
{/if}

  {$child.node_created|date_format:"%d.%m.%Y. - %H:%M:%S"}

 
{$child.node_content} 

 
 

{/foreach}








{if $permissions.w eq true}



 with name:  
 

{/if}



{/if}


 

{/if}

{include file="modules/footer.tpl"}






















