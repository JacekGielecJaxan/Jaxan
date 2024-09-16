function Load(data)
{
    var tasks = JSON.stringify(data);
    gantt.parse(tasks);   
}