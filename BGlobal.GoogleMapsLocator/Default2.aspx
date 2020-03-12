<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeFile="Default2.aspx.cs" Inherits="Default2" %>


  <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <div>
        <h1>Google maps locator</h1>             
    </div>
      <script type="text/javascript">
          debugger;
          function openWindow() {
              if (window.showModalDialog) {
                  window.showModalDialog("http://example.com", "name",
                      "dialogWidth:255px;dialogHeight:250px");
              } else {
                  window.open('Default.aspx', 'name',
                      'height=500,width=900,toolbar=no,directories=no,status=no,linemenubar=no,scrollbars=no,resizable=no ,modal=yes');
              }
          } 
     </script>
    <div>  
        <input type="button" id="show-map" value="Load map" onclick="openWindow();" /> 
    </div> 
    <br>
      <div>
          <asp:TextBox ID="Comment" TextMode="MultiLine" Columns="50" Rows="5" runat="server" ReadOnly="true"/>
      </div>
</asp:Content>


