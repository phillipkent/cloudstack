<?xml version="1.0"?>
<!--
Adaptation of this file for Interoute VDC 2.0 API Documentation
(c) Interoute Communications Limited 2016
+++++++++++
Source copyright statement:

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
version="1.0">
<xsl:output method="html" doctype-public="-//W3C//DTD HTML 1.0 Transitional//EN"/>
<xsl:template match="/">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel= "stylesheet" href="../includes/main.css" type="text/css" />
<link rel="shortcut icon" href="../favicon.ico" type="image/x-icon" />

<title>API Reference|Interoute Virtual Data Centre</title>
</head>

<body>
<div id="api_insidetopbg">
<div id="api_inside_wrapper">
	<div class="api_uppermenu_panel">
            <div class="api_uppermenu_box">

</div>
        </div>
        
        <div id="api_main_master">
            <div id="api_inside_header">

                <div class="api_header_top">
                    <a class="api_cloud_logo" href="http://cloudstack.org"></a>
                    <div class="api_mainemenu_panel">
                        
                    </div>
                </div>

            
            </div>

            <div id="api_main_content">
             	
                <div class="api_inside_apileftpanel">
                	<div class="api_inside_contentpanel" style="width:930px;">
                    	<div class="api_api_titlebox">
                        	<div class="api_api_titlebox_left">
				<xsl:for-each select="command/command">
                           		<!-- Modify this line for the release version -->
                           		<span>
									Interoute VDC 2.0 API Reference
								</span>
								<p></p>
                                <h1><xsl:value-of select="name"/></h1>
                                <p><xsl:value-of select="description"/></p>
				</xsl:for-each>
                            </div>

                            
                            <div class="api_api_titlebox_right">
                            	<a class="api_api_backbutton" href="../TOC_Domain_Admin.html"></a>
                            </div>
                        </div>
                    	<div class="api_api_tablepanel">     
                         	<h2>Request parameters</h2>
                                <table class="api_table">
                                  <tr class="hed">
                                     <td class="api_reqtd1"><strong>Parameter Name</strong></td>
                                    <td class="api_reqtd2">Description</td>
                                     <td class="api_reqtd3">Required</td>
                                   </tr>
                                  <xsl:for-each select="command/command/request/arg">
                                    <tr>
                                      <xsl:if test="required='true'">
                                         <td class="api_reqtd1"><strong><xsl:value-of select="name"/></strong></td>
                                         <td class="api_reqtd2"><strong><xsl:value-of select="description"/></strong></td>
                                         <td class="api_reqtd3"><strong><xsl:value-of select="required"/></strong></td>
                                      </xsl:if>
                                      <xsl:if test="required='false'">
                                        <td class="api_reqtd1"><i><xsl:value-of select="name"/></i></td>
                                         <td class="api_reqtd2"><i><xsl:value-of select="description"/></i></td>
                                         <td class="api_reqtd3"><i><xsl:value-of select="required"/></i></td>
                                      </xsl:if>
                                     </tr>
                                  </xsl:for-each>
                                 </table>
                         </div>
                                
                         <div class="api_tablepanel">     
                         	<h2>Response Tags</h2>

                                <table class="api_table">
                                   <tr class="hed">
                                     <td class="api_resptd1"><strong>Response Name</strong></td>
                                     <td class="api_resptd2">Description</td>
                                   </tr>
                                  <xsl:for-each select="command/command/response/arg">
                                     <tr>
                                      <td class="api_resptd1"><strong><xsl:value-of select="name"/></strong></td>
                                      <td class="api_resptd2"><xsl:value-of select="description"/></td>
                                     <xsl:for-each select="./arguments/arg">
					<tr>
                                          <td><div class="api_resparg1td1"><strong><xsl:value-of select="name"/></strong></div></td>
                                          <td><div class="api_resptd2"><xsl:value-of select="description"/></div></td>
					</tr>
                                        <xsl:for-each select="./arguments/arg">
                                          <tr>
                                            <td><div class="api_resparg2td1"><xsl:value-of select="name"/></div></td>
                                            <td><div class="api_resptd2"><xsl:value-of select="description"/></div></td>
                                         </tr>
					</xsl:for-each>					
					</xsl:for-each>					
                                </tr>
				</xsl:for-each>
                            </table>
                        </div>
                    </div> 
                </div>
             </div>
        </div>


<div id="api_footer">
               <div id="api_footer_mainmaster">
                 <p>Adapted from Apache documentation sources, under terms of the Apache License, Version 2.0. Additional material Copyright <a href="http://www.interoute.com" target="_blank">Interoute Communications Limited</a> 2016. </p>
            </div>
        </div>




  </div>
 </div>
</body>
</html>
</xsl:template>
</xsl:stylesheet>

