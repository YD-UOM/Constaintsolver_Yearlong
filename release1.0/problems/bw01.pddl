(define (problem blocksworld-10-0)
(:domain blocksworld)
(:objects d a h g b j e i f c )
(:init (clear c) (clear f) (on-table i) (on-table f) (on c e) (on e j) (on j b)
 (on b g) (on g h) (on h a) (on a d) (on d i) (arm-free))
(:goal (and (on d c) (on c f) (on f j) (on j e) (on e h) (on h b) (on b a) (on a g) (on g i))))