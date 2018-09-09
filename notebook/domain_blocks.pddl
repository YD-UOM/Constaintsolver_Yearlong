(define (animation blocksworld)

  (:predicate on
                 :parameters (?x ?y)

                 :precondition (and (?y.x) (?y.y) (?y.height))

                 :effect(
                 and 
                 (equal ?x.x ?y.x) 
                 (euqal ?x.y (sum ?y.y ?y.height))
                 )
  )

  (:predicate on-table

                 :parameters (?x)

                 :precondition ()

                 :effect(
                 (euqal ?x.x (function distributex)) #This line need future review
                 )

  (:predicate holding

                 :parameters (?x claw)

                 :precondition (and (claw.x) (claw.y))

                 :effect (
                 and 
                 (equal ?x.x claw.x) 
                 (equal ?x.y claw.y)
                 )

  )
  (:objects (default blockshape)
            (predefine ())
            (custom (clawshape claw) (boardshape board))
  )
  (:properties blockshape
              (showname false)
              (x false)
              (y false)
              (color (function randomcolor))#other options: (color (rgb 232 232 323))/(color black)/(color #332211)
              (width 80)
              (height 80)
              (base64image iVBORw0KGg...oAA)
  )

  (:properties clawshape
              (showname false)
              (x 230)
              (y 500)
              (color black)
              (width 80)
              (height 40)
              (base64image iVBORw0KGg...oAA)
  )
  (:properties boardshape
              (showname false)
              (x 0)
              (y 0)
              (color black)
              (width panel_size)
              (height 5)
              (base64image iVBORw0KGg...oAA)
  )

)