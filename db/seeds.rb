bugs = [
    {
     description: 'broken link',
     prority: 'High',
     assignee: 'Ben'   
    },
    {
     description: 'slow response time',
     prority: 'Low',
     assignee: 'Borja'   
    },
    {
     description: 'button not redirecting to correct page',
     prority: 'High',
     assignee: 'Tom'   
    },
    {
     description: 'incorrect data being displayed',
     prority: 'Medium',
     assignee: 'Steve'   
    },
    {
     description: 'mobile device design not being responsive',
     prority: 'High',
     assignee: 'Cathy'   
    },
]

bugs.each do |each_bug|
    Bug.create each_bug 
    puts "creating bug #{each_bug}"
end
