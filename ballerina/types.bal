// Copyright (c) 2021 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/sql;
import ballerinax/cdc;

# Represents the MSSQL Point type parameter in the `sql:ParameterizedQuery`.
#
# + x - The x coordinate of the point
# + y - The y coordinate of the point
public type Point record {
    decimal x;
    decimal y;
};

# Represents an element (LineString or Circular String) of a MSSQL Compound Curve type.
#
public type CompoundCurveElement LineStringValue | CircularStringValue;

# Represents the MSSQL circular arc ring (LineString, Circular String or Compound Curve) type.
#
public type CircularArcRing LineStringValue | CircularStringValue | CompoundCurveValue;

# Represents an element of an MSSQL Geometry Collection type.
#
public type GeometryCollectionElement PointValue | LineStringValue | CircularStringValue | CompoundCurveValue |
                                      PolygonValue | CurvePolygonValue | MultiPointValue | MultiLineStringValue |
                                      MultiPolygonValue;

# Represents the MSSQL Point type parameter in the `sql:ParameterizedQuery`.
#
# + value - Value of the parameter
# + srid - The spatial reference ID of the instance
public distinct class PointValue {
    *sql:TypedValue;
    public Point|string? value;
    public int? srid = ();
    
    public isolated function init(Point|string? value = (), int? srid = ()) {
        self.value = value;
        self.srid = srid;
    }
}

# Represents the MSSQL MultiPoint type parameter in the `sql:ParameterizedQuery`.
#
# + value - Value of the parameter
# + srid - The spatial reference ID of the instance
public distinct class MultiPointValue {
    *sql:TypedValue;
    public Point[]|string? value;
    public int? srid = ();

    public isolated function init(Point[]|string? value = (), int? srid = ()) {
        self.value = value;
        self.srid = srid;
    }
}

# Represents the MSSQL LineString type parameter in the `sql:ParameterizedQuery`.
#
# + value - Value of the parameter
# + srid - The spatial reference ID of the instance
public distinct class LineStringValue {
    *sql:TypedValue;
    public Point[]|string? value;
    public int? srid = ();

    public isolated function init(Point[]|string? value = (), int? srid = ()) {
        self.value = value;
        self.srid = srid;
    }
}

# Represents the MSSQL MultiLineString type parameter in the `sql:ParameterizedQuery`.
#
# + value - Value of the parameter
# + srid - The spatial reference ID of the instance
public distinct class MultiLineStringValue {
    *sql:TypedValue;
    public LineStringValue[]|string? value;
    public int? srid = ();

    public isolated function init(LineStringValue[]|string? value = (), int? srid = ()) {
        self.value = value;
        self.srid = srid;
    }
}

# Represents the MSSQL CircularString type parameter in the `sql:ParameterizedQuery`.
#
# + value - Value of the parameter
# + srid - The spatial reference ID of the instance
public distinct class CircularStringValue {
    *sql:TypedValue;
    public Point[]|string? value;
    public int? srid = ();

    public isolated function init(Point[]|string? value = (), int? srid = ()) {
        self.value = value;
        self.srid = srid;
    }
}

# Represents the MSSQL CompoundCurve type parameter in the `sql:ParameterizedQuery`.
#
# + value - Value of the parameter
# + srid - The spatial reference ID of the instance
public distinct class CompoundCurveValue {
    *sql:TypedValue;
    public CompoundCurveElement[]|string? value;
    public int? srid = ();

    public isolated function init(CompoundCurveElement[]|string? value = (), int? srid = ()) {
        self.value = value;
        self.srid = srid;
    }
}

# Represents the MSSQL Polygon type parameter in the `sql:ParameterizedQuery`.
#
# + value - Value of the parameter
# + srid - The spatial reference ID of the instance
public distinct class PolygonValue {
    *sql:TypedValue;
    public LineStringValue[]|string? value;
    public int? srid = ();

    public isolated function init(LineStringValue[]|string? value = (), int? srid = ()) {
        self.value = value;
        self.srid = srid;
    }
}

# Represents the MSSQL MultiPolygon type parameter in the `sql:ParameterizedQuery`.
#
# + value - Value of the parameter
# + srid - The spatial reference ID of the instance
public distinct class MultiPolygonValue {
    *sql:TypedValue;
    public PolygonValue[]|string? value;
    public int? srid = ();

    public isolated function init(PolygonValue[]|string? value = (), int? srid = ()) {
        self.value = value;
        self.srid = srid;
    }
}

# Represents the MSSQL CurvePolygon type parameter in the `sql:ParameterizedQuery`.
#
# + value - Value of the parameter
# + srid - The spatial reference ID of the instance
public distinct class CurvePolygonValue {
    *sql:TypedValue;
    public CircularArcRing[]|string? value;
    public int? srid = ();

    public isolated function init(CircularArcRing[]|string? value = (), int? srid = ()) {
        self.value = value;
        self.srid = srid;
    }
}

# Represents the MSSQL GeometryCollection type parameter in the `sql:ParameterizedQuery`.
#
# + value - Value of the parameter
# + srid - The spatial reference ID of the instance
public distinct class GeometryCollectionValue {
    *sql:TypedValue;
    public GeometryCollectionElement[]|string? value;
    public int? srid = ();

    public isolated function init(GeometryCollectionElement[]|string? value = (), int? srid = ()) {
        self.value = value;
        self.srid = srid;
    }
}

# Represents the MSSQL Money type parameter in the `sql:ParameterizedQuery`.
#
# + value - Value of the parameter
public distinct class MoneyValue {
    *sql:TypedValue;
    public decimal|float|string? value;

    public isolated function init(decimal|float|string? value = ()) {
        self.value = value;
    }  
}

# Represents the MSSQL Smallmoney type parameter in the `sql:ParameterizedQuery`.
#
# + value - Value of the parameter
public distinct class SmallMoneyValue {
    *sql:TypedValue;
    public decimal|float|string? value;

    public isolated function init(decimal|float|string? value = ()) {
        self.value = value;
    }  
}

# Represents the configuration for the MSSQL CDC listener.
#
# + database - The MSSQL database connection configuration
public type MsSqlListenerConfiguration record {|
    MsSqlDatabaseConnection database;
    *cdc:ListenerConfiguration;
|};

# Represents the configuration for the MSSQL CDC database connection.
#
# + connectorClass - The class name of the MSSQL connector implementation to use
# + hostname - The hostname of the MSSQL server
# + port - The port number of the MSSQL server
# + databaseInstance - The name of the database instance
# + databaseNames - A list of database names to capture changes from
# + includedSchemas - A list of regular expressions matching fully-qualified schema identifiers to capture changes from
# + excludedSchemas - A list of regular expressions matching fully-qualified schema identifiers to exclude from change capture
# + tasksMax - The maximum number of tasks to create for this connector. If the `databaseNames` contains more than one element, you can increase the value of this property to a number less than or equal to the number of elements in the list
public type MsSqlDatabaseConnection record {|
    *cdc:DatabaseConnection;
    string connectorClass = "io.debezium.connector.sqlserver.SqlServerConnector";
    string hostname = "localhost";
    int port = 1433;
    string databaseInstance?;
    string|string[] databaseNames;
    string|string[] includedSchemas?;
    string|string[] excludedSchemas?;
    int tasksMax = 1;
|};
