<%@ Page Title="" Language="C#" MasterPageFile="~/PersonalWeb_other/个人页面_other.master" AutoEventWireup="true" CodeFile="MessageBox_other.aspx.cs" Inherits="PersonalWeb_other_MessageBox_other" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content">
                
                <div class="page-header">
                    <div class="icon">
                        <span class="ico-window"></span>
                    </div>
                    <h1>留言通讯</h1>
                </div>
                
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                <div class="row-fluid typography">
                     <div><br \></div>

                    <div class="block">
                            <div class="head orange">
                                <div class="icon"><span class="ico-pen-2"></span></div>                              
                                <h2>撰写留言</h2>                   
                            </div>
                           <div class="data-fluid editor">

                                <asp:TextBox ID="reply" runat="server" width="100%" Height="80px" 
                                TextMode="MultiLine" BackColor="White" BorderStyle="NotSet" ForeColor="Black"></asp:TextBox>
                                <!--<asp:TextBox ID="content" runat="server" style="height: 300px;" 
                                    TextMode="MultiLine" Width="1060px"></asp:TextBox>-->
                            <div><br \></div>
                            </div>
                        <div align="center"><button id="submit" runat="server" onserverclick="Submit_onclick" class="btn btn-info" type="button"><font size="3">发表留言<span class="ico-pencil"></span></button></div>
                        </div> 
                    <div><br \><br \></div> 
                     <div class="block">
                            <div class="head green">
                                <div class="icon"><span class="ico-pen-2"></span></div>
                                <h2>留言列表</h2>                             
                            </div>                
                            <div class="data-fluid">
                                <br />
                                <<asp:GridView ID="GridView1" runat="server" cellpadding="0" width="100%" 
                                    class="table table-hover" AutoGenerateColumns="False" DataKeyNames="UserID,LeaveMessageID"
                                    DataSourceID="SqlDataSource1" OnRowCommand="GridView1_RowCommand"
                                    GridLines="None" AllowPaging="True" PageSize="5">
                                    <Columns>

                                        <asp:BoundField DataField="UserID" HeaderText="UserID" 
                                            SortExpression="UserID" ReadOnly="True" >
                                        </asp:BoundField>
                                       
                                        <asp:BoundField DataField="Password" HeaderText="Password" 
                                            SortExpression="Password">
                                        </asp:BoundField>
                                      
                                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                        <asp:BoundField DataField="Sex" HeaderText="Sex" SortExpression="Sex" />
                                        <asp:BoundField DataField="UserImagePath" HeaderText="UserImagePath" SortExpression="UserImagePath" />
                                        <asp:BoundField DataField="Birthday" HeaderText="Birthday" SortExpression="Birthday" />
                                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                        <asp:BoundField DataField="BriefIntroduction" HeaderText="BriefIntroduction" SortExpression="BriefIntroduction" />
                                        <asp:BoundField DataField="Identity" HeaderText="Identity" SortExpression="Identity" />
                                        <asp:BoundField DataField="QuanZiID" HeaderText="QuanZiID" SortExpression="QuanZiID" />
                                        <asp:BoundField DataField="Signature" HeaderText="Signature" SortExpression="Signature" />
                                        <asp:BoundField DataField="SecurityQ" HeaderText="SecurityQ" SortExpression="SecurityQ" />
                                        <asp:BoundField DataField="SecurityA" HeaderText="SecurityA" SortExpression="SecurityA" />
                                        <asp:BoundField DataField="FavBookCate" HeaderText="FavBookCate" SortExpression="FavBookCate" />
                                        <asp:BoundField DataField="Grade" HeaderText="Grade" SortExpression="Grade" />
                                        <asp:BoundField DataField="LeaveMessageID" HeaderText="LeaveMessageID" InsertVisible="False" ReadOnly="True" SortExpression="LeaveMessageID" />
                                        <asp:BoundField DataField="UserID1" HeaderText="UserID1" SortExpression="UserID1" />
                                        <asp:BoundField DataField="HostID" HeaderText="HostID" SortExpression="HostID" />
                                        <asp:BoundField DataField="Content" HeaderText="Content" SortExpression="Content" />
                                        <asp:BoundField DataField="DateTime" HeaderText="DateTime" SortExpression="DateTime" />
           
                                    </Columns>
                                    <PagerSettings Mode="NumericFirstLast" />
                                    <PagerTemplate>
         <br />
         <div class="span10" align="right">
         <div class="block">
         <asp:Label ID="lblPage" runat="server" CssClass="class3" Text='<%# "第" + (((GridView)Container.NamingContainer).PageIndex + 1)  + "页/共" + (((GridView)Container.NamingContainer).PageCount) + "页" %> '></asp:Label>
         <asp:LinkButton ID="lbnFirst" runat="Server" Text="首页"  Enabled='<%# ((GridView)Container.NamingContainer).PageIndex != 0 %>' CommandName="Page" CommandArgument="First" ></asp:LinkButton>
        <asp:LinkButton ID="lbnPrev" runat="server" Text="上一页" Enabled='<%# ((GridView)Container.NamingContainer).PageIndex != 0 %>' CommandName="Page" CommandArgument="Prev"  ></asp:LinkButton>
        <asp:LinkButton ID="lbnNext" runat="Server" Text="下一页" Enabled='<%# ((GridView)Container.NamingContainer).PageIndex != (((GridView)Container.NamingContainer).PageCount - 1) %>' CommandName="Page" CommandArgument="Next" ></asp:LinkButton>
         <asp:LinkButton ID="lbnLast" runat="Server" Text="尾页" Enabled='<%# ((GridView)Container.NamingContainer).PageIndex != (((GridView)Container.NamingContainer).PageCount - 1) %>' CommandName="Page" CommandArgument="Last" ></asp:LinkButton>
         到第
         
         <asp:TextBox runat="server" ID="inPageNum" CssClass="class2" Width="10%"></asp:TextBox>
         页<asp:Button ID="Button1" Text="Go" CssClass="btn" CommandName="go" runat="server" />
         </div>
         </div>
         </div>
         <br />
     </PagerTemplate>
     </asp:GridView>
       <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:BookSharingConnectionString %>" 
           SelectCommand="SELECT * FROM [User], [LeaveMessage] WHERE [User].[UserID] = [LeaveMessage].[UserID]
                          AND [LeaveMessage].[HostID] = @UserID">
           <SelectParameters>
        <asp:SessionParameter Name="UserID" SessionField="HostID" Type="String" />
         </SelectParameters>
        </asp:SqlDataSource>
         </ContentTemplate>
         </asp:UpdatePanel>
     <br />
                                      
                        </div>           

                </div>                  
                
            </div>
            
        </div>
    <script>

        var ckeditor = CKEDITOR.replace('ckeditor');

        CKEDITOR.disableAutoInline = true;
        CKEDITOR.inline('editable');

    </script>                            
</asp:Content>

