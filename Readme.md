# How to fill resource headers with a specific colors


<p>This example illustrates how to fill the entire resource headers area with a specific color (the actual colors in this example are obtained from the <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxSchedulerASPxScheduler_ResourceColorSchemastopic"><u>ASPxScheduler.ResourceColorSchemas</u></a> collection). The key point is to override the <strong>VerticalResourceHeaderTemplate</strong> and <strong>HorizontalResourceHeaderTemplate</strong> for resource headers as follows:</p>

```aspx
        <dxwschs:ASPxScheduler ID="ASPxScheduler1" runat="server" ...><newline/>            <Templates><newline/>                <VerticalResourceHeaderTemplate><newline/>                    <div style="background-color: <%# GetResourceColor(Container) %>; width: 100px; height: <%# GetResourceHeight() %>;"><newline/>                        <%# Container.Resource.Caption %><newline/>                    </div><newline/>                </VerticalResourceHeaderTemplate><newline/>                <HorizontalResourceHeaderTemplate><newline/>                    <div style="background-color: <%# GetResourceColor(Container) %>; width: 100%; height: 50px;" ><newline/>                        <%# Container.Resource.Caption %><newline/>                    </div><newline/>                </HorizontalResourceHeaderTemplate><newline/>            </Templates><newline/>        </dxwschs:ASPxScheduler>
```

<p> </p><p>where <strong>GetResourceColor</strong> and <strong>GetResourceHeight</strong> methods are defined in the Default.aspx.cs code-behind file as follows:</p>

```cs
    public string GetResourceColor(ResourceHeaderTemplateContainer container) {<newline/>        int id = ASPxScheduler1.Storage.Resources.Items.IndexOf(container.Resource);
<newline/>        return ColorTranslator.ToHtml(ASPxScheduler1.ResourceColorSchemas[id % ASPxScheduler1.ResourceColorSchemas.Count].Cell);<newline/>    }
<newline/>    public string GetResourceHeight() {<newline/>        return ASPxScheduler1.TimelineView.Styles.TimelineCellBody.Height.ToString();<newline/>    }
```

<p> </p><p>The ASPxScheduler.TimelineView.Styles.TimelineCellBody.Height attribute value should be specified explicitely:</p>

```aspx
        <dxwschs:ASPxScheduler ID="ASPxScheduler1" runat="server" ...><newline/>            <Views><newline/>                <TimelineView><newline/>                    <TimelineViewStyles><newline/>                        <TimelineCellBody Height="200px" /><newline/>                    </TimelineViewStyles><newline/>                </TimelineView><newline/>            </Views><newline/>        </dxwschs:ASPxScheduler>
```

<p> </p><p>Also, use the following CSS styles to remove padding of the resource headers content:</p>

```css
        .dxscVerticalResourceHeader {<newline/>            padding: 0px;<newline/>        }<newline/>        .dxscHorizontalResourceHeader {<newline/>            padding: 0px;<newline/>        }
```

<p> </p><p><strong>See Also:</strong><br />
<a href="http://demos.devexpress.com/ASPxSchedulerDemos/Templates/ResourceHeaderTemplate.aspx"><u>Templates - Resource Headers</u></a></p>

<br/>


