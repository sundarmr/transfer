
<xsl:choose>
	<xsl:when test="contains($Start/root/Dir, &quot;POL/&quot;)">
		<Connection>
			<UserName>
				<xsl:value-of
					select="if($Start/root/FeedType/InitialStatusCode = $_globalVariables/ns:GlobalVariables/ENV/MassFeed/InitialStatusCode)&#xA;then $_globalVariables/ns:GlobalVariables/ENV/MassFeed/FTP/CardPoint/CardPointUser&#xA;else if ($Start/root/FeedType/InitialStatusCode = $_globalVariables/ns:GlobalVariables/ENV/MerchantPurgeFeed/InitialStatusCode)&#xA;then $_globalVariables/ns:GlobalVariables/ENV/MerchantPurgeFeed/FTP/CardPoint/CardPointUser&#xA;else $_globalVariables/ns:GlobalVariables/ENV/RegularFeed/FTP/CardPoint/CardPointUser" />
			</UserName>
			<Password>
				<xsl:value-of
					select="if($Start/root/FeedType/InitialStatusCode = $_globalVariables/ns:GlobalVariables/ENV/MassFeed/InitialStatusCode)&#xA;then $_globalVariables/ns:GlobalVariables/ENV/MassFeed/FTP/CardPoint/CardPointPass&#xA;else if ($Start/root/FeedType/InitialStatusCode = $_globalVariables/ns:GlobalVariables/ENV/MerchantPurgeFeed/InitialStatusCode)&#xA;then $_globalVariables/ns:GlobalVariables/ENV/MerchantPurgeFeed/FTP/CardPoint/CardPointPass&#xA;else $_globalVariables/ns:GlobalVariables/ENV/RegularFeed/FTP/CardPoint/CardPointPass" />
			</Password>
			<Port>
				<xsl:value-of select="$_globalVariables/ns:GlobalVariables/FTP/port" />
			</Port>
			<Host>
				<xsl:value-of
					select="if($Start/root/FeedType/InitialStatusCode = $_globalVariables/ns:GlobalVariables/ENV/MassFeed/InitialStatusCode)&#xA;then $_globalVariables/ns:GlobalVariables/ENV/MassFeed/FTP/CardPoint/CardPointFTP&#xA;else if ($Start/root/FeedType/InitialStatusCode = $_globalVariables/ns:GlobalVariables/ENV/MerchantPurgeFeed/InitialStatusCode)&#xA;then $_globalVariables/ns:GlobalVariables/ENV/MerchantPurgeFeed/FTP/CardPoint/CardPointFTP&#xA;else $_globalVariables/ns:GlobalVariables/ENV/RegularFeed/FTP/CardPoint/CardPointFTP" />
			</Host>
		</Connection>
	</xsl:when>
	<xsl:when test="contains($Start/root/Dir, &quot;VERIFONE/&quot;)">
		<Connection>
			<UserName>
				<xsl:value-of
					select="if($Start/root/FeedType/InitialStatusCode = $_globalVariables/ns:GlobalVariables/ENV/MassFeed/InitialStatusCode)&#xA;then $_globalVariables/ns:GlobalVariables/ENV/MassFeed/FTP/BaseVeriFone/SFTPuser&#xA;else if ($Start/root/FeedType/InitialStatusCode = $_globalVariables/ns:GlobalVariables/ENV/MerchantPurgeFeed/InitialStatusCode)&#xA;then $_globalVariables/ns:GlobalVariables/ENV/MerchantPurgeFeed/FTP/BaseVeriFone/SFTPuser&#xA;else $_globalVariables/ns:GlobalVariables/ENV/RegularFeed/FTP/BaseVeriFone/SFTPuser" />
			</UserName>
			<Password>
				<xsl:value-of
					select="if($Start/root/FeedType/InitialStatusCode = $_globalVariables/ns:GlobalVariables/ENV/MassFeed/InitialStatusCode)&#xA;then $_globalVariables/ns:GlobalVariables/ENV/MassFeed/FTP/BaseVeriFone/SFTPpass&#xA;else if ($Start/root/FeedType/InitialStatusCode = $_globalVariables/ns:GlobalVariables/ENV/MerchantPurgeFeed/InitialStatusCode)&#xA;then $_globalVariables/ns:GlobalVariables/ENV/MerchantPurgeFeed/FTP/BaseVeriFone/SFTPpass&#xA;else $_globalVariables/ns:GlobalVariables/ENV/RegularFeed/FTP/BaseVeriFone/SFTPpass" />
			</Password>
			<Port>
				<xsl:value-of select="$_globalVariables/ns:GlobalVariables/FTP/port" />
			</Port>
			<Host>
				<xsl:value-of
					select="if($Start/root/FeedType/InitialStatusCode = $_globalVariables/ns:GlobalVariables/ENV/MassFeed/InitialStatusCode)&#xA;then $_globalVariables/ns:GlobalVariables/ENV/MassFeed/FTP/BaseVeriFone/Host&#xA;else if ($Start/root/FeedType/InitialStatusCode = $_globalVariables/ns:GlobalVariables/ENV/MerchantPurgeFeed/InitialStatusCode)&#xA;then $_globalVariables/ns:GlobalVariables/ENV/MerchantPurgeFeed/FTP/BaseVeriFone/Host&#xA;else $_globalVariables/ns:GlobalVariables/ENV/RegularFeed/FTP/BaseVeriFone/Host" />
			</Host>
		</Connection>
	</xsl:when>
	<xsl:when test="contains($Start/root/Dir, &quot;INGENICO/&quot;)">
		<Connection>
			<UserName>
				<xsl:value-of
					select="if($Start/root/FeedType/InitialStatusCode = $_globalVariables/ns:GlobalVariables/ENV/MassFeed/InitialStatusCode)&#xA;then $_globalVariables/ns:GlobalVariables/ENV/MassFeed/FTP/Ingenico/User&#xA;else if ($Start/root/FeedType/InitialStatusCode = $_globalVariables/ns:GlobalVariables/ENV/MerchantPurgeFeed/InitialStatusCode)&#xA;then $_globalVariables/ns:GlobalVariables/ENV/MerchantPurgeFeed/FTP/Ingenico/User&#xA;else $_globalVariables/ns:GlobalVariables/ENV/RegularFeed/FTP/Ingenico/User" />
			</UserName>
			<Password>
				<xsl:value-of
					select="if($Start/root/FeedType/InitialStatusCode = $_globalVariables/ns:GlobalVariables/ENV/MassFeed/InitialStatusCode)&#xA;then $_globalVariables/ns:GlobalVariables/ENV/MassFeed/FTP/Ingenico/Password&#xA;else if ($Start/root/FeedType/InitialStatusCode = $_globalVariables/ns:GlobalVariables/ENV/MerchantPurgeFeed/InitialStatusCode)&#xA;then $_globalVariables/ns:GlobalVariables/ENV/MerchantPurgeFeed/FTP/Ingenico/Password&#xA;else $_globalVariables/ns:GlobalVariables/ENV/RegularFeed/FTP/Ingenico/Password" />
			</Password>
			<Port>
				<xsl:value-of select="$_globalVariables/ns:GlobalVariables/FTP/port" />
			</Port>
			<Host>
				<xsl:value-of
					select="if($Start/root/FeedType/InitialStatusCode = $_globalVariables/ns:GlobalVariables/ENV/MassFeed/InitialStatusCode)&#xA;then $_globalVariables/ns:GlobalVariables/ENV/MassFeed/FTP/Ingenico/Host&#xA;else if ($Start/root/FeedType/InitialStatusCode = $_globalVariables/ns:GlobalVariables/ENV/MerchantPurgeFeed/InitialStatusCode)&#xA;then $_globalVariables/ns:GlobalVariables/ENV/MerchantPurgeFeed/FTP/Ingenico/Host&#xA;else $_globalVariables/ns:GlobalVariables/ENV/RegularFeed/FTP/Ingenico/Host" />
			</Host>
		</Connection>
	</xsl:when>
	<xsl:otherwise>
		<Connection>
			<UserName>
				<xsl:value-of
					select="if($Start/root/FeedType/InitialStatusCode = $_globalVariables/ns:GlobalVariables/ENV/MassFeed/InitialStatusCode)&#xA;then $_globalVariables/ns:GlobalVariables/ENV/MassFeed/FTP/Base/BaseUser&#xA;else if ($Start/root/FeedType/InitialStatusCode = $_globalVariables/ns:GlobalVariables/ENV/MerchantPurgeFeed/InitialStatusCode)&#xA;then $_globalVariables/ns:GlobalVariables/ENV/MerchantPurgeFeed/FTP/Base/BaseUser&#xA;else $_globalVariables/ns:GlobalVariables/ENV/RegularFeed/FTP/Base/BaseUser" />
			</UserName>
			<Password>
				<xsl:value-of
					select="if($Start/root/FeedType/InitialStatusCode = $_globalVariables/ns:GlobalVariables/ENV/MassFeed/InitialStatusCode)&#xA;then $_globalVariables/ns:GlobalVariables/ENV/MassFeed/FTP/Base/BasePass&#xA;else if ($Start/root/FeedType/InitialStatusCode = $_globalVariables/ns:GlobalVariables/ENV/MerchantPurgeFeed/InitialStatusCode)&#xA;then $_globalVariables/ns:GlobalVariables/ENV/MerchantPurgeFeed/FTP/Base/BasePass&#xA;else $_globalVariables/ns:GlobalVariables/ENV/RegularFeed/FTP/Base/BasePass" />
			</Password>
			<Port>
				<xsl:value-of select="$_globalVariables/ns:GlobalVariables/FTP/port" />
			</Port>
			<Host>
				<xsl:value-of
					select="if($Start/root/FeedType/InitialStatusCode = $_globalVariables/ns:GlobalVariables/ENV/MassFeed/InitialStatusCode)&#xA;then $_globalVariables/ns:GlobalVariables/ENV/MassFeed/FTP/Base/BaseFTP&#xA;else if ($Start/root/FeedType/InitialStatusCode = $_globalVariables/ns:GlobalVariables/ENV/MerchantPurgeFeed/InitialStatusCode)&#xA;then $_globalVariables/ns:GlobalVariables/ENV/MerchantPurgeFeed/FTP/Base/BaseFTP&#xA;else $_globalVariables/ns:GlobalVariables/ENV/RegularFeed/FTP/Base/BaseFTP" />
			</Host>
		</Connection>
	</xsl:otherwise>
</xsl:choose>