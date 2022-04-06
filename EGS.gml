<?xml version="1.0" encoding="ISO-8859-1"?>
<?xml-stylesheet type="text/xsl" href="OpenGeoSysGLI.xsl"?>

<OpenGeoSysGLI xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="http://www.opengeosys.org/images/xsd/OpenGeoSysGLI.xsd" xmlns:ogs="http://www.opengeosys.org">
    <name>EGS_geometry</name>
    <points>
          <point id="0" x="0" y="0" z="0" />
          <point id="1" x="500" y="0" z="0" />
          <point id="2" x="500" y="500" z="0" />
          <point id="3" x="0" y="500" z="0" />
          <point id="4" x="175" y="250" z="0" name="POINT_IN"/>
          <point id="5" x="325" y="250" z="0" name="POINT_OUT"/>
    </points>
    <polylines>
        <polyline id="0" name="PLY_OUTER">
            <pnt>0</pnt>
            <pnt>1</pnt>
            <pnt>2</pnt>
            <pnt>3</pnt>
            <pnt>0</pnt>
        </polyline>
    </polylines>
</OpenGeoSysGLI>