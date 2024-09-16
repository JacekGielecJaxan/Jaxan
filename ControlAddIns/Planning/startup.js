gantt.config.date_format = "%Y-%m-%d %H:%i";
gantt.init("controlAddIn");

gantt.attachEvent("onBeforeLightbox", function(id) {
  return false;
});


function getRandomColor() {
  var letters = '0123456789ABCDEF';
  var color = '#';
  for (var i = 0; i < 6; i++) {
    color += letters[Math.floor(Math.random() * 16)];
  }
  return color;
}

gantt.attachEvent("onTaskDblClick", function(id, e){
  var timelineClick = gantt.utils.dom.closest(e.target, ".gantt_task_line");
  if (timelineClick) {
    var parent = gantt.getParent(id);
    if (parent == 0){
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("TaskClicked",[id]);
    } else
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("TaskClicked",[parent]);
    //var task = gantt.getTask(id);
    //task.color = getRandomColor()
    //gantt.updateTask(id)
  }
  return true;
});

gantt.attachEvent("onAfterTaskDrag", function(id){
  var task = gantt.getTask(id);
  Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("TaskDragged",[task, id]);
  //alert(task.text);
});

/* 
gantt.parse({
   data: [
     {id: 1, text: "Project #1", start_date: null, duration: null, parent:0, progress: 0, open: true},
     {id: 2, text: "Task #1", start_date: "2019-08-01 00:00", duration:5, parent:1, progress: 1},
     {id: 3, text: "Task #2", start_date: "2019-08-06 00:00", duration:2, parent:1, progress: 0.5},
     {id: 4, text: "Task #3", start_date: null, duration: null, parent:1, progress: 0.8, open: true},
     {id: 5, text: "Task #3.1", start_date: "2019-08-09 00:00", duration:2, parent:4, progress: 0.2},
     {id: 6, text: "Task #3.2", start_date: "2019-08-11 00:00", duration:1, parent:4, progress: 0}
   ],
   links:[
     {id:1, source:2, target:3, type:"0"},
     {id:2, source:3, target:4, type:"0"},
     {id:3, source:5, target:6, type:"0"}
   ]
 });
 */

 Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("ControlReady",[]);