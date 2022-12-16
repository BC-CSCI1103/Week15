

type key = string
type 'a t = Empty
          | Node of { key   : string
                    ; value : 'a
                    ; next  : 'a t
                    }

let add key value map =
  match map with
  | Empty  -> Node { key; value; next = Empty }
  | Node _ -> Node { key; value; next = map }

let rec find key map =
  match map with
  | Empty -> failwith "Key not in map"
  | Node {key=key'; value; next } ->
    match key = key' with
    | true  -> value
    | false -> find key next
