bugs = [
    {
     description: 'broken link',
     priority: 'High',
     assignee: 'Ben'   
    },
    {
     description: 'slow response time',
     priority: 'Low',
     assignee: 'Borja'   
    },
    {
     description: 'button not redirecting to correct page',
     priority: 'High',
     assignee: 'Tom'   
    },
    {
     description: 'incorrect data being displayed',
     priority: 'Medium',
     assignee: 'Steve'   
    },
    {
     description: 'mobile device design not being responsive',
     priority: 'High',
     assignee: 'Cathy'   
    },
]

bugs.each do |each_bug|
    Bug.create each_bug 
    puts "creating bug #{each_bug}"
end
