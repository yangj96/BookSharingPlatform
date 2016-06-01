﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Administer/Administer.master" AutoEventWireup="true" CodeFile="Administer_ForumList.aspx.cs" Inherits="Administer_Administer_ForumList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="content">   
                <div class="page-header">
                    <div class="icon">
                        <span class="ico-arrow-right"></span>
                    </div>
                    <h1>论坛</h1>
                </div>
                
                <div class="block">
                            <div class="head blue">
                                <div class="icon"><span class="ico-user"></span></div>
                                <h2>论坛列表</h2>                                                             
                            </div>              
                            <div class="data-fluid" align="right">
                                <button id="DAL" runat="Server" onserverclick="DAL_onclick" class="btn btn-danger">批量删除<span class="ico-comments"></span></button>
                                <br \>
                            </div>  
                            <div class="data-fluid">
                                  <asp:GridView ID="GridView1" runat="server" cellpadding="0" width="100%" 
                                    class="table table-hover" AutoGenerateColumns="False" DataKeyNames="UserID,ForumID"
                                    DataSourceID="SqlDataSource1" OnRowCommand="GridView1_RowCommand"
                                    GridLines="None" AllowPaging="True" 
                                    >
                                    <Columns>
                                        
                                        <asp:BoundField DataField="UserID" HeaderText="UserID" 
                                            SortExpression="UserID" ReadOnly="True" >
                                        </asp:BoundField>

                                        <asp:BoundField DataField="Password" HeaderText="Password" 
                                            SortExpression="Password" >
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
                                        <asp:BoundField DataField="ForumID" HeaderText="ForumID" InsertVisible="False" ReadOnly="True" SortExpression="ForumID" />
                                        <asp:BoundField DataField="Theme" HeaderText="Theme" SortExpression="Theme" />
                                        <asp:BoundField DataField="UserID1" HeaderText="UserID1" SortExpression="UserID1" />
                                        <asp:BoundField DataField="DateTime" HeaderText="DateTime" SortExpression="DateTime" />
                                        <asp:BoundField DataField="QuanZiID1" HeaderText="QuanZiID1" SortExpression="QuanZiID1" />

                                    </Columns>
                                    <PagerSettings Mode="NumericFirstLast" />
                                    <PagerTemplate>
         <br />
         <div class="span10">
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
           SelectCommand="SELECT * From [User],[Forum] WHERE [User].[UserID] = [Forum].[UserID]">
        </asp:SqlDataSource>
                            </div> 
                        
                        </div> 
                
            </div>


</asp:Content>

