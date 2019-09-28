let ( let>$ ) = React.S.bind
let ( let|$ ) x f = React.S.map f x
let ( and*$ ) a b = React.S.l2 (fun a b -> a, b) a b
let ( >>$ ) = React.S.bind
let ( >|$ ) x f = React.S.map f x
let ( <*$> ) a b = ( and*$ ) a b
