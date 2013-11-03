/**
*	Mobile Interfaces and Useabiliy project 02
*	By: Deus Duke
*	Term:  1304
**/

var editMode = false;
var currentProject = null;

/*jshint multistr: true */
var nav =  " \
<nav> \n\
	<ul> \n\
		<li><a href='#'>Internal</a></li> \n\
		<li><a href='#'>External</a></li> \n\
		<li><a href='#'>Personal</a></li> \n\
		<li><a href='#'>High Priority</a></li> \n\
		<li><a href='#'>All</a></li> \n\
	</ul> \n\
</nav>\n";

var projectListItemHtml = " \
<li class='project_list_item' data-project-id='{1}' data-icon='arrow-r'> \n\
	<a href='#pgProjectAdd' data-project-id='{1}'>{0}</a> \n\
</li>\n";

var projectItemHtml = " \
<div class='project_page_item' data-project-id='{1}'> \n\
	<h3>{0}</h3> \n\
	<img width='50' src='images/icon-{2}.png'/> \n\
	<p>Start Date: {1}</p> \n\
	<p>Type: {2}</p> \n\
	<p>Priority: {3}</p> \n\
	<p>Details:</p> \n\
	<p>{5}</p> \n\
	<br/> \n\
	<a href='#' onclick='deleteProject({4})'>Delete Project</a> \n\
</div>\n";

var categoryHtml = " \
	<li data-role='list-divider'>{0}</li>"

// utility function to create formatted string similar to .Net
String.prototype.format = function() {
	str = this;
	var oldStr = "";

	for (var i in arguments) {
		// loop so that we can support multiple same numbers
		do{
			oldStr = str;
			str = str.replace('{' + i.toString() + '}', arguments[i]);

		} while (str != oldStr);
		++i;
	}

	return str;
};

function isBlank(str) {
    return (!str || /^\s*$/.test(str));
}

// hide the message
function hideMessage() {
	// hide message so that user doesn't think that the project
	// was saved when it wasn't
	$('#msg').addClass('hide');
}

// show the message
function showMessage(msg) {
	$('#msg').removeClass('hide').html(msg);
}

/**
 * Validations fields, if and error if found and alert
 * is displdyed
 * @return {bool} true if valid, otherwise false
 */
function validateFields()
{
	hideMessage();

	var itxName = $('#name');
	var idStartDate = $('#startdate');
	var idType = $('input[type=radio]:checked');

	var errormsg = "";

	if (isBlank(itxName.val()))
	{
		errormsg += ('You must enter a project name\n');
		$('label[for=name]').addClass('red');
	}
	else {
		$('label[for=name]').removeClass('red');
	}

	if (isBlank(idStartDate.val()))
	{
		errormsg += ('You must enter a start date\n');
		$('label[for=startdate]').addClass('red');
	}
	else {
		$('label[for=startdate]').removeClass('red');
	}

	if (!idType || isBlank(idType.val()))
	{
		errormsg += ('You must select a project type\n');
		$('#typeHeader').addClass('red');
	}
	else {
		$('#typeHeader').removeClass('red');
	}

	if (errormsg.length > 0) {
		alert(errormsg);
		return false;
	}

	// at this point, all information is valid
	return true;
}

/**
 * Create a project and store it to the client */
function createProject()
{
	// validate all fields, if information is missing or
	// incorrect return
	if (!validateFields()) return false;

	// build the project objet
	var project = {};

	// if we have a current project, the use it
	if (editMode && currentProject != null)
		project = currentProject;

	project.name = $('#name').val();
	project.startDate = $('startdate').val();

	project.type = $('input[type=radio]:checked').val();

	project.priority = $('#priority').val();

	project.details = $('#details').val();

	// store the date
	storeProject(project);

	// show all data
	showAllProjects(true);

	// show confirmation message
	var msg = "";
	if (editMode)
		msg = "Your project has been edited!";
	else
		msg = "Your project has been created!";

	showMessage(msg);


	return true;
}

// send the project to local storage
function storeProject(project) {
	// give the project an id
	if (project.id == null)
	{
		project.id = new Date().getTime();
	}

	// convert to JSON and store in the database
	data = JSON.stringify(project);

	console.log(data);

	// use timestamp to make unique
	localStorage.setItem(project.id, data);
}

// retrieve all of our projects from local storage
function retrieveProjects() {
	var projects = [];

	// get all the data back out and convert back to projects
	for (var i = 0; i < localStorage.length; i++){
		var json = localStorage.getItem(localStorage.key(i));
		projects[i] = eval('({0})'.format(json));
	}

	return projects;
}

// retrieve one project from local storage
function retrieveProject(id) {
	var json = localStorage.getItem(id);
	var project = eval('({0})'.format(json));

	return project;
}

// hide form and show the project list
function showAllProjects(force){
	hideMessage();

	// if we are already viewing all projects, return
	if (!force && $('#projectList').hasClass('hide')) return;

	// if we don't have any projects to show, fill with default data
	if (localStorage.length === 0) {
		alert("Filling with default data");
		fillWithDefaultData();
	}

	projects = retrieveProjects();
	cats = {};  // used to separate into categories

	// add the project items to the list by type
	var projectListHtml = "";
	for(var i in projects) {
		var project = projects[i];

		// only show projects in the selected category
		if ($('#browse a.ui-btn-active>span>span').text() != 'All') {
			if (project.type.toLowerCase() != $('#browse a.ui-btn-active>span>span').text().toLowerCase())
				continue;
		}

		if (!cats[project.type]) {
			cats[project.type] = categoryHtml.format(project.type);
		}



		var projectAsHtml = projectListItemHtml.format(
										project.name,
										project.id,
										project.type);
		cats[project.type] += ('\n' + projectAsHtml);
	}

	console.log(cats);

	// now build the final list
	for(var k in cats) {
		projectListHtml += ('\n' + cats[k]);
	}

	// finally we need to insert into the page
	$("#projectList").html(projectListHtml);

	// refresh the list view now that we have broken it
	if (force){
		setTimeout(
		  function() {
			$('#projectList').listview();
		    $("#projectList").listview('refresh');
		    $('.project_list_item a').click(projectListItemClick);
		  }, 
		  100);
	}
}

// clear all stored data
function clearAllProjects(){
	localStorage.clear();

	alert("All projects have been removed");

	document.getElementById("projectList").innerHTML = '';
}

// get the value from an array of radiout button
function getValueFromRadioButtons(arrRadioButtons) {
	for(var i in arrRadioButtons) {
		var rb = arrRadioButtons[i];

		if (rb.checked) return rb.value;
	}

	// nothing was checked
	return null;
}

// edit a project
function editProject(id)
{
	resetForm();
	currentProject = retrieveProject(id);

	// restore project data
	$('#name').val(currentProject.name);
	$('#startdate').val(currentProject.startDate);
	$('#priority').val(currentProject.priority).slider('refresh');
	$('#' + currentProject.type.toLowerCase()).checked=true;
	$('#details').val(currentProject.details);

	editMode = true;
}

// delete a project
function deleteProject(id)
{
	var answer = confirm("Are you sure you want to delete this project?");

	if (answer){
		console.log(id);

		localStorage.removeItem(id);

		console.log(id);
		console.log('li[data-project-id={0}]'.format(id));

		$('li[data-project-id={0}]'.format(id)).remove();
	}
}

// fill with default data
function fillWithDefaultData() {
	var defaultData = json;

	// loop through data and add projects to local
	// storage
	for (var key in json) {
		if (key == null) continue;
		var p = json[key];
		var data = JSON.stringify(json[key]);
		console.log(data);
		localStorage.setItem(p.id, data);
	}
}

function resetForm(){
	$('#name').val('');
	var temp = new Date();

	var month = temp.getMonth().toString();
	month = month.length == 1 ? "0" + month : month;

	var day = temp.getDate().toString();
	day = day.length == 1 ? "0" + day : day;

	$('#startdate').val("{0}-{1}-{2}".format(temp.getFullYear(), month, day));
	$('input[type=radio]').attr('checked', false);
	try {
		$('input[value=internal]').attr('checked', true).checkboxradio('refresh');
	}
	catch (e) {

	}
	$('#radioControlGroup').controlgroup();

	try {	
		$('#priority').val(3).slider('refresh');
	}
	catch (e) {

	}

	$('#details').val('');

	// remove any attributes
	$('label[for=name]').removeClass('red');
	$('label[for=startdate]').removeClass('red');
	$('#typeHeader').removeClass('red');
}

function initProjectList() {
	// if we don't have any project, show the add project button and hide the search
	if (localStorage.length == 0) {
		$('#projectList').addClass("hide");
		$('form[role=search]').addClass("hide");
		$('#btnAddDefaultProjects').removeClass("hide");
		$('#browse').addClass('hide');
	}

	// we have projects so display them
	else {
		$('#projectList').removeClass("hide");
		$('form[role=search]').removeClass("hide");
		$('#btnAddDefaultProjects').addClass("hide");
		$('#browse').removeClass('hide');
	}
}

$(document).ready(function () {
	// restore projects if any exist
	if (localStorage.length > 0) {
		var listView = $('#projectList');
		$('div.ui-input-search').addClass('hide');

		showAllProjects(true);
	}

	else {
		$('#btnAddDefaultProjects').removeClass('hide');
	}

	$('div[data-role=navbar] a').click(function(){
		if (!$(this).hasClass('ui-btn-active')){
			showAllProjects(true);
		}
	});

	// clear form on re-entry from navbar
	$('div[data-role=navbar] a[href=#pgProjectAdd]').click(function(){
		if (!$(this).hasClass('ui-btn-active')){
			// wipe data when user comes to this screen
			resetForm();

			// set button back to create project
			$('#btnCreateProject .ui-btn-text').text('Create Project');

			editMode = false;
			$('#btnDeleteProject').addClass('hide');
		}

		$('#msg').addClass('hide');
	})

	$('#pgProjectAdd').on('pageinit', function(){
		// call so that it will work on the next attempt
		try {	
			resetForm();
		}
		catch (e) {

		}
	})

	// change button to edit on list item click	
	$('.project_list_item a').click(projectListItemClick);

	// save or create project
	$('#btnCreateProject').click(function() {
		if (createProject())
			$.mobile.changePage('#pgProjects');
	});

	// add the default project
	$('#btnAddDefaultProjects').click(function() {
		showAllProjects(true);
	});

	$('#browse').click(function() {
		setTimeout(
			function() {
				showAllProjects(true);
			}, 
		  100);
	});

	$( '#pgProjects' ).on( 'pagebeforeshow',function(event, ui){
		initProjectList();
	});

	initProjectList();
});

function projectListItemClick() {

	// exit if we dont have an id as this is not a project
	if (!$(this).attr('data-project-id')) return;

	// show details if not shown already
	if (!$(this).parent().hasClass('project_details')) {
		$(this).addClass('project_details');
		var project = retrieveProject($(this).attr('data-project-id'));

		$(this).html(projectItemHtml.format(
									project.name,
									project.startDate,
									project.type,
									project.priority,
									project.id,
									project.details));


		$(this).parent().addClass('project_details');

		return false;
	}

	
	$('#btnCreateProject .ui-btn-text').text('Save Changes');
	editProject($(this).attr('data-project-id'));

	editMode = true;

	$('#msg').addClass('hide');
}