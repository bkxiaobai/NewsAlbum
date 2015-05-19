<%@ page contentType="text/html; charset=gbk" language="java"%>
<%@ include file="taglibs.jsp"%>
<table>
	<tr>
		<td>&nbsp;</td>
		<logic:empty name="channels" scope="session">
			<td></td>
		</logic:empty>

		<logic:notEmpty name="channels" scope="session">
			<logic:iterate id="channel" name="channels" scope="session">
				<td width="73"><font color="#FFFFFF"><a
					href="viewalbumsk.do?channelId=${pageScope.channel.id}" class="03">
			    <bean:write
							name="channel" property="title" /> 
			    </a></font></td>
			</logic:iterate>
		</logic:notEmpty>
	</tr>
</table>
