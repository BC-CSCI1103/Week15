(* file: map.ml
   author: Bob Muller

   CSCI 1103 Computer Science 1 Honors

   This is an implementation of maps using association lists.
*)
type key = string

type 'a t = Empty
          | Node of { key   : key
                    ; value : 'a
                    ; next  : 'a t
                    }

(* empty : 'a t *)
let empty = Empty

(* add : key -> 'a -> 'a t -> 'a t *)
let add key value map = Node {key; value; next = map}

(* find : key - 'a t -> 'a *)
let rec find key map =
  match map with
  | Empty -> failwith "no key"
  | Node { key = key1; value; next} ->
    let result = compare key key1
    in
    (if result = 0 then
       value
     else
       find key map)
