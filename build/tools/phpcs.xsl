<?xml version="1.0" encoding="UTF-8"?>
 
<!--
    Document   : phpcs.xsl
    Created on : December 27, 2010, 1:42 PM
    Author     : schkovich
    Description:
        Transformation PHP_CodeSniffer xml report into human readable format.
-->
 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"  encoding="UTF-8"/>
 
    <!-- TODO customize transformation rules
         syntax recommendation http://www.w3.org/TR/xslt
    -->
    <xsl:template match="/">
        <html>
            <head>
                <title>phpcs.xsl</title>				
                <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.2.0/css/bootstrap-combined.min.css" rel="stylesheet"/>
                <style>
                    table {
                    width: 100%
                    }
                    th {
                    text-align: left
                    }
                    th.file {
                    width: 80%;
                    color: green
                    }
                    th.notes {
                    width: 10%;
                    color: blue
                    }
                    span {
                    font-weight: bold;
                    display:block;
                    }
                    span.error {
                    color: red
                    }
                    span.warning {
                    color: orange
                    }
                </style>
            </head>
            <body>
                <div class="container">
                    <center>
                        <h1>PHP CheckStyle</h1>
                    </center>
                    <xsl:for-each select="checkstyle/file">
                        <div class="row">
                            <div class="col-md-12">
                                <table>
                                    <thead>
                                        <tr>
                                            <th class="file">
                                                <h3>Arquivo:</h3>
                                            </th>                            
                                        </tr>
                                    </thead>
                                    <tbody>                        
                                        <tr>
                                            <td>
                                    
                                            </td>                              
                                        </tr>
                                        <tr>
                                            <td>
                                                <p>
                                                    <b>
                                                        <xsl:value-of select="@name" />
                                                    </b>
                                                </p>
                                                <xsl:for-each select="error">                                        
                                                    <xsl:if test="@severity='error'">
                                                        <p>										
                                                            <span class="error">
                                                                <b>
                                                                    <xsl:value-of select="@severity"/>
                                                                </b>: 
                                                            </span>
                                                            <xsl:value-of select="@message"/>
                                                        </p>
                                                        <p>
                                                            <b>Linha: </b>
                                                            <xsl:value-of select="@line" />
                                                        </p>
                                                        <p>
                                                            <b>Coluna: </b>
                                                            <xsl:value-of select="@column" />
                                                        </p>                                        
                                                        <hr />
                                                    </xsl:if>
                                                    <xsl:if test="@severity='warning'">
                                                        <p>										
                                                            <span class="warning">
                                                                <b>
                                                                    <xsl:value-of select="@severity"/>
                                                                </b>: 
                                                            </span>
                                                            <xsl:value-of select="@message"/>
                                                        </p>
                                                        <p>
                                                            <b>Linha: </b>
                                                            <xsl:value-of select="@line" />
                                                        </p>
                                                        <p>
                                                            <b>Coluna: </b>
                                                            <xsl:value-of select="@column" />
                                                        </p>                                        
                                                        <hr />
                                                    </xsl:if>
                                                </xsl:for-each>                                    
                                            </td>
                                        </tr>
                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </xsl:for-each>
                </div>
            </body>
        </html>
    </xsl:template>
 
</xsl:stylesheet>