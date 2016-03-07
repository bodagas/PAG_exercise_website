<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="http://maps.googleapis.com/maps/api/js"></script>
    <script type="text/javascript">

        function changeColour(value) {
            var color = document.body.style.backgroundColor;
            switch (value) {
                case 'b':
                    color = "blue";
                    break;
                case 'g':
                    color = "green";
                    break;
                case 'w':
                    color = "white";
                    break;
            }
            document.body.style.backgroundColor = color;
        }

        $(document).ready(function () {
            alert($("#sql").val());

            $("button").click(function () {
                $("#FileText").load("TextFile1.txt", function (responseTxt, statusTxt, xhr) {
                    //if (statusTxt === "success")
                    //    alert("External content loaded successfully!");
                    if (statusTxt === "error")
                        alert("Error: " + xhr.status + ": " + xhr.statusText);
                });
            });
        });

        function initialize() {
            var mapProp = {
                center: new google.maps.LatLng(32.253460, -110.911789),
                zoom: 10,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
        }
        google.maps.event.addDomListener(window, 'load', initialize);
    </script>

    <style>
        #f {
            margin: 0px auto;
        }
    </style>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <%--<div style="margin: 0px auto;">--%>
        <div>
            <table id="f">
                <tr>
                    <td>
                        <label for="radio1_green">green:</label>
                        <input type="radio" name="radio1" onchange="changeColour('g')" id="radio1_green">
                        <label for="radio1_green">blue:</label>
                        <input type="radio" name="radio1" onchange="changeColour('b')" id="radio1_blue">
                        <label for="radio1_green">white:</label>
                        <input type="radio" name="radio1" onchange="changeColour('w')" id="radio1_white" checked="checked">
                    </td>
                </tr>
            </table>

            <p style="text-align: center">
                <textarea id="sql" style="height: 200px; width: 50%">SELECT * FROM ballots WHERE userid like '%smith%' AND (system = 'Roadway' or system = 'Transit') AND rtp_id > 200 and wildcard = 0 ORDER BY system, rtp_id</textarea></p>
            <p style="text-align: center">
                <button>Retrieve Contents</button></p>
            <p style="text-align: center">
                <textarea id="FileText" style="height: 200px; width: 50%"></textarea></p>
        </div>
        <div id="googleMap" style="width: 50%; height: 380px; margin-left: auto; margin-right: auto;"></div>

    </form>
</body>
</html>
