<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="Default" %>

<%@ Register Assembly="DevExpress.Web.ASPxScheduler.v15.2, Version=15.2.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxScheduler" TagPrefix="dxwschs" %>
<%@ Register Assembly="DevExpress.XtraScheduler.v15.2.Core, Version=15.2.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraScheduler" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .dxscVerticalResourceHeader {
            padding: 0px;
        }
        .dxscHorizontalResourceHeader {
            padding: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dxwschs:ASPxScheduler ID="ASPxScheduler1" runat="server" ActiveViewType="Timeline"
            OnAppointmentInserting="ASPxScheduler1_AppointmentInserting">
            <Templates>
                <VerticalResourceHeaderTemplate>
                    <div style="background-color: <%#GetResourceColor(Container)%>; width: 100px; height: <%#GetResourceHeight()%>;">
                        <%#Container.Resource.Caption%>
                    </div>
                </VerticalResourceHeaderTemplate>
                <HorizontalResourceHeaderTemplate>
                    <div style="background-color: <%#GetResourceColor(Container)%>; width: 100%; height: 50px;" >
                        <%#Container.Resource.Caption%>
                    </div>
                </HorizontalResourceHeaderTemplate>
            </Templates>
            <Views>
                <TimelineView>
                    <TimelineViewStyles>
                        <TimelineCellBody Height="200px" />
                    </TimelineViewStyles>
                </TimelineView>
            </Views>
        </dxwschs:ASPxScheduler>
    </div>
    <asp:ObjectDataSource ID="appointmentDataSource" runat="server" DataObjectTypeName="CustomEvent"
        TypeName="CustomEventDataSource" DeleteMethod="DeleteMethodHandler" SelectMethod="SelectMethodHandler"
        InsertMethod="InsertMethodHandler" UpdateMethod="UpdateMethodHandler" OnObjectCreated="appointmentsDataSource_ObjectCreated">
    </asp:ObjectDataSource>
    </form>
</body>
</html>