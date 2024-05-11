<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html>
            <head>
                <style>
                    tr, th {
                        padding: 14px;          
                    }
                    .highlight-fail {
                        color: red;
                        font-weight: bold;
                    }
                    .highlight-pass{
                       color: green;
                       font-weight: bold; 
                    }
                </style>
            </head>
            <body>
                <center>
                    <h2>Student Details</h2>
                    <table border="1">
                        <tr bgcolor="grey">
                            <th>Name</th>
                            <th>Grade</th>
                        </tr>
                        <xsl:for-each select="students/student">
                            <xsl:choose>
                                <xsl:when test="grade='A' or grade='B' or grade='A+' or grade='O'">
                                    <tr class="highlight-pass">
                                        <td><xsl:value-of select="name"/></td>
                                        <td><xsl:value-of select="grade"/></td>                            
                                    </tr>
                                </xsl:when> 
                                <xsl:otherwise>
                                    <tr class="highlight-fail">
                                        <td><xsl:value-of select="name"/></td>
                                        <td><xsl:value-of select="grade"/></td>                            
                                    </tr>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                    </table>
                </center>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
