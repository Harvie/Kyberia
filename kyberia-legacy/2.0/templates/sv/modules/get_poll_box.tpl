<!--
This program is free software. It comes without any warranty, to
the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.
-->

<!--showing poll-->
{if $poll_id eq true}{get_poll poll_id=$poll_id}
{else}{get_poll}{/if}

{if $get_poll.question eq true}
	<table width='66%' align='center' class='bordered'>
	<tr><td colspan='3' align='center'><b>{$get_poll.question}</b></td></tr>
	{foreach from=$get_poll.options item=option name=poll_option}
		<tr><td>
		{if $get_poll.voted eq 'yes'}
			{$option.text}
		{else}	
			<a href='/id/{$get_poll.node_id}/{$smarty.foreach.poll_option.iteration}'>{$option.text}</a>
		{/if}
			  <td>{math equation="(x/y)*100" format="%.1f" x=$option.number y=$get_poll.total}%</td></tr>


	{/foreach}
	<tr><td colspan='3' align='center'><i>{$get_poll.total} voted</i></td></tr>
	</table>
{/if}
<!--end of showing poll-->
