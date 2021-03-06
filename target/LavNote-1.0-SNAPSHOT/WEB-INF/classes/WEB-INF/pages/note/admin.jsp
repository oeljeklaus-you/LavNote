<%--
  Created by IntelliJ IDEA.
  User: youyujie
  Date: 2018/6/14
  Time: 下午8:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="container">
    <h1>Users</h1>
    <form method="POST" action="admin/users/delete" accept-charset="UTF-8"><input name="_token" type="hidden" value="z3TqkUmmBWPxsuYZSlgHk75BtGJzOabv8wZMKSOX">
        <input class="btn btn-primary" name="delete" type="submit" value="Delete Users">
        <input class="btn btn-default" name="restore" type="submit" value="Restore Users">
        <a class="btn btn-default disabled pull-right" style="pointer-events: auto" title="You need to set your registration configuration setting to 'admin'">Register Users</a>
        <table class="table">
            <tr>
                <th>ID</th>
                <th>Email address</th>
                <th>First name</th>
                <th>Last name</th>
                <th>Admin Status</th>
                <th>Created</th>
                <th>Updated</th>
                <th>Deleted</th>
                <th>&nbsp;</th>
            </tr>
            <tr>
                <td>94da662e-4c06-4188-bc48-86d40a7274c2</td>
                <td>1098181195@qq.com</td>
                <td>youyujie</td>
                <td>youyujie</td>
                <td>
                    <i class="fa fa-check"></i>
                </td>
                <td>2018-06-14 02:37:07</td>
                <td>2018-06-14 08:05:34</td>
                <td></td>
                <td><input name="selected_users[]" type="checkbox" value="94da662e-4c06-4188-bc48-86d40a7274c2">
            </tr>
            <tr>
                <td>ba5b74c6-dc26-4215-a7d8-c84eb3e84bfa</td>
                <td>2452345@qq.com</td>
                <td>youyujie</td>
                <td>youyujie</td>
                <td>
                </td>
                <td>2018-06-14 03:00:42</td>
                <td>2018-06-14 08:04:44</td>
                <td>2018-06-14 08:04:44</td>
                <td><input name="selected_users[]" type="checkbox" value="ba5b74c6-dc26-4215-a7d8-c84eb3e84bfa">
            </tr>
            <tr>
                <td>bd45ffae-1aae-4db3-bb2b-49f3bc022d1e</td>
                <td>1234124@qq.com</td>
                <td>erqer</td>
                <td>erqer</td>
                <td>
                </td>
                <td>2018-06-14 03:16:36</td>
                <td>2018-06-14 08:04:44</td>
                <td>2018-06-14 08:04:44</td>
                <td><input name="selected_users[]" type="checkbox" value="bd45ffae-1aae-4db3-bb2b-49f3bc022d1e">
            </tr>
            <tr>
                <td>f7c6604d-6195-4d39-bc9b-0ccd2a68f665</td>
                <td>fhasafksd@qq.com</td>
                <td>youyujie</td>
                <td>youyujie</td>
                <td>
                </td>
                <td>2018-06-14 08:24:56</td>
                <td>2018-06-14 08:54:28</td>
                <td></td>
                <td><input name="selected_users[]" type="checkbox" value="f7c6604d-6195-4d39-bc9b-0ccd2a68f665">
            </tr>
        </table>
    </form>
</div>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Paperwork (http://paperwork.rocks)">

    <meta name="theme-color" content="#03a9f4">
    <meta name="apple-mobile-web-app-status-bar-style" content="#03a9f4">
    <!-- <link rel="apple-touch-startup-image" href=""> -->

    <link rel="apple-touch-icon" sizes="60x60" href="images/paperwork-icons/favicon-60x60.png">
    <link rel="apple-touch-icon" sizes="76x76" href="images/paperwork-icons/favicon-76x76.png">
    <link rel="apple-touch-icon" sizes="128x128" href="images/paperwork-icons/favicon-128x128.png">

    <link rel="apple-touch-icon" sizes="152x152" href="images/paperwork-icons/favicon-152x152.png">


    <link rel="manifest" href="manifests/homescreen-manifest.json">
    <title>Paperwork</title>

    <!-- <link media="all" type="text/css" rel="stylesheet" href="css/bootstrap.min.css">
 -->
    <!-- <link media="all" type="text/css" rel="stylesheet" href="css/bootstrap-theme.min.css">
 -->

    <link media="all" type="text/css" rel="stylesheet" href="css/themes/paperwork-v1.min.css">


    <link media="all" type="text/css" rel="stylesheet" href="css/freqselector.min.css">


    <link media="all" type="text/css" rel="stylesheet" href="css/typeahead.min.css">


    <link media="all" type="text/css" rel="stylesheet" href="css/mathquill.css">


    <link media="all" type="text/css" rel="stylesheet" href="css/libs.css">


    <link media="all" type="text/css" rel="stylesheet" href="css/bootstrap-editable.css">


</head>
<body ng-app="paperworkNotes">
<div ng-controller="ConstructorController"></div>

<div class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="paperwork-logo navbar-brand transition-effect" href="/#/"
            ><img src="images/navbar-logo.png"> Paperwork</a>
        </div>
        <div class="navbar-collapse collapse">
            <div class="visible-xs">
                <form class="navbar-form" role="form">
                    <div class="form-group" ng-controller="SidebarNotebooksController">
                        <select class="form-control navbar-search" ng-model="notebookSelectedId"
                                ng-options="notebook.id as (notebook.title) for notebook in notebooks"
                                ng-change="openNotebook(notebookSelectedId,0,notebookSelectedId)">
                        </select>
                    </div>
                    <div class="form-group" ng-controller="NotesListController">
                        <select class="form-control navbar-search" ng-model="noteSelectedId.noteId"
                                ng-options="n.id as ((n.version.title || n.title)) for n in notes"
                                ng-change="openSelectedNote()">
                        </select>
                    </div>
                </form>
            </div>

            <ul class="nav navbar-nav animate-panel" ng-cloak ng-show="navbarMainMenu">
                <li class="dropdown">
                    <a id="menu-item-file" href="" class="dropdown-toggle transition-effect" data-toggle="dropdown">File <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li ng-controller="SidebarNotesController" class="{{ menuItemNotebookClass() }}">
                            <a id="menu-item-file-sub-new_note" href="" ng-click="newNote(getNotebookSelectedId())"><i class="fa fa-file"></i> New note</a>
                        </li>
                        <li ng-controller="SidebarNotebooksController">
                            <a id="menu-item-file-sub-new_notebook" href="" ng-click="modalNewNotebook()"><i class="fa fa-book"></i> New notebook</a>
                        </li>
                        <li ng-controller="SidebarNotebooksController">
                            <a id="menu-item-file-sub-new_collection" href="" ng-click="modalNewCollection()"><i class="fa fa-folder"></i> New collection</a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a id="menu-item-edit" href="" class="dropdown-toggle transition-effect" data-toggle="dropdown">Edit <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li ng-controller="SidebarNotesController" class="{{ menuItemNoteClass('single') }}">
                            <a id="menu-item-edit-sub-edit_note" href="" ng-click="editNote(getNotebookSelectedId(), (getNoteSelectedId(true).noteId))"><i class="fa fa-pencil"></i> Edit note</a>
                        </li>
                        <li ng-controller="SidebarNotesController" class="{{ menuItemNoteClass('multiple') }}">
                            <a id="menu-item-edit-sub-edit_notes" href="" ng-click="editNotes(getNotebookSelectedId())"><i class="fa fa-files-o"></i> <span ng-hide="editMultipleNotes">Edit multiple notes...</span><span ng-show="editMultipleNotes">Stop editing multiple notes</span></a>
                        </li>
                        <li ng-controller="SidebarNotesController" class="{{ menuItemNoteClass('multiple') }}">
                            <a id="menu-item-edit-sub-move_note" href="" ng-click="modalMoveNote(getNotebookSelectedId(), (getNoteSelectedId(true)).noteId)"><i class="fa fa-arrow-right"></i> <span ng-hide="editMultipleNotes">Move note</span><span ng-show="editMultipleNotes">Move notes</span></a>
                        </li>
                        <li ng-controller="SidebarNotesController" class="{{ menuItemNoteClass('multiple') }}">
                            <a id="menu-item-edit-sub-share_note" href="" ng-click="modalShareNote(getNotebookSelectedId(), (getNoteSelectedId(true)).noteId)"><i class="fa fa-share-alt"></i> <span ng-hide="editMultipleNotes">Share note</span><span ng-show="editMultipleNotes">Share notes</span></a>
                        </li>
                        <li ng-controller="SidebarNotesController" class="{{ menuItemNoteClass('multiple') }}">
                            <a id="menu-item-edit-sub-delete_note" href="" ng-click="modalDeleteNote(getNotebookSelectedId(), (getNoteSelectedId(true)).noteId)"><i class="fa fa-trash-o"></i> <span ng-hide="editMultipleNotes">Delete note</span><span ng-show="editMultipleNotes">Delete notes</span></a>
                        </li>
                        <li class="divider"></li>
                        <li ng-controller="SidebarNotebooksController" class="{{ menuItemNotebookClass() }}">
                            <a id="menu-item-edit-sub-edit_notebook" href="" ng-click="modalEditNotebook(getNotebookSelectedId())"><i class="fa fa-pencil"></i> Edit notebook</a>
                        </li>
                        <li ng-controller="SidebarNotebooksController" class="{{ menuItemNotebookClass() }}">
                            <a id="menu-item-edit-sub-share_notebook" href="" ng-click="modalShareNotebook(getNotebookSelectedId())"><i class="fa fa-share-alt"></i> Share notebook</a>
                        </li>
                        <li ng-controller="SidebarNotebooksController" class="{{ menuItemNotebookClass() }}">
                            <a id="menu-item-edit-sub-delete_notebook" href="" ng-click="modalDeleteNotebook(getNotebookSelectedId())"><i class="fa fa-trash-o"></i> Delete notebook</a>
                        </li>
                    </ul>
                </li>
            </ul>

            <form ng-controller="SidebarNotesController" ng-cloak ng-show="navbarSearchForm" class="navbar-form navbar-left animate-panel" id="searchForm" role="form" ng-submit="submitSearch()">
                <div class="form-group">
                    <input type="text" class="form-control navbar-search" placeholder="Search..." ng-model="search">
                </div>
            </form>

            <ul class="nav navbar-nav navbar-right">
                <!-- Show hover titles for small and medium screens -->
                <li class="hidden-xs hidden-lg" title="Library">
                    <a href="http://paperwork#/" class="transition-effect">
                        <i class="fa fa-book"></i>
                    </a>
                </li>

                <!-- Show actual titles for large and extra small screens -->
                <li class="hidden-sm hidden-md">
                    <a href="http://paperwork#/" class="transition-effect">
                        <i class="fa fa-book"></i>
                        <span>
			Library
		</span>
                    </a>
                </li>

                <!-- Show hover titles for small and medium screens -->
                <li class="hidden-xs hidden-lg" title="Profile">
                    <a href="profile" class="transition-effect">
                        <i class="fa fa-user"></i>
                    </a>
                </li>

                <!-- Show actual titles for large and extra small screens -->
                <li class="hidden-sm hidden-md">
                    <a href="profile" class="transition-effect">
                        <i class="fa fa-user"></i>
                        <span>
			Profile
		</span>
                    </a>
                </li>

                <!-- Show hover titles for small and medium screens -->
                <li class="hidden-xs hidden-lg" title="Settings">
                    <a href="settings" class="transition-effect">
                        <i class="fa fa-cog"></i>
                    </a>
                </li>

                <!-- Show actual titles for large and extra small screens -->
                <li class="hidden-sm hidden-md">
                    <a href="settings" class="transition-effect">
                        <i class="fa fa-cog"></i>
                        <span>
			Settings
		</span>
                    </a>
                </li>

                <!-- Show hover titles for small and medium screens -->
                <li class="hidden-xs hidden-lg" title="Admin Area">
                    <a href="admin" class="transition-effect">
                        <i class="fa fa-star"></i>
                    </a>
                </li>

                <!-- Show actual titles for large and extra small screens -->
                <li class="hidden-sm hidden-md">
                    <a href="admin" class="transition-effect">
                        <i class="fa fa-star"></i>
                        <span>
			Admin Area
		</span>
                    </a>
                </li>

                <!-- Show hover titles for small and medium screens -->
                <li class="hidden-xs hidden-lg" title="Help">
                    <a href="help" class="transition-effect">
                        <i class="fa fa-question"></i>
                    </a>
                </li>

                <!-- Show actual titles for large and extra small screens -->
                <li class="hidden-sm hidden-md">
                    <a href="help" class="transition-effect">
                        <i class="fa fa-question"></i>
                        <span>
			Help
		</span>
                    </a>
                </li>
                <!-- Show hover titles for small and medium screens -->
                <li class="hidden-xs hidden-lg" title="Sign out">
                    <a href="logout" class="transition-effect">
                        <i class="fa fa-sign-out"></i>
                    </a>
                </li>

                <!-- Show actual titles for large and extra small screens -->
                <li class="hidden-sm hidden-md">
                    <a href="logout" class="transition-effect">
                        <i class="fa fa-sign-out"></i>
                        <span>
			Sign out
		</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>


<div class="container-fluid">
    <div class="footer footer-issue " ondblclick="$(this).hide()">
        <div class="error-reporting">
            <div class="alert alert-warning" role="alert">
                <p>Found a bug? Paperwork cannot connect to Github to check the latest version. A solution to this can be installling the curl PHP extension. This is not mandatory, however before reporting any issues, please make sure that you are using the latest version.  </p>
                <p>Double click to dismiss.
            </div>
        </div>
    </div>
</div>

<script src="js/jquery.min.js"></script>


<script src="ckeditor/plugins/codesnippet/lib/highlight/highlight.pack.js"></script>

<script src="js/angular.min.js"></script>


<script src="js/paperwork.min.js"></script>

<script src="js/paperwork-native.min.js"></script>


<script src="js/bootstrap.min.js"></script>

<script src="js/tagsinput.min.js"></script>

<script src="js/libraries.min.js"></script>


<script src="ckeditor/ckeditor.js"></script>



<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
<script src="js/ltie9compat.min.js"></script>

<![endif]-->
<!--[if lt IE 11]>
<script src="js/ltie11compat.js"></script>

<![endif]-->

</body>
</html>

