
# Planning Visualisation - Animation Profile Instruction

This document shows the syntax for animation profile, the animation profile is written in Json.

## Main Structure
The anmation profile contains three main field: objects, shape, predicates_rules.

**objects**: Defining which shape to represent the objects.

**shape**: Define the attributes of each shapes.

**predicates_rules**: Define the animation rules for each predicates.

The syntax of main structure:
```
{
"objects":{...},
"shape":{...},
"predicates_rules":{...}
}
```
## Objects
The value of objects contains three parts:default,predefine, and customobj.

**default**: Defining the default shape to represent the objects. If an object is not contained in predefine filed, the default shape will be choosen to represent the object.  

**predefine**: Defining which shape to prepresent which objects.

**customobj**: Defining the shape of objects which is **not** include in the problem pddl. Eg. The table and claw could be the custom object in the **Block World** domain.

The syntax of objects file:
```

{
  "objects": {
    "default": "shapename",
    "predefine": {
      "shapename": [obj0,obj1,obj2...objn],
    },
    "custom": {
      "shapename": [customobj0,customobj1...customobjn],
    }
  }
}
```
The shapename could be anything shapename in the **shape** section.

Example:
```
{
  "objects": {
    "default": "node",
    "predefine": {
      "key": [
        "key0",
        "key1",
        "key2",
        "key3",
        "key4",
        "key5",
        "key6",
        "key7",
        "key8"
      ],
      "triangle": [
        "triangle"
      ],
      "diamond": [
        "diamond"
      ],
      "square": [
        "square"
      ],
      "circle": [
        "circle"
      ]
    },
    "customobj": [
      "circle":["robot"]
    ]
  }
}
```
## Versioning

1.0

## Limitations

### Planning domain API
The planning domain API could only solve the block problems that the total number of block is below 25, otherwise the API has high chance return timeout error

### Parser:
Current parser we wrote is not general, it works well with the domain file and problem file we provided which use the following predicates:
* (on ?x ?y)
* (on-table ?x)
* (clear ?x)
* (arm-free)
* (holding ?x)

And also all the text must be lowercases. We have provided an converter for the block problem PDDL.
```
line=re.sub(r"\bontable\b","on-table",line)
```

The code above will replace the text "ontable" to "on-table" .
You can add more lines like this to convert your predicates to the predicates we accept.

We will update and make our parse more genearl in the future sprint。

### Animation Profile
In this sprint the Animation Profile is create by ourself, it is written in Json, and the structure can not be changed.
In the next sprint we will create an UI for user to define the animation profile.

### Visualisation File Generator
The visualisation file generator is only work for the block domain at the moment. And it accept three kinds of objects:
* Block
* Claw
* Board

#### Block
The distributex function is used to given the x postion of the block(for predicate on-table),and currently it didn't remove
the block from space if a block is removed from table. 
For example: Given space of 4 slots => [a,b,c,4], if b is removed and e is distribute on the table, e will get the slot 4, 
because our algorithm didn't take b away. And it may cause the screen unnecessary wide.

This is not a bug, but a design decision. We will try to improve this algorithum in the next sprint.

#### Claw
The position of Claw is fixed which is defined in the animation profile, the postion of claw may looks weird for some problem PDDL.

We will try to implement an middle of screen funtion, to make claw always in the middle of the screen, Or we can make the Claw move around.



## Authors
* **Team Planning Visualisation** - *Initial work* -


## Acknowledgments

* Planning domain API (http://solver.planning.domains/)
