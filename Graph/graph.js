function Load(data)
{
    var tasks = JSON.stringify(data);
    gantt.parse(tasks);   
}

function SaveChanges(task)
{
    gantt.getTask(2);
    gantt.updateTask(2);
}