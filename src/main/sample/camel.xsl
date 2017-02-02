<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:param name="$ENV.RegularFeed.FTP.Base.BaseFTP" />
	<xsl:param name="$ENV.RegularFeed.FTP.CardPoint.CardPointPass" />
	<xsl:param name="$ENV.RegularFeed.FTP.Ingenico.Host" />
	<xsl:param name="$ENV.MerchantPurgeFeed.FTP.Base.BaseFTP" />
	<xsl:param name="$ENV.MassFeed.FTP.CardPoint.CardPointPass" />
	<xsl:param name="$ENV.MassFeed.FTP.Ingenico.Password" />
	<xsl:param name="$ENV.RegularFeed.FTP.CardPoint.CardPointFTP" />
	<xsl:param name="$ENV.RegularFeed.FTP.BaseVeriFone.Host" />
	<xsl:param name="$ENV.MerchantPurgeFeed.FTP.BaseVeriFone.SFTPpass" />
	<xsl:param name="$ENV.MassFeed.FTP.CardPoint.CardPointFTP" />
	<xsl:param name="$ENV.MerchantPurgeFeed.FTP.Ingenico.Host" />
	<xsl:param name="$ENV.MassFeed.FTP.Base.BaseFTP" />
	<xsl:param name="$ENV.RegularFeed.FTP.Base.BaseUser" />
	<xsl:param name="$ENV.MerchantPurgeFeed.FTP.CardPoint.CardPointUser" />
	<xsl:param name="$ENV.MerchantPurgeFeed.FTP.CardPoint.CardPointPass" />
	<xsl:param name="$ENV.RegularFeed.FTP.BaseVeriFone.SFTPuser" />
	<xsl:param name="$ENV.MerchantPurgeFeed.FTP.BaseVeriFone.Host" />
	<xsl:param name="$ENV.MassFeed.FTP.Base.BaseUser" />
	<xsl:param name="$ENV.MassFeed.FTP.CardPoint.CardPointUser" />
	<xsl:param name="$ENV.RegularFeed.FTP.BaseVeriFone.SFTPpass" />
	<xsl:param name="$ENV.MassFeed.FTP.Base.BasePass" />
	<xsl:param name="$ENV.RegularFeed.FTP.Ingenico.User" />
	<xsl:param name="$ENV.MassFeed.FTP.BaseVeriFone.Host" />
	<xsl:param name="$ENV.MerchantPurgeFeed.FTP.Base.BaseUser" />
	<xsl:param name="$ENV.MassFeed.FTP.BaseVeriFone.SFTPpass" />
	<xsl:param name="$ENV.MerchantPurgeFeed.FTP.Base.BasePass" />
	<xsl:param name="$ENV.MerchantPurgeFeed.FTP.CardPoint.CardPointFTP" />
	<xsl:param name="$ENV.RegularFeed.FTP.Base.BasePass" />
	<xsl:param name="$ENV.MassFeed.FTP.Ingenico.Host" />
	<xsl:param name="$FTP.port" />
	<xsl:param name="$ENV.RegularFeed.FTP.Ingenico.Password" />
	<xsl:param name="$ENV.MassFeed.InitialStatusCode" />
	<xsl:param name="$ENV.MerchantPurgeFeed.FTP.Ingenico.User" />
	<xsl:param name="$ENV.RegularFeed.FTP.CardPoint.CardPointUser" />
	<xsl:param name="$ENV.MerchantPurgeFeed.FTP.BaseVeriFone.SFTPuser" />
	<xsl:param name="$ENV.MassFeed.FTP.BaseVeriFone.SFTPuser" />
	<xsl:param name="$ENV.MassFeed.FTP.Ingenico.User" />
	<xsl:param name="$ENV.MerchantPurgeFeed.InitialStatusCode" />
	<xsl:param name="$ENV.MerchantPurgeFeed.FTP.Ingenico.Password" />
	<xsl:template match="/">
		<xsl:choose>
			<xsl:when test="contains($Start/root/Dir, &quot;POL/&quot;)">
				<Connection>
					<UserName>
						<xsl:value-of
							select="if($Start/root/FeedType/InitialStatusCode = $ENV.MassFeed.InitialStatusCode)&#10;then $ENV.MassFeed.FTP.CardPoint.CardPointUser&#10;else if ($Start/root/FeedType/InitialStatusCode = $ENV.MerchantPurgeFeed.InitialStatusCode)&#10;then $ENV.MerchantPurgeFeed.FTP.CardPoint.CardPointUser&#10;else $ENV.RegularFeed.FTP.CardPoint.CardPointUser" />
					</UserName>
					<Password>
						<xsl:value-of
							select="if($Start/root/FeedType/InitialStatusCode = $ENV.MassFeed.InitialStatusCode)&#10;then $ENV.MassFeed.FTP.CardPoint.CardPointPass&#10;else if ($Start/root/FeedType/InitialStatusCode = $ENV.MerchantPurgeFeed.InitialStatusCode)&#10;then $ENV.MerchantPurgeFeed.FTP.CardPoint.CardPointPass&#10;else $ENV.RegularFeed.FTP.CardPoint.CardPointPass" />
					</Password>
					<Port>
						<xsl:value-of select="$FTP.port" />
					</Port>
					<Host>
						<xsl:value-of
							select="if($Start/root/FeedType/InitialStatusCode = $ENV.MassFeed.InitialStatusCode)&#10;then $ENV.MassFeed.FTP.CardPoint.CardPointFTP&#10;else if ($Start/root/FeedType/InitialStatusCode = $ENV.MerchantPurgeFeed.InitialStatusCode)&#10;then $ENV.MerchantPurgeFeed.FTP.CardPoint.CardPointFTP&#10;else $ENV.RegularFeed.FTP.CardPoint.CardPointFTP" />
					</Host>
				</Connection>
			</xsl:when>
			<xsl:when test="contains($Start/root/Dir, &quot;VERIFONE/&quot;)">
				<Connection>
					<UserName>
						<xsl:value-of
							select="if($Start/root/FeedType/InitialStatusCode = $ENV.MassFeed.InitialStatusCode)&#10;then $ENV.MassFeed.FTP.BaseVeriFone.SFTPuser&#10;else if ($Start/root/FeedType/InitialStatusCode = $ENV.MerchantPurgeFeed.InitialStatusCode)&#10;then $ENV.MerchantPurgeFeed.FTP.BaseVeriFone.SFTPuser&#10;else $ENV.RegularFeed.FTP.BaseVeriFone.SFTPuser" />
					</UserName>
					<Password>
						<xsl:value-of
							select="if($Start/root/FeedType/InitialStatusCode = $ENV.MassFeed.InitialStatusCode)&#10;then $ENV.MassFeed.FTP.BaseVeriFone.SFTPpass&#10;else if ($Start/root/FeedType/InitialStatusCode = $ENV.MerchantPurgeFeed.InitialStatusCode)&#10;then $ENV.MerchantPurgeFeed.FTP.BaseVeriFone.SFTPpass&#10;else $ENV.RegularFeed.FTP.BaseVeriFone.SFTPpass" />
					</Password>
					<Port>
						<xsl:value-of select="$FTP.port" />
					</Port>
					<Host>
						<xsl:value-of
							select="if($Start/root/FeedType/InitialStatusCode = $ENV.MassFeed.InitialStatusCode)&#10;then $ENV.MassFeed.FTP.BaseVeriFone.Host&#10;else if ($Start/root/FeedType/InitialStatusCode = $ENV.MerchantPurgeFeed.InitialStatusCode)&#10;then $ENV.MerchantPurgeFeed.FTP.BaseVeriFone.Host&#10;else $ENV.RegularFeed.FTP.BaseVeriFone.Host" />
					</Host>
				</Connection>
			</xsl:when>
			<xsl:when test="contains($Start/root/Dir, &quot;INGENICO/&quot;)">
				<Connection>
					<UserName>
						<xsl:value-of
							select="if($Start/root/FeedType/InitialStatusCode = $ENV.MassFeed.InitialStatusCode)&#10;then $ENV.MassFeed.FTP.Ingenico.User&#10;else if ($Start/root/FeedType/InitialStatusCode = $ENV.MerchantPurgeFeed.InitialStatusCode)&#10;then $ENV.MerchantPurgeFeed.FTP.Ingenico.User&#10;else $ENV.RegularFeed.FTP.Ingenico.User" />
					</UserName>
					<Password>
						<xsl:value-of
							select="if($Start/root/FeedType/InitialStatusCode = $ENV.MassFeed.InitialStatusCode)&#10;then $ENV.MassFeed.FTP.Ingenico.Password&#10;else if ($Start/root/FeedType/InitialStatusCode = $ENV.MerchantPurgeFeed.InitialStatusCode)&#10;then $ENV.MerchantPurgeFeed.FTP.Ingenico.Password&#10;else $ENV.RegularFeed.FTP.Ingenico.Password" />
					</Password>
					<Port>
						<xsl:value-of select="$FTP.port" />
					</Port>
					<Host>
						<xsl:value-of
							select="if($Start/root/FeedType/InitialStatusCode = $ENV.MassFeed.InitialStatusCode)&#10;then $ENV.MassFeed.FTP.Ingenico.Host&#10;else if ($Start/root/FeedType/InitialStatusCode = $ENV.MerchantPurgeFeed.InitialStatusCode)&#10;then $ENV.MerchantPurgeFeed.FTP.Ingenico.Host&#10;else $ENV.RegularFeed.FTP.Ingenico.Host" />
					</Host>
				</Connection>
			</xsl:when>
			<xsl:otherwise>
				<Connection>
					<UserName>
						<xsl:value-of
							select="if($Start/root/FeedType/InitialStatusCode = $ENV.MassFeed.InitialStatusCode)&#10;then $ENV.MassFeed.FTP.Base.BaseUser&#10;else if ($Start/root/FeedType/InitialStatusCode = $ENV.MerchantPurgeFeed.InitialStatusCode)&#10;then $ENV.MerchantPurgeFeed.FTP.Base.BaseUser&#10;else $ENV.RegularFeed.FTP.Base.BaseUser" />
					</UserName>
					<Password>
						<xsl:value-of
							select="if($Start/root/FeedType/InitialStatusCode = $ENV.MassFeed.InitialStatusCode)&#10;then $ENV.MassFeed.FTP.Base.BasePass&#10;else if ($Start/root/FeedType/InitialStatusCode = $ENV.MerchantPurgeFeed.InitialStatusCode)&#10;then $ENV.MerchantPurgeFeed.FTP.Base.BasePass&#10;else $ENV.RegularFeed.FTP.Base.BasePass" />
					</Password>
					<Port>
						<xsl:value-of select="$FTP.port" />
					</Port>
					<Host>
						<xsl:value-of
							select="if($Start/root/FeedType/InitialStatusCode = $ENV.MassFeed.InitialStatusCode)&#10;then $ENV.MassFeed.FTP.Base.BaseFTP&#10;else if ($Start/root/FeedType/InitialStatusCode = $ENV.MerchantPurgeFeed.InitialStatusCode)&#10;then $ENV.MerchantPurgeFeed.FTP.Base.BaseFTP&#10;else $ENV.RegularFeed.FTP.Base.BaseFTP" />
					</Host>
				</Connection>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>