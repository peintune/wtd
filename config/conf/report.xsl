<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" version="1.0" encoding="utf-8"
		indent="yes" />
	<xsl:template match="/">
		<html>
			<body>
				<table align="center">
					<tr bgcolor="#CD950C" align="center">
					</tr>
				</table>
				<br />
				<p align="center" style="font-family:'Arial';font-size:32px;font-weight:bold">
					自动化测试报告:
					<xsl:value-of select="/TestResult/TestCase[1]/@webBrowser" />
				</p>
				<br />
				<p align="center" style="font-family:'Arial';font-size:22px;font-weight:bold">Total pass rate</p>
				<table border="1" align="center">
					<tr bgcolor="#666666">
						<th align="center" width="200">
							<font color="#FFFFFF" size="4" style="font-family:'仿宋'">总用例数</font>
						</th>
						<th align="center" width="200">
							<font color="#FFFFFF" size="4" style="font-family:'仿宋'">通过用例数</font>
						</th>
						<th align="center" width="200">
							<font color="#FFFFFF" size="4" style="font-family:'仿宋'">未通过用例数</font>
						</th>
						<th align="center" width="200">
							<font color="#FFFFFF" size="4" style="font-family:'仿宋'">通过率(%)</font>
						</th>
					</tr>
					<tr>
						<xsl:variable name="allcase"
							select="count(//node()[name()='TestCase'])" />
						<xsl:variable name="allpasscase"
							select="count(//node()[name()='TestCase' and @result='pass'])" />
						<th align="center" width="200">
							<font color="#000000" size="4">
								<xsl:value-of select="count(//node()[name()='TestCase'])" />
							</font>
						</th>
						<th align="center" width="200">
							<font color="#009933" size="4">
								<xsl:value-of
									select="count(//node()[name()='TestCase' and @result='pass'])" />
							</font>
						</th>
						<th align="center" width="200">
							<font color="#FF0000" size="4">
								<xsl:value-of
									select="count(//node()[name()='TestCase' and @result!='pass'])" />
							</font>
						</th>
						<th align="center" width="200">
							<font color="#76EE00" size="4">
								<xsl:value-of
									select="concat(substring(($allpasscase div $allcase)*100,0,5),'%')" />
							</font>
						</th>
					</tr>
				</table>
				<br />
				<br />
				<br />

				<xsl:if test="count(//TestCase[@caseType='common']) &gt; 0">
					<br />
					<br />
					<p align="left" style="font-family:'Arial';font-size:19px;font-weight:bold">♥ Common case pass rate</p>
					<table border="1" align="left">
						<tr bgcolor="#666666">
							<th align="center" width="200">
								<font color="#FFFFFF" size="4" style="font-family:'仿宋'">总用例数</font>
							</th>
							<th align="center" width="200">
								<font color="#FFFFFF" size="4" style="font-family:'仿宋'">通过用例数</font>
							</th>
							<th align="center" width="200">
								<font color="#FFFFFF" size="4" style="font-family:'仿宋'">未通过用例数</font>
							</th>
							<th align="center" width="200">
								<font color="#FFFFFF" size="4" style="font-family:'仿宋'">通过率(%)</font>
							</th>
						</tr>
						<tr>
							<xsl:variable name="allcase"
								select="count(//node()[name()='TestCase' and @caseType='common'])" />
							<xsl:variable name="allpasscase"
								select="count(//node()[name()='TestCase' and @result='pass' and @caseType='common'])" />
							<th align="center" width="200">
								<font color="#000000" size="4">
									<xsl:value-of
										select="count(//node()[name()='TestCase' and @caseType='common'])" />
								</font>
							</th>
							<th align="center" width="200">
								<font color="#009933" size="4">
									<xsl:value-of
										select="count(//node()[name()='TestCase' and @result='pass' and @caseType='common'])" />
								</font>
							</th>
							<th align="center" width="200">
								<font color="#FF0000" size="4">
									<xsl:value-of
										select="count(//node()[name()='TestCase' and @result!='pass' and @caseType='common'])" />
								</font>
							</th>
							<th align="center" width="200">
								<font color="#76EE00" size="4">
									<xsl:value-of
										select="concat(substring(($allpasscase div $allcase)*100,0,5),'%')" />
								</font>
							</th>
						</tr>
					</table>
					<br />
					<br />
					<br />
					<br />
					<xsl:if
						test="count(//TestCase[@caseType='common' and @result!='pass']) &gt; 0">
						<p align="left" style="font-family:'Arial';font-size:16px;font-weight:bold">Common case Failed Detail</p>
						<br />
						<table border="1" align="left">
							<tr bgcolor="#666666">
								<th align="center" width="150">
									<font color="#FFFFFF" size="3" style="font-family:'仿宋'">用例名称</font>
								</th>
								<th align="center" width="150">
									<font color="#FFFFFF" size="3" style="font-family:'仿宋'">用例模块</font>
								</th>
								<th align="center" width="150">
									<font color="#FFFFFF" size="3" style="font-family:'仿宋'">功能点名称</font>
								</th>
								<th align="center" width="150">
									<font color="#FFFFFF" size="3" style="font-family:'仿宋'">功能点描述</font>
								</th>
								<th align="center" width="100">
									<font color="#FFFFFF" size="3" style="font-family:'仿宋'">测试结果</font>
								</th>
								<th align="center" width="320">
									<font color="#FFFFFF" size="3" style="font-family:'仿宋'">错误原因</font>
								</th>
								<th align="center" width="100">
									<font color="#FFFFFF" size="3" style="font-family:'仿宋'">Log链接</font>
								</th>
							</tr>

							<xsl:for-each
								select="//TestCase[@result='block' and @caseType='common']">
								<xsl:variable name="logLink" select="self::node()/@logUrl" />
								<tr>
									<td class="tdStyle" align="center" width="150">
										<font style="font-family:'仿宋'">
											<xsl:value-of select="self::node()/@name" />
										</font>
									</td>
									<td class="tdStyle" align="center" width="150">
										<font style="font-family:'仿宋'">
											<xsl:value-of select="parent::node()/@caseModule" />
										</font>
									</td>
									<td class="tdStyle" align="center" width="150">
										<font style="font-family:'仿宋'">测试过程异常</font>
									</td>
									<td class="tdStyle" align="center" width="150">
										<font style="font-family:'仿宋'">测试过程异常</font>
									</td>
									<td class="tdStyle" align="center" width="100">
										<font color="#8E388E">
											<xsl:value-of select="@result" />
										</font>
									</td>
									<td class="tdStyle" align="center" width="320">
										<font style="font-family:'仿宋'">
											<xsl:value-of select="@errorInfo" />
										</font>
									</td>
									<td class="tdStyle" align="center" width="100">
										<font size="2" style="font-family:'Times New Roman'">
											<u>
												<a href="file://{$logLink}" target="_blank">Link</a>
											</u>
										</font>
									</td>
								</tr>
							</xsl:for-each>
							<br />
							<br />
							<xsl:for-each
								select="//TestPoint[@result!='pass' and @caseType='common']">
								<xsl:variable name="logLink" select="parent::node()/@logUrl" />
								<tr>
									<td class="tdStyle" align="center" width="150">
										<font style="font-family:'仿宋'">
											<xsl:value-of select="parent::node()/@name" />
										</font>
									</td>
									<td class="tdStyle" align="center" width="150">
										<font style="font-family:'仿宋'">
											<xsl:value-of select="parent::node()/@caseModule" />
										</font>
									</td>
									<td class="tdStyle" align="center" width="150">
										<font style="font-family:'仿宋'">
											<xsl:value-of select="@name" />
										</font>
									</td>
									<td class="tdStyle" align="center" width="150">
										<font style="font-family:'仿宋'">
											<xsl:value-of select="@description" />
										</font>
									</td>
									<td class="tdStyle" align="center" width="100">
										<font color="red">
											<xsl:value-of select="@result" />
										</font>
									</td>
									<td class="tdStyle" align="center" width="320">
										<font style="font-family:'仿宋'">
											<xsl:value-of select="@errorInfo" />
										</font>
									</td>
									<td class="tdStyle" align="center" width="100">
										<font size="2" style="font-family:'Times New Roman'">
											<u>
												<a href="file://{$logLink}" target="_blank">Link</a>
											</u>
										</font>
									</td>
								</tr>
							</xsl:for-each>
						</table>

						<br />
						<br />
						<br />
						<br />
						<br />
					</xsl:if>
				</xsl:if>
				<br />
				<br />

				<xsl:if test="count(//TestCase[@caseType='interface']) &gt; 0">

					<p align="left" style="font-family:'Arial';font-size:19px;font-weight:bold">♥ Interface case pass rate</p>
					<table border="1" align="left">
						<tr bgcolor="#666666">
							<th align="center" width="200">
								<font color="#FFFFFF" size="4" style="font-family:'仿宋'">总用例数</font>
							</th>
							<th align="center" width="200">
								<font color="#FFFFFF" size="4" style="font-family:'仿宋'">通过用例数</font>
							</th>
							<th align="center" width="200">
								<font color="#FFFFFF" size="4" style="font-family:'仿宋'">未通过用例数</font>
							</th>
							<th align="center" width="200">
								<font color="#FFFFFF" size="4" style="font-family:'仿宋'">通过率(%)</font>
							</th>
						</tr>
						<tr>
							<xsl:variable name="allcase"
								select="count(//node()[name()='TestCase' and @caseType='interface'])" />
							<xsl:variable name="allpasscase"
								select="count(//node()[name()='TestCase' and @result='pass' and @caseType='interface'])" />
							<th align="center" width="200">
								<font color="#000000" size="4">
									<xsl:value-of
										select="count(//node()[name()='TestCase' and  @caseType='interface'])" />
								</font>
							</th>
							<th align="center" width="200">
								<font color="#009933" size="4">
									<xsl:value-of
										select="count(//node()[name()='TestCase' and @result='pass' and @caseType='interface'])" />
								</font>
							</th>
							<th align="center" width="200">
								<font color="#FF0000" size="4">
									<xsl:value-of
										select="count(//node()[name()='TestCase' and @result!='pass' and @caseType='interface'])" />
								</font>
							</th>
							<th align="center" width="200">
								<font color="#76EE00" size="4">
									<xsl:value-of
										select="concat(substring(($allpasscase div $allcase)*100,0,5),'%')" />
								</font>
							</th>
						</tr>
					</table>
					<br />
					<br />
					<br />
					<br />
					<br />
					<xsl:if
						test="count(//TestCase[@caseType='interface' and @result!='pass']) &gt; 0">
						<p align="left" style="font-family:'Arial';font-size:16px;font-weight:bold">Interface case Failed Detail</p>
						<br />

						<table border="1" align="left">
							<tr bgcolor="#666666">
								<th align="center" width="150">
									<font color="#FFFFFF" size="3" style="font-family:'仿宋'">用例名称</font>
								</th>
								<th align="center" width="150">
									<font color="#FFFFFF" size="3" style="font-family:'仿宋'">用例模块</font>
								</th>
								<th align="center" width="150">
									<font color="#FFFFFF" size="3" style="font-family:'仿宋'">预期包含值</font>
								</th>
								<th align="center" width="150">
									<font color="#FFFFFF" size="3" style="font-family:'仿宋'">功能点描述</font>
								</th>
								<th align="center" width="100">
									<font color="#FFFFFF" size="3" style="font-family:'仿宋'">测试结果</font>
								</th>
								<th align="center" width="320">
									<font color="#FFFFFF" size="3" style="font-family:'仿宋'">测试返回结果</font>
								</th>
								<th align="center" width="100">
									<font color="#FFFFFF" size="3" style="font-family:'仿宋'">Log链接</font>
								</th>
							</tr>

							<xsl:for-each
								select="//TestCase[@result='block' and @caseType='interface']">
								<xsl:variable name="logLink" select="self::node()/@logUrl" />
								<tr>
									<td class="tdStyle" align="center" width="150">
										<font style="font-family:'仿宋'">
											<xsl:value-of select="self::node()/@name" />
										</font>
									</td>
									<td class="tdStyle" align="center" width="150">
										<font style="font-family:'仿宋'">
											<xsl:value-of select="self::node()/@caseModule" />
										</font>
									</td>
									<td class="tdStyle" align="center" width="150">
										<font style="font-family:'仿宋'">测试过程异常</font>
									</td>
									<td class="tdStyle" align="center" width="150">
										<font style="font-family:'仿宋'">测试过程异常</font>
									</td>
									<td class="tdStyle" align="center" width="100">
										<font color="#8E388E">
											<xsl:value-of select="@result" />
										</font>
									</td>
									<td class="tdStyle" align="center" width="320">
										<font style="font-family:'仿宋'">
											<xsl:value-of select="@errorInfo" />
										</font>
									</td>
									<td class="tdStyle" align="center" width="100">
										<font size="2" style="font-family:'Times New Roman'">
											<u>
												<a href="file://{$logLink}" target="_blank">Link</a>
											</u>
										</font>
									</td>
								</tr>
							</xsl:for-each>
							<br />
							<br />
							<xsl:for-each
								select="//TestPoint[@result!='pass' and @caseType='interface']">
								<xsl:variable name="logLink" select="parent::node()/@logUrl" />
								<tr>
									<td class="tdStyle" align="center" width="150">
										<font style="font-family:'仿宋'">
											<xsl:value-of select="parent::node()/@name" />
										</font>
									</td>
									<td class="tdStyle" align="center" width="150">
										<font style="font-family:'仿宋'">
											<xsl:value-of select="parent::node()/@caseModule" />
										</font>
									</td>
									<td class="tdStyle" align="center" width="150">
										<font style="font-family:'仿宋'">
											<xsl:value-of select="@expectString" />
										</font>
									</td>
									<td class="tdStyle" align="center" width="150">
										<font style="font-family:'仿宋'">
											<xsl:value-of select="@name" />
										</font>
									</td>
									<td class="tdStyle" align="center" width="100">
										<font color="red">
											<xsl:value-of select="@result" />
										</font>
									</td>
									<td class="tdStyle" align="center" width="320">
										<font style="font-family:'仿宋'">
											<xsl:value-of select="@errorInfo" />
										</font>
									</td>
									<td class="tdStyle" align="center" width="100">
										<font size="2" style="font-family:'Times New Roman'">
											<u>
												<a href="file://{$logLink}" target="_blank">Link</a>
											</u>
										</font>
									</td>
								</tr>
							</xsl:for-each>
						</table>
					</xsl:if>
				</xsl:if>
				<br />
				<br />
				<p align="center"
					style="font-family:'Times New Roman';font-size:19px;font-weight:bold">All cases results</p>
				<table border="0" align="center">
					<tr bgcolor="#666666">
						<th align="center" width="150" bgcolor="#FFA042">
							<font color="#FFFFFF" size="2" style="font-family:'仿宋'">用例名称</font>
						</th>
						<th align="center" width="150" bgcolor="#FFA042">
							<font color="#FFFFFF" size="2" style="font-family:'仿宋'">用例模块</font>
						</th>
						<th align="center" width="150" bgcolor="#FFA042">
							<font color="#FFFFFF" size="2" style="font-family:'仿宋'">用例类型</font>
						</th>
						<th align="center" width="150" bgcolor="#FFA042">
							<font color="#FFFFFF" size="2" style="font-family:'仿宋'">测试结果</font>
						</th>
					</tr>
					<xsl:for-each select="//TestCase">
						<tr>
							<td class="tdStyle" align="left" width="150" bgcolor="#AE8F00">
								<font style="font-family:'仿宋'" color="white">
									<xsl:value-of select="@name" />
								</font>
							</td>
							<td class="tdStyle" align="center" width="150" bgcolor="#AE8F00">
								<font style="font-family:'仿宋'" color="white">
									<xsl:value-of select="@caseModule" />
								</font>
							</td>
							<td class="tdStyle" align="center" width="150" bgcolor="#AE8F00">
								<font style="font-family:'仿宋'" color="white">
									<xsl:value-of select="@caseType" />
								</font>
							</td>
							<xsl:choose>
								<xsl:when test="@result != 'pass'">
									<td class="tdStyle" align="center" width="150" bgcolor="#AE8F00">
										<font style="font-family:'仿宋'" color="#FF0000">
											<xsl:value-of select="@result" />
										</font>
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td class="tdStyle" align="center" width="150" bgcolor="#AE8F00">
										<font style="font-family:'仿宋'" color="#00DB00">
											<xsl:value-of select="@result" />
										</font>
									</td>
								</xsl:otherwise>
							</xsl:choose>

						</tr>
					</xsl:for-each>

				</table>
				<br />
				<br />
				<br />
				<br />
				<br />

				<p align="center" style="font-family:'仿宋';font-size:15px;">自动化测试报告</p>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>